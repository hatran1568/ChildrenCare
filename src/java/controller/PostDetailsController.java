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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50)
public class PostDetailsController extends HttpServlet {

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
            case "/manager/post/details":
                showPostDetails(request, response);
                break;
            case "/manager/post/edit":
                showFormEditPost(request, response);
                break;
            case "/manager/post/update":
                updatePost(request, response);
                break;
            default:
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

    private void showPostDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        PostDAO postDB = new PostDAO();
        Post p = postDB.getPostById(pid);
        request.setAttribute("post", p);

        request.getRequestDispatcher("../../view/manager/post/details.jsp").forward(request, response);
    }

    private void showFormEditPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        PostDAO postDB = new PostDAO();
        Post p = postDB.getPostById(pid);
        request.setAttribute("post", p);
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> postCategories = settingDB.getSetting("Post category");
        request.setAttribute("categories", postCategories);
        request.getRequestDispatcher("../../view/manager/post/edit.jsp").forward(request, response);
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("file");
        String fileName = extractFileName(part);
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();

        part.write("/" + File.separator + fileName);
        int pid = Integer.parseInt(request.getParameter("pid")) ;
        int categoryID = Integer.parseInt(request.getParameter("postCategory")) ;
        String tilte = request.getParameter("title");
        String description = request.getParameter("description");
        boolean featured = request.getParameter("featured").equals("true");
        boolean status = request.getParameter("status").equals("true");
        
        PostDAO postDB = new PostDAO();
        Post oldPost = postDB.getPostById(pid);
        
        Post p = new Post();
        p.setThumbnailLink("assets/images/"+fileName);
        p.setTitle(tilte);
        PostCategory pc = new PostCategory();
        pc.setId(categoryID);
        p.setCategory(pc);
        p.setDescription(description);
        p.setStatus(status);
        p.setFeatured(featured);
        User a = new User();
        a.setId(oldPost.getAuthor().getId());
        p.setAuthor(a);
        p.setContent(oldPost.getContent());
        p.setId(pid);
        
        postDB.updatePost(p);
        response.sendRedirect("details?pid="+pid);
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

    public File getFolderUpload() {
        File folderUpload = new File(getServletContext().getInitParameter("ImageDirectory"));
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

}