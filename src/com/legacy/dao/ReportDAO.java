package com.legacy.dao;

import com.legacy.model.CustomerReport;
import com.legacy.model.ReportSummary;
import java.sql.*;
import java.util.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class ReportDAO {
    public List<CustomerReport> generateCustomerReports() throws SQLException {
        List<CustomerReport> reports = new ArrayList<>();
        
        String sql = 
            "SELECT " +
            "    c.name AS customer_name, " +
            "    COUNT(DISTINCT a.account_id) AS total_accounts, " +
            "    SUM(a.balance) AS total_balance, " +
            "    COUNT(t.transaction_id) AS transaction_count, " +
            "    MAX(ABS(t.amount)) AS largest_transaction, " +
            "    (COUNT(t.transaction_id) * SUM(a.balance)) / 1000 AS activity_score " +
            "FROM customers c " +
            "LEFT JOIN accounts a ON c.customer_id = a.customer_id " +
            "LEFT JOIN transactions t ON a.account_id = t.account_id " +
            "GROUP BY c.customer_id, c.name";

        try (Connection connection = DatabaseConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                CustomerReport report = new CustomerReport();
                report.setCustomerName(rs.getString("customer_name"));
                report.setTotalAccounts(rs.getInt("total_accounts"));
                report.setTotalBalance(rs.getDouble("total_balance"));
                report.setTransactionCount(rs.getInt("transaction_count"));
                report.setLargestTransaction(rs.getDouble("largest_transaction"));
                report.setActivityScore(rs.getDouble("activity_score"));
                
                // Calculate risk level based on activity score
                double activityScore = report.getActivityScore();
                if (activityScore > 1000) {
                    report.setRiskLevel("HIGH");
                } else if (activityScore > 500) {
                    report.setRiskLevel("MEDIUM");
                } else {
                    report.setRiskLevel("LOW");
                }
                
                reports.add(report);
            }
        }
        
        return reports;
    }

    private double calculateActivityScore(int transactionCount, double transactionVolume,
                                       int uniqueDays, Timestamp firstTransaction,
                                       Timestamp lastTransaction, double totalBalance,
                                       int totalAccounts) {
        double score = 0.0;

        // Base score from transaction frequency
        if (firstTransaction != null && lastTransaction != null) {
            long daysBetween = ChronoUnit.DAYS.between(
                firstTransaction.toLocalDateTime().toLocalDate(),
                lastTransaction.toLocalDateTime().toLocalDate()
            );
            if (daysBetween > 0) {
                double transactionsPerDay = (double) transactionCount / daysBetween;
                score += transactionsPerDay * 10;
            }
        }

        // Activity consistency factor
        if (firstTransaction != null && lastTransaction != null) {
            double consistencyRatio = (double) uniqueDays / 
                ChronoUnit.DAYS.between(
                    firstTransaction.toLocalDateTime().toLocalDate(),
                    lastTransaction.toLocalDateTime().toLocalDate().plusDays(1)
                );
            score += consistencyRatio * 25;
        }

        // Volume-based component
        if (totalBalance > 0) {
            double volumeRatio = transactionVolume / totalBalance;
            score += Math.min(volumeRatio * 15, 30);
        }

        // Account utilization factor
        if (totalAccounts > 0) {
            double averageTransactionsPerAccount = (double) transactionCount / totalAccounts;
            score += Math.min(averageTransactionsPerAccount * 5, 20);
        }

        // Transaction size variety factor
        if (transactionCount > 0) {
            double averageTransactionSize = transactionVolume / transactionCount;
            score += Math.min(averageTransactionSize / 1000, 15);
        }

        // Apply diminishing returns
        score = Math.min(100, score);
        score = Math.max(0, score);

        return score;
    }

    private String determineRiskLevel(double activityScore, double largestTransaction,
                                    double totalBalance, int transactionCount) {
        // Initialize base risk points
        double riskPoints = 0;

        // Activity score contribution
        if (activityScore > 80) riskPoints += 30;
        else if (activityScore > 60) riskPoints += 20;
        else if (activityScore > 40) riskPoints += 10;

        // Large transaction risk
        double largeTransactionRatio = totalBalance > 0 ? 
            largestTransaction / totalBalance : 0;
        if (largeTransactionRatio > 0.5) riskPoints += 30;
        else if (largeTransactionRatio > 0.3) riskPoints += 20;
        else if (largeTransactionRatio > 0.1) riskPoints += 10;

        // Transaction frequency risk
        if (transactionCount > 100) riskPoints += 20;
        else if (transactionCount > 50) riskPoints += 10;
        else if (transactionCount > 20) riskPoints += 5;

        // Balance size risk
        if (totalBalance > 100000) riskPoints += 20;
        else if (totalBalance > 50000) riskPoints += 10;
        else if (totalBalance > 10000) riskPoints += 5;

        // Determine risk level based on total points
        if (riskPoints >= 80) return "HIGH";
        else if (riskPoints >= 50) return "MEDIUM";
        else return "LOW";
    }

    public ReportSummary generateReportSummary(List<CustomerReport> reports) {
        ReportSummary summary = new ReportSummary();
        
        summary.setTotalCustomers(reports.size());
        
        double totalActivityScore = reports.stream()
            .mapToDouble(CustomerReport::getActivityScore)
            .sum();
        summary.setAverageActivityScore(reports.size() > 0 ? 
            totalActivityScore / reports.size() : 0);

        double totalVolume = reports.stream()
            .mapToDouble(r -> r.getTotalBalance())
            .sum();
        summary.setTotalTransactionVolume(totalVolume);

        return summary;
    }
}
