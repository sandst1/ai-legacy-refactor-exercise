package com.legacy.model;

public class CustomerReport {
    private String customerName;
    private int totalAccounts;
    private double totalBalance;
    private int transactionCount;
    private double largestTransaction;
    private double activityScore;
    private String riskLevel;

    // Getters and setters
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public int getTotalAccounts() { return totalAccounts; }
    public void setTotalAccounts(int totalAccounts) { this.totalAccounts = totalAccounts; }

    public double getTotalBalance() { return totalBalance; }
    public void setTotalBalance(double totalBalance) { this.totalBalance = totalBalance; }

    public int getTransactionCount() { return transactionCount; }
    public void setTransactionCount(int transactionCount) { this.transactionCount = transactionCount; }

    public double getLargestTransaction() { return largestTransaction; }
    public void setLargestTransaction(double largestTransaction) { this.largestTransaction = largestTransaction; }

    public double getActivityScore() { return activityScore; }
    public void setActivityScore(double activityScore) { this.activityScore = activityScore; }

    public String getRiskLevel() { return riskLevel; }
    public void setRiskLevel(String riskLevel) { this.riskLevel = riskLevel; }
}
