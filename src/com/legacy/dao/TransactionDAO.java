package com.legacy.dao;

import com.legacy.model.Transaction;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    public List<Transaction> getTransactions() throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM transactions";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setAccountId(rs.getInt("account_id"));
                transaction.setDate(rs.getTimestamp("date"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setType(rs.getString("type"));
                transactions.add(transaction);
            }
        }
        return transactions;
    }

    public Transaction getTransactionById(int id) throws SQLException {
        String query = "SELECT * FROM transactions WHERE transaction_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setAccountId(rs.getInt("account_id"));
                transaction.setDate(rs.getTimestamp("date"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setType(rs.getString("type"));
                return transaction;
            }
        }
        return null;
    }

    public void updateTransaction(Transaction transaction) throws SQLException {
        String query = "UPDATE transactions SET date=?, amount=?, type=? WHERE transaction_id=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setTimestamp(1, new Timestamp(transaction.getDate().getTime()));
            pstmt.setDouble(2, transaction.getAmount());
            pstmt.setString(3, transaction.getType());
            pstmt.setInt(4, transaction.getTransactionId());
            
            pstmt.executeUpdate();
        }
    }
}
