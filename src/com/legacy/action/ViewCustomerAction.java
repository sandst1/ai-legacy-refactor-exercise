package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.CustomerDAO;
import com.legacy.model.Customer;

public class ViewCustomerAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id = request.getParameter("id");
        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.getCustomerById(Integer.parseInt(id));
        request.setAttribute("customer", customer);
        return mapping.findForward("success");
    }
}
