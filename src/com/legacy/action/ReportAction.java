package com.legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;
import com.legacy.dao.ReportDAO;
import java.util.List;
import com.legacy.model.CustomerReport;
import com.legacy.model.ReportSummary;

public class ReportAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ReportDAO dao = new ReportDAO();
        List<CustomerReport> reports = dao.generateCustomerReports();
        ReportSummary summary = dao.generateReportSummary(reports);
        
        request.setAttribute("customerReports", reports);
        request.setAttribute("reportSummary", summary);
        
        return mapping.findForward("success");
    }
}
