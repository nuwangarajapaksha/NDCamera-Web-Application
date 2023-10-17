package com.jiat.ndcamera.listerners;

import com.jiat.ndcamera.providers.MailServiceProvider;
import com.jiat.ndcamera.util.BSUtil;

import javax.el.ELContextEvent;
import javax.el.ELContextListener;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.jsp.JspFactory;

@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        JspFactory.getDefaultFactory()
                .getJspApplicationContext(sce.getServletContext()).addELContextListener(new ELContextListener() {
                    @Override
                    public void contextCreated(ELContextEvent ece) {
                        ece.getELContext().getImportHandler().importClass(BSUtil.class.getName());
                    }
                });

        ServletContext context = sce.getServletContext();
        context.setAttribute("BASE_URL", context.getContextPath()+"/");

        MailServiceProvider.getInstance().start();
        System.out.println("MailServiceProvider: started...");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MailServiceProvider.getInstance().shutdown();
        System.out.println("MailServiceProvider: shutdown...");
    }
}
