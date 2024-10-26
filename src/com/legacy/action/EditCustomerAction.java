package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.CustomerDAO;
import com.legacy.form.CustomerForm;
import com.legacy.model.Customer;

public class EditCustomerAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        CustomerForm customerForm = (CustomerForm) form;
        CustomerDAO dao = new CustomerDAO();
        
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Save the changes
            Customer customer = new Customer();
            customer.setCustomerId(customerForm.getCustomerId());
            customer.setName(customerForm.getName());
            customer.setAddress(customerForm.getAddress());
            customer.setPhoneNumber(customerForm.getPhoneNumber());
            dao.updateCustomer(customer);
            return mapping.findForward("save");
        } else {
            // Load the customer for editing
            String id = request.getParameter("id");
            Customer customer = dao.getCustomerById(Integer.parseInt(id));
            customerForm.setCustomerId(customer.getCustomerId());
            customerForm.setName(customer.getName());
            customerForm.setAddress(customer.getAddress());
            customerForm.setPhoneNumber(customer.getPhoneNumber());
            return mapping.findForward("success");
        }
    }
}
