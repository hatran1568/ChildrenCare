/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Post;
import bean.PostCategory;
import bean.Setting;
import bean.Slider;
import bean.User;
import dao.PostDAO;
import dao.SettingDAO;
import dao.SliderDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50, location = "D:\\FPTU Materials\\Ky5_SUM21\\SWP\\source-new\\web\\assets\\images")
public class BlogController extends HttpServlet {


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
        switch (action) {
            case "/blog/list":
                showBlogList(request, response);
                break;
            case "/blog/details":
                showBlogDetails(request, response);
                break;
            default:
                break;
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
        String action = request.getServletPath();
        switch (action) {
            case "/blog/list":
                showBlogList(request, response);
                break;
            case "/blog/details":
                showBlogDetails(request, response);
                break;
            default:
                break;
        }
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

    protected void showBlogList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO postDB = new PostDAO();
        ArrayList<Post> posts = postDB.getPosts();

        ArrayList<PostCategory> categories = postDB.getCategories();
        String pattern = "dd-MM-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        request.setAttribute("simpleDateFormat", simpleDateFormat);
        request.setAttribute("categories", categories);
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("../view/public/blog/list.jsp").forward(request, response);
    }

    private void showBlogDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        PostDAO postDB = new PostDAO();
        Post p = postDB.getPostById(pid);
        request.setAttribute("post", p);

        request.getRequestDispatcher("../view/public/blog/details.jsp").forward(request, response);
    }
}
