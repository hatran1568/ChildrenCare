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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Setting;
import bean.User;
import dao.ReceiverDAO;
import dao.SettingDAO;
import java.io.File;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import util.EmailVerify;

@WebServlet(name = "UserProfileController", urlPatterns = {"/userprofile"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100, location = "C:\\Users\\ASUS\\Desktop\\Study Stuffs\\Kỳ 5 - Project\\NewNewCode\\web\\assets\\images\\avatar"   // 100 MB
)
public class UserProfileController extends HttpServlet {

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
            case "/userprofile":
                showUserProfile(request, response);
                break;
            case "/userprofile/edit":
                showEditForm(request, response);
                break;
            case "/userprofile/update":
                updateUserProfile(request, response);
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
    protected void showUserProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/homepage/userprofile.jsp").forward(request, response);
    }

    protected void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));

        UserDAO userDB = new UserDAO();
        User user = userDB.getUser(uid);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/view/homepage/userprofileedit.jsp").forward(request, response);
    }

    protected void updateUserProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        User oldu = (User) request.getSession().getAttribute("user");
        User u = new User();
        u.setId(oldu.getId());
        u.setFullName(request.getParameter("fullName"));
        u.setGender(Boolean.parseBoolean(request.getParameter("gender")));
        u.setMobile(request.getParameter("mobile"));
        u.setAddress(request.getParameter("address"));
            //Avatar
        Part part = request.getPart("imageLink");
        String fileName = extractFileName(part);
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        part.write("/" + File.separator + fileName);
        u.setImageLink("assets/images/avatar/" + fileName);
        
        UserDAO userDB = new UserDAO();
        File file = new File("C:\\Users\\ASUS\\Desktop\\Study Stuffs\\Kỳ 5 - Project\\NewNewCode\\web\\" + userDB.getUser(oldu.getId()).getImageLink());
        file.delete();
        
        userDB.updateUser(u);
        User newu = userDB.getUser(u.getId());
        request.getSession().setAttribute("user", newu);
        response.sendRedirect("../userprofile");
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
        } else if (list.get(0).getStatus().getId() != 13) {

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
        
        SettingDAO settingDB = new SettingDAO();
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
        u.setStatus(settingDB.getSettingById(13));
        userDb.addCustomer(u,-1);
        
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
            userDb.updateStatus(u, 14);
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
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
