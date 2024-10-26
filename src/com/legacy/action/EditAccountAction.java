package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.AccountDAO;
import com.legacy.form.AccountForm;
import com.legacy.model.Account;

public class EditAccountAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AccountForm accountForm = (AccountForm) form;
        AccountDAO dao = new AccountDAO();
        
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Save the changes
            Account account = new Account();
            account.setAccountId(accountForm.getAccountId());
            account.setCustomerId(accountForm.getCustomerId());
            account.setAccountType(accountForm.getAccountType());
            account.setBalance(accountForm.getBalance());
            dao.updateAccount(account);
            return mapping.findForward("save");
        } else {
            // Load the account for editing
            String id = request.getParameter("id");
            Account account = dao.getAccountById(Integer.parseInt(id));
            accountForm.setAccountId(account.getAccountId());
            accountForm.setCustomerId(account.getCustomerId());
            accountForm.setAccountType(account.getAccountType());
            accountForm.setBalance(account.getBalance());
            return mapping.findForward("success");
        }
    }
}
