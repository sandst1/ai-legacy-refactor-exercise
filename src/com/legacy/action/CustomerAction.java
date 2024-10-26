package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.CustomerDAO;
import com.legacy.form.CustomerForm;
import java.util.List;

public class CustomerAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                                 HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CustomerForm customerForm = (CustomerForm) form;
        CustomerDAO dao = new CustomerDAO();
        List customers = dao.getCustomers();
        request.setAttribute("customers", customers);
        return mapping.findForward("success");
    }
}
