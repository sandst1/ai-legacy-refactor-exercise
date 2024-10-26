package com.legacy.form;

import org.apache.struts.action.ActionForm;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class EditTransactionForm extends ActionForm {
    private Long transactionId;
    private Long accountId;
    private String date;  // Changed from Date to String
    private Double amount;
    private String type;
    
    // Remove the static dateFormat field since we'll handle date conversion in the Action class
    
    // Update getters and setters
    public Long getTransactionId() { return transactionId; }
    public void setTransactionId(Long transactionId) { this.transactionId = transactionId; }
    
    public Long getAccountId() { return accountId; }
    public void setAccountId(Long accountId) { this.accountId = accountId; }
    
    // Simplified date handling
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
