/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Role;
import bean.Setting;
import bean.User;
import bean.UserHistory;
import dao.SettingDAO;
import dao.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class ManagerCustomerController extends HttpServlet {

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
        String action = request.getServletPath();
        switch(action){
            case "/manager/customer/list":
                getCustomerList(request,response);
                break;
            case "/manager/customer/details":
                showCustomerDetails(request,response);
                break;
            case "/manager/customer/edit":
                editCustomer(request,response);
                break;
            case "/manager/customer/update":
                updateCustomer(request,response);
                break;
            case "/manager/customer/add":
                showFormAdd(request,response);
                break;
            case "/manager/customer/new":
                addCustomer(request,response);
                break;
            default:
                getCustomerList(request,response);
                break;
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void getCustomerList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserDAO userDB = new UserDAO();
        ArrayList<User> customers = userDB.getCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("../../view/manager/customer/list.jsp").forward(request, response);
    }

//    private void getCustomerByStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        boolean status = Integer.parseInt(request.getParameter("status")) == 1;
//        UserDAO userDB = new UserDAO();
//        ArrayList<User> customers = userDB.getCustomers();
//        ArrayList<User> filtered = new ArrayList<>();
//        for (User u:customers){
//            if (u.isStatus())
//                filtered.add(u);
//        }  
//        String json = new Gson().toJson(filtered);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(json);
////        request.setAttribute("customers", filtered);
////        request.getRequestDispatcher("../../../view/manager/customer/list.jsp").forward(request, response);
//    }

    private void showCustomerDetails(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        int uid = Integer.parseInt(request.getParameter("uid"));
        UserDAO userDB = new UserDAO();
        User user = userDB.getUser(uid);
        request.setAttribute("user", user);
        
        ArrayList<UserHistory> history = userDB.getUserHistory(uid);
        request.setAttribute("history", history);
        request.getRequestDispatcher("../../view/manager/customer/details.jsp").forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        UserDAO userDB = new UserDAO();
        User user = userDB.getUser(uid);
        request.setAttribute("user", user);
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> roles = settingDB.getSetting("Role");
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../../view/manager/customer/edit.jsp").forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = new User();
        User u1 = (User)request.getSession().getAttribute("user");
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setGender(request.getParameter("gender").equals("male"));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
        u.setMobile(request.getParameter("mobile"));
        Setting s = new Setting();
        s.setId(Integer.parseInt(request.getParameter("status")));
        u.setStatus(s);
        Role r = new Role();
        r.setId(4);
        u.setRole(r);
        UserDAO userDB = new UserDAO();

        userDB.updateWithoutPassword(u, u1.getId());
        response.sendRedirect("list");

    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> roles = settingDB.getSetting("Role");
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("../../view/manager/customer/add.jsp").forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         User u = new User();
        User u1 = (User)request.getSession().getAttribute("user");
        
        u.setEmail(request.getParameter("email"));
        
        
        int leftLimit = 97; // letter 'a'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(targetStringLength);
        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String password = buffer.toString();
        u.setPassword(password);
        u.setAddress(request.getParameter("address"));
        u.setGender(request.getParameter("gender").equals("male"));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
        u.setMobile(request.getParameter("mobile"));
        
        Role r = new Role();
        r.setId(4);
        u.setRole(r);
        UserDAO userDB = new UserDAO();
        userDB.addCustomer(u, u1.getId());
        response.sendRedirect("list");
    }
    
    
}
