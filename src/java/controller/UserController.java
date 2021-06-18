/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Receiver;
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
import dao.ReceiverDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import ulti.EmailVerify;

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
            case "/admin/user/details":
                showUserDetails(request, response);
                break;
            case "/admin/user/new":
                showAddForm(request, response);
                break;
            case "/admin/user/insert":
                addUser(request, response);
                break;
            case "/admin/user/delete":
                deleteUser(request, response);
                break;
            case "/admin/user/edit":
                showEditForm(request, response);
                break;
            case "/admin/user/update":
                editUser(request, response);
                break;
            case "/admin/user/list":
                showListUser(request, response);
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
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void showListUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String r_pagesize = getServletContext().getInitParameter("pagesize");
//        int pagesize = Integer.parseInt(r_pagesize);
//
//        String r_pageindex = request.getParameter("page");
//        if (r_pageindex == null) {
//            r_pageindex = "1";//validation
//        }
//        int pageindex = Integer.parseInt(r_pageindex);
//
//        UserDAO db = new UserDAO();
//        int count = db.count();
//        int totalpage = (count % pagesize == 0)
//                ? count / pagesize
//                : count / pagesize + 1;
//        String url = "list";
//        
        UserDAO userDB = new UserDAO();
        ArrayList<User> users = userDB.getAllUsers();
        request.setAttribute("users", users);
//        request.setAttribute("totalpage", totalpage);
//        request.setAttribute("pageindex", pageindex);
//        request.setAttribute("paggerUrl", url);
        request.getRequestDispatcher("../../view/user/list.jsp").forward(request, response);
    }

    protected void showUserDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDB = new UserDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDB.getUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("../../view/user/details.jsp").forward(request, response);
    }
    
    protected void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User u = new User();
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setGender(Boolean.parseBoolean(request.getParameter("gender")));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
            //Generate a random password with 9 numbers in the range of 0 to 9
        int[] generatePassword = new int[10];
        String password = "CRS";
        for (int i = 0; i < 9; i++) {
            generatePassword[i] = (int) (Math.random()*10);
            password += Integer.toString(generatePassword[i]);
        }
        u.setPassword(password);
        u.setMobile(request.getParameter("mobile"));
        Role r = new Role();
        r.setId(Integer.parseInt(request.getParameter("role")));
        u.setRole(r);
        u.setImageLink("None");
        u.setStatus(Boolean.parseBoolean(request.getParameter("status")));
        UserDAO userDB = new UserDAO();
        userDB.addUser(u, u.isStatus());
        EmailVerify e = new EmailVerify();
        String emailContent = "Your password for the Children Care System: " + password;
        try {
            e.sendText(userDB.getUserByEmail(request.getParameter("email")), emailContent);
        } catch (MessagingException ex) {
            Logger.getLogger(ReservationCompletionController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

        request.getRequestDispatcher("../../view/user/edit.jsp").forward(request, response);
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setStatus(Boolean.parseBoolean(request.getParameter("status")));
        Role r = new Role();
        r.setId(Integer.parseInt(request.getParameter("role")));
        u.setRole(r);
        UserDAO userDB = new UserDAO();
        userDB.updateByAdmin(u);
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
        
        request.getRequestDispatcher("../../view/user/add.jsp").forward(request, response);
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

        userDb.addCustomer(u, false);
        
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
