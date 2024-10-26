package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.TransactionDAO;
import com.legacy.form.TransactionForm;
import java.util.List;
import java.text.SimpleDateFormat;

public class TransactionAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        TransactionForm transactionForm = (TransactionForm) form;
        TransactionDAO dao = new TransactionDAO();
        
        // Convert date string to Date object if needed
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        List transactions = dao.getTransactions();
        request.setAttribute("transactions", transactions);
        return mapping.findForward("success");
    }
}
