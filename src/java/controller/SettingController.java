/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Receiver;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Setting;
import bean.User;
import dao.ReceiverDAO;
import dao.SettingDAO;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import util.EmailVerify;

@WebServlet(name = "SettingController", urlPatterns = {"/setting"})
public class SettingController extends HttpServlet {

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
            out.println("<h1>Servlet UserController at " + request.getServletPath() + "</h1>");
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
            case "/admin/setting/new":
                showAddForm(request, response);
                break;
            case "/admin/setting/insert":
                addSetting(request, response);
                break;
            case "/admin/setting/delete":
                deleteSetting(request, response);
                break;
            case "/admin/setting/edit":
                showEditForm(request, response);
                break;
            case "/admin/setting/details":
                showSettingDetails(request, response);
                break;
            case "/admin/setting/update":
                editSetting(request, response);
                break;
            case "/admin/setting/list":
                showListSetting(request, response);
                break;
            case "/login":
                login(request, response);
                break;
            case "/register":
                register(request, response);
                break;
            case "/verify": {
                try {
                    verify(request, response);
                } catch (MessagingException ex) {
                    Logger.getLogger(SettingController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
            case "/verifying":
                verifying(request, response);
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
    protected void showListSetting(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> settings = settingDB.getSettings();
        request.setAttribute("settings", settings);
        request.getRequestDispatcher("../../view/settings/list.jsp").forward(request, response);
    }
    
    protected void showSettingDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SettingDAO settingDB = new SettingDAO();
        Setting setting = settingDB.getSetting(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("setting", setting);
        request.getRequestDispatcher("../../view/settings/details.jsp").forward(request, response);
    }

    protected void addSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Setting s = new Setting();
        if (request.getParameter("newtype").isEmpty())
            s.setType(request.getParameter("type"));
        else s.setType(request.getParameter("newtype"));
        s.setName(request.getParameter("settingname"));
        s.setValue(Integer.parseInt(request.getParameter("value")));
        s.setDescription(request.getParameter("description"));
        s.setStatus(request.getParameter("status"));

        SettingDAO settingDB = new SettingDAO();
        settingDB.addSetting(s);

        response.sendRedirect("list");
    }

    protected void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("id"));

        SettingDAO settingDB = new SettingDAO();
        Setting setting = settingDB.getSetting(sid);
        ArrayList<Setting> settings = settingDB.getSettings();
        ArrayList<String> typeList = new ArrayList<>();
        for (Setting s : settings) 
            typeList.add(s.getType());
        Set<String> uniqueTypes = new HashSet<String>(typeList);
        request.setAttribute("uniqueTypes", uniqueTypes);
        request.setAttribute("setting", setting);
//        request.setAttribute("uid", uid);

        request.getRequestDispatcher("../../view/settings/edit.jsp").forward(request, response);
    }

    protected void editSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Setting s = new Setting();
        s.setId(Integer.parseInt(request.getParameter("id")));
        if (request.getParameter("newtype").isEmpty())
            s.setType(request.getParameter("type"));
        else s.setType(request.getParameter("newtype"));
        s.setName(request.getParameter("settingname"));
        s.setValue(Integer.parseInt(request.getParameter("value")));
        s.setDescription(request.getParameter("description"));
        s.setStatus(request.getParameter("status"));
        
        SettingDAO settingDB = new SettingDAO();
        settingDB.update(s);
        response.sendRedirect("list");
    }

    protected void deleteSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int sid = Integer.parseInt(request.getParameter("sid"));
        SettingDAO settingDB = new SettingDAO();
        settingDB.delete(sid);
        response.sendRedirect("list");

    }

    protected void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> settings = settingDB.getSettings();
        ArrayList<String> typeList = new ArrayList<>();
        for (Setting s : settings) 
            typeList.add(s.getType());
        Set<String> uniqueTypes = new HashSet<String>(typeList);
        request.setAttribute("uniqueTypes", uniqueTypes);
        request.getRequestDispatcher("../../view/settings/add.jsp").forward(request, response);
    }

    
    //Login function using session
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        //check if there is any alert from system
        String message = request.getParameter("message");

        if (message != null) {
            if (message.equals("notpermission")) {
                String mess = "You are not allowed to asscess this page!";

                request.getSession().setAttribute("mess", mess);
            }
            if (message.equals("notlogin")) {
                String mess = "Not Log in!";
                request.getSession().setAttribute("mess", mess);
            }
        }

        UserDAO userDb = new UserDAO();
        ArrayList<User> list = new ArrayList<User>();
        
        //get email and pass from client
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
        //search result in Database
        list = userDb.searchUserByEmailAndPass(email, pass);
        
        //if user not exist alert wrong email or password
        if (list.size() == 0) {
            String alert = "Wrong email or password";
            request.getSession().setAttribute("alert", alert);
            response.sendRedirect("home");
            return;
        
         // if user was verify redirect to home page
        } else if (list.get(0).isStatus() == true) {

            HttpSession session = request.getSession();
            session.setAttribute("user", list.get(0));
            response.sendRedirect("home");
            return;
            
            
        //if user was not verify alert that verify needed and forward to verify page
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", list.get(0));
            String alert = "Please Verify your account!";
            String verify = "verify";
            request.getSession().setAttribute("alert", alert);
            request.getSession().setAttribute("verify", verify);
            request.setAttribute("email", list.get(0).getEmail());
            request.getRequestDispatcher("verify").forward(request, response);

        }

    }
    
    
    //Register Function
    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        //Get user information from Client
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String phone = request.getParameter("phone");
        String fullnames = request.getParameter("fullname");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");

        UserDAO userDb = new UserDAO();
        
        //search if email was registed before
        ArrayList<User> list = new ArrayList<User>();
        list = userDb.searchUserByEmail(email);
        
        //if some field input was empty alert and redirect to homepage
        if (email.length() == 0 || pass.length() == 0 || phone.length() == 0 || fullnames.length() == 0 || address.length() == 0 || gender == null) {
            String alert = "Please Enter all field!";
            request.getSession().setAttribute("alert", alert);
            response.sendRedirect("home");
            return;

        }
        
        //if email was existed in system alert and redirect to homepage
        if (list.size() > 0) {
            String alert = "Email had been registed! Please enter another Email!";
            request.getSession().setAttribute("alert", alert);
            response.sendRedirect("home");
            return;

        }
        
        //if email not exist insert user to Database with status false
        User u = new User();
        u.setAddress(address);
        u.setEmail(email);
        u.setFullName(fullnames);
        u.setPassword(pass);
        u.setMobile(phone);

        if (gender.equals("male")) {
            u.setGender(true);
        } else {
            u.setGender(false);
        }

        userDb.addCustomer(u, false,2);

        
        //Forward to verify page to verify via email
        request.setAttribute("email", email);
        request.getRequestDispatcher("verify").forward(request, response);
    }

    
    //Send email to verify
    protected void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
        
        //Generate verify code
        String code = EmailVerify.getInstance().getRandom();
        String email = (String) request.getAttribute("email");
        User u = new User();
        u.setEmail(email);
        
        //Send email with verify code and forward to verify page
        EmailVerify.getInstance().sendText(u, code);
        request.setAttribute("email", email);
        request.setAttribute("code", code);
        request.getRequestDispatcher("/view/homepage/verify.jsp").forward(request, response);
    }
    
    
    //Check user input verify code
    protected void verifying(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = (String) request.getParameter("email");

        User u = new User();
        u.setEmail(email);

        String code = request.getParameter("code");

        String actual = request.getParameter("actualcode");

        UserDAO userDb = new UserDAO();
        
        //Check if user input true code and set status to true
        if (code.equals(actual)) {
            userDb.updateStatus(u, true);
            String alert = "Register Successfully!";
            User user = new User();
            ArrayList<User> list = new ArrayList<User>();
            list = userDb.searchUserByEmail(email);
            user = list.get(0);
            ReceiverDAO receiverDb = new ReceiverDAO();
            Receiver r = new Receiver();
            r.setEmail(email);
            r.setAddress(user.getAddress());
            r.setFullName(user.getFullName());
            r.setUser(user);
            r.setGender(user.isGender());
            r.setMobile(user.getMobile());
            if(!receiverDb.checkExistingReceiver(email))
            receiverDb.addReceiver(r);
            request.getSession().setAttribute("alert", alert);
            response.sendRedirect("home");
        
        //If code is wrong back to verify page
        } else {
            request.setAttribute("email", email);
            request.getRequestDispatcher("verify").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
