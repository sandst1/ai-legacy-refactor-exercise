package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.TransactionDAO;
import com.legacy.model.Transaction;

public class ViewTransactionAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id = request.getParameter("id");
        TransactionDAO dao = new TransactionDAO();
        Transaction transaction = dao.getTransactionById(Integer.parseInt(id));
        request.setAttribute("transaction", transaction);
        return mapping.findForward("success");
    }
}
