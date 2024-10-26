package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.AccountDAO;
import com.legacy.form.AccountForm;
import java.util.List;

public class AccountAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AccountForm accountForm = (AccountForm) form;
        AccountDAO dao = new AccountDAO();
        List accounts = dao.getAccounts();
        request.setAttribute("accounts", accounts);
        return mapping.findForward("success");
    }
}
