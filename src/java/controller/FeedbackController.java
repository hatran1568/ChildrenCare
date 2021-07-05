/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Feedback;
import bean.Post;
import bean.Service;
import bean.Setting;
import bean.Slider;
import dao.FeedbackDAO;
import dao.PostDAO;
import dao.SettingDAO;
import dao.SliderDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ACER
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50, location = "C:\\Users\\ACER\\Desktop\\SWP\\web\\assets\\images")
@WebServlet(name = "FeedbackController", urlPatterns = {"/feedback"})
public class FeedbackController extends HttpServlet {

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
            out.println("<title>Servlet FeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
            case "/feedback":
                showFeedbackForm(request, response);
                break;
            case "/feedback/add":
                insertFeedBack(request, response);
                break;
            case "/manager/feedback/details":
                showFeedbackDetails(request, response);
                break;
            case "/manager/feedback/update":
                updateStatus(request, response);
                break;
            case "/manager/feedback/list":
                showFeedbackList(request, response);
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
        this.doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    protected void showFeedbackForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String r_id = request.getParameter("id");
        int id;
        if (r_id == null) {
            id = 0;
        } else {
            id = Integer.parseInt(r_id);
        }

        request.setAttribute("id", id);
        request.getRequestDispatcher("view/feedback/feedback.jsp").forward(request, response);
    }

    protected void insertFeedBack(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part part = request.getPart("file");
        String fileName = "#";
        if (part != null) {
            fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write("/" + File.separator + fileName);
        }

        String fullname = request.getParameter("fullname");
        String r_gender = request.getParameter("gender");
        boolean gender = Boolean.parseBoolean(r_gender);

        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String r_star = request.getParameter("star");
        int star = 0;
        if (r_star != null) {
            star = Integer.parseInt(r_star);
        }
        int sid = Integer.parseInt(request.getParameter("sid"));
        String note = request.getParameter("note");
        Feedback f = new Feedback();
        f.setEmail(email);
        f.setFullName(fullname);
        f.setMobile(mobile);
        f.setGender(gender);
        f.setImageLink("assets/images/" + fileName);
        f.setContent(note);
        f.setRatedStar(star);
        Service s = new Service();
        s.setId(sid);
        FeedbackDAO feedbackDB = new FeedbackDAO();
        f.setService(s);
        if (sid == 0) {
            feedbackDB.insertGeneralFeedback(f);
        } else {
            feedbackDB.insertFeedback(f);
        }
        request.getSession().setAttribute("mess", "Feedback Successfully");
        response.sendRedirect("../home");
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

    protected void showFeedbackDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int fid = Integer.parseInt(id);
        FeedbackDAO feedbackDB = new FeedbackDAO();
        Feedback f = new Feedback();
        f = feedbackDB.getFeedbackById(fid);
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> list = new ArrayList<>();
        list = settingDB.getSetting("Feedback Status");
        request.setAttribute("Status", list);
        request.setAttribute("f", f);
        request.getRequestDispatcher("../../view/feedback/details.jsp").forward(request, response);
    }

    protected void updateStatus(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("fid");
        int fid = Integer.parseInt(id);
        FeedbackDAO feedbackDB = new FeedbackDAO();
        int status = Integer.parseInt(request.getParameter("status"));
        Setting s = new Setting();
        s.setId(fid);
        feedbackDB.updateStatus(fid, s);
    }

    protected void showFeedbackList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FeedbackDAO feedbackDB = new FeedbackDAO();
        ArrayList<Feedback> feedbacks = feedbackDB.getFeedbacks();
        request.setAttribute("feedbacks", feedbacks);
        PostDAO postDB = new PostDAO();
        ArrayList<Post> posts = postDB.getPosts();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("../../view/feedback/list.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
