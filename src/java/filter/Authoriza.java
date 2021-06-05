/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import bean.User;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
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
public class Authoriza implements Filter {

  
    private ServletContext context;
    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 

    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }


  
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();

        if (url.startsWith("/admin")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getId() == 1) {
                    chain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
            }

        } else if (url.startsWith("/manager")) {
            User u = (User) request.getSession().getAttribute("user");

            if (u != null) {

                if (u.getRole().getId() == 2) {
                    chain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=notpermission");
                }

            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=notlogin");
            }
        } else {
            chain.doFilter(servletRequest, servletResponse);
        }
    }

   
    public void destroy() {
    }

  
   

}
