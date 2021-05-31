/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Role;
import bean.User;

/**
 *
 * @author ACER
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getServletPath()+ "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String action = request.getServletPath();
       
        switch (action) {
            case "/user/new":
                showAddForm(request, response);
                break;
            case "/user/insert":
                addUser(request, response);
                break;
            case "/user/delete":
                deleteUser(request, response);
                break;
            case "/user/edit":
                showEditForm(request, response);
                break;
            case "/user/update":
                editUser(request, response);
                break;
            case "/user/list":
                showListUser(request, response);
                break;
            default:
               
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    protected void showListUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String r_pagesize = getServletContext().getInitParameter("pagesize");
        int pagesize = Integer.parseInt(r_pagesize);

        String r_pageindex = request.getParameter("page");
        if (r_pageindex == null) {
            r_pageindex = "1";//validation
        }
        int pageindex = Integer.parseInt(r_pageindex);

        UserDAO db = new UserDAO();
        int count = db.count();
        int totalpage = (count % pagesize == 0)
                ? count / pagesize
                : count / pagesize + 1;
        String url = "list";
        ArrayList<User> accounts = db.getUsers(pageindex, pagesize);
        request.setAttribute("accounts", accounts);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("paggerUrl", url);
        request.getRequestDispatcher("/view/account/list.jsp").forward(request, response);
    }

    protected void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setGender(request.getParameter("gender").equals("male"));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
        u.setPassword("admin");
        u.setMobile(request.getParameter("mobile"));
        Role r = new Role();
        r.setId(Integer.parseInt(request.getParameter("role")));
        u.setRole(r);

        UserDAO userDB = new UserDAO();
        userDB.addUser(u);

        response.sendRedirect("list");
    }

    protected void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoleDAO roleDB = new RoleDAO();
        ArrayList<Role> roles = roleDB.getRoles();
        request.setAttribute("roles", roles);

        int uid = Integer.parseInt(request.getParameter("id"));

        UserDAO userDB = new UserDAO();
        User user = userDB.getUser(uid);

        request.setAttribute("user", user);
//        request.setAttribute("uid", uid);

        request.getRequestDispatcher("../view/account/edit.jsp").forward(request, response);
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setGender(request.getParameter("gender").equals("male"));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
        u.setPassword(request.getParameter("password"));
        u.setMobile(request.getParameter("mobile"));
        Role r = new Role();
        r.setId(Integer.parseInt(request.getParameter("role")));
        u.setRole(r);

        UserDAO userDB = new UserDAO();
        userDB.update(u);
        response.sendRedirect("list");
    }

    protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDAO db = new UserDAO();
        db.delete(id);
        response.sendRedirect("list");
    }

    protected void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoleDAO roleDB = new RoleDAO();
        ArrayList<Role> roles = roleDB.getRoles();
        request.setAttribute("roles", roles);

        request.getRequestDispatcher("../view/account/add.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
