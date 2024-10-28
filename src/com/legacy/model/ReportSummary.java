package com.legacy.model;

public class ReportSummary {
    private int totalCustomers;
    private double averageActivityScore;
    private double totalTransactionVolume;

    // Getters and setters
    public int getTotalCustomers() { return totalCustomers; }
    public void setTotalCustomers(int totalCustomers) { this.totalCustomers = totalCustomers; }

    public double getAverageActivityScore() { return averageActivityScore; }
    public void setAverageActivityScore(double averageActivityScore) { this.averageActivityScore = averageActivityScore; }

    public double getTotalTransactionVolume() { return totalTransactionVolume; }
    public void setTotalTransactionVolume(double totalTransactionVolume) { this.totalTransactionVolume = totalTransactionVolume; }
}
