package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.TransactionDAO;
import com.legacy.form.EditTransactionForm;
import com.legacy.model.Transaction;
import java.text.SimpleDateFormat;

public class EditTransactionAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        EditTransactionForm transactionForm = (EditTransactionForm) form;
        TransactionDAO dao = new TransactionDAO();
        
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Save the changes
            Transaction transaction = new Transaction();
            transaction.setTransactionId(transactionForm.getTransactionId().intValue());
            transaction.setAccountId(transactionForm.getAccountId().intValue());
            // Parse the date string to Date object
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            transaction.setDate(dateFormat.parse(transactionForm.getDate()));
            transaction.setAmount(transactionForm.getAmount());
            transaction.setType(transactionForm.getType());
            dao.updateTransaction(transaction);
            return mapping.findForward("save");
        } else {
            // Load the transaction for editing
            String id = request.getParameter("id");
            Transaction transaction = dao.getTransactionById(Integer.parseInt(id));
            transactionForm.setTransactionId(Long.valueOf(transaction.getTransactionId()));
            transactionForm.setAccountId(Long.valueOf(transaction.getAccountId()));
            // Format the date to string
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            transactionForm.setDate(dateFormat.format(transaction.getDate()));
            transactionForm.setAmount(transaction.getAmount());
            transactionForm.setType(transaction.getType());
            return mapping.findForward("success");
        }
    }
}
