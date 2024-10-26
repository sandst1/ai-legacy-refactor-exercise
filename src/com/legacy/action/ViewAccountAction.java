package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.AccountDAO;
import com.legacy.model.Account;

public class ViewAccountAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id = request.getParameter("id");
        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccountById(Integer.parseInt(id));
        request.setAttribute("account", account);
        return mapping.findForward("success");
    }
}
