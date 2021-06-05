/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import bean.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class Authorization implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest Servletrequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) Servletrequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getServletPath();

        if (url.startsWith("/admin")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Admin")) {
                    chain.doFilter(Servletrequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
            }

        } else if (url.startsWith("/manager")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getName().equals("Manager")) {
                    chain.doFilter(Servletrequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
            }
        } else {
            chain.doFilter(Servletrequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
