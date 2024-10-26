package com.legacy.init;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import javax.servlet.ServletException;
import org.apache.struts.action.ActionServlet;

public class ApplicationInitializer implements PlugIn {
    public void init(ActionServlet servlet, ModuleConfig config) throws ServletException {
        DateConverter converter = new DateConverter(null);
        converter.setPattern("yyyy-MM-dd");
        ConvertUtils.register(converter, java.util.Date.class);
    }

    public void destroy() {
        // Nothing to clean up
    }
}
