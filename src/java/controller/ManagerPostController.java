/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Post;
import bean.PostCategory;
import bean.Setting;
import bean.User;
import dao.PostDAO;
import dao.SettingDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 10)
public class ManagerPostController extends HttpServlet {


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
            case "/manager/post/list":
                showListPost(request, response);
                break;
            case "/manager/post/add":
                showFormAddPost(request, response);
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
            case "/manager/post/list":
                showListPost(request, response);
                break;
            case "/manager/post/add":
                addPost(request, response);
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

    protected void showListPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO postDB = new PostDAO();
        ArrayList<Post> posts = postDB.getPosts();

        ArrayList<PostCategory> categories = postDB.getCategories();
        String pattern = "dd-MM-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        request.setAttribute("simpleDateFormat", simpleDateFormat);
        request.setAttribute("categories", categories);
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("../../view/manager/post/list.jsp").forward(request, response);
    }

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
        Post p = new Post();
        int pid = Integer.parseInt(request.getParameter("pid"));
        int categoryID = Integer.parseInt(request.getParameter("postCategory"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        boolean featured = Boolean.valueOf( request.getParameter("featured"));
        Setting status = new Setting();
        status.setId(Integer.parseInt(request.getParameter("status")));
        
        PostDAO postDB = new PostDAO();
        Post oldPost = postDB.getPostById(pid);

        Part part = request.getPart("file");
        String fileName = extractFileName(part);
        InputStream inputStream;
        FileOutputStream fileOutputStream;
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        p.setTitle(title);
        PostCategory pc = new PostCategory();
        pc.setId(categoryID);
        p.setCategory(pc);
        p.setDescription(description);
        p.setStatus(status);
        p.setFeatured(featured);
        User a = new User();
        a.setId(oldPost.getAuthor().getId());
        p.setAuthor(a);
        p.setContent(content);
        p.setId(pid);
        
        
        if (fileName.trim().length()==0){
            p.setThumbnailLink(oldPost.getThumbnailLink());
            postDB.updatePost(p);
        }else{
            inputStream = request.getPart(part.getName()).getInputStream();
        
            // refines the fileName in case it is an absolute path
            int i = inputStream.available();
            byte[] b = new byte[i];
            inputStream.read(b);
            fileName = extractFileName(part);

            String pathName = getFolderUpload()+"\\" + fileName;
            System.out.println(fileName);
            fileOutputStream  = new FileOutputStream(pathName);
            fileOutputStream.write(b);
            inputStream.close();
            fileOutputStream.close();
            p.setThumbnailLink("assets/images/"+fileName);
            File file = new File(getFolderUpload() + "\\..\\..\\"  + postDB.getPostById(pid).getThumbnailLink());
            file.delete();
            postDB.updatePost(p);
        }
        
        
        response.sendRedirect("details?pid=" + pid);
    }

    private void showFormAddPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> categories = settingDB.getSetting("Post category");
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("../../view/manager/post/add.jsp").forward(request, response);
    }
    private void addPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Post p = new Post();
        int categoryID = Integer.parseInt(request.getParameter("postCategory"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        boolean featured = Boolean.valueOf( request.getParameter("featured"));
        Setting status = new Setting();
        status.setId(Integer.parseInt(request.getParameter("status")));
        
        PostDAO postDB = new PostDAO();

        Part part = request.getPart("file");
        String fileName = extractFileName(part);
        InputStream inputStream;
        FileOutputStream fileOutputStream;
        // refines the fileName in case it is an absolute path
        fileName = new File(fileName).getName();
        p.setTitle(title);
        PostCategory pc = new PostCategory();
        pc.setId(categoryID);
        p.setCategory(pc);
        p.setDescription(description);
        p.setStatus(status);
        p.setFeatured(featured);
        User a = (User) request.getSession().getAttribute("user");
        p.setAuthor(a);
        p.setContent(content);
        
        int id = 0;
        if (fileName.trim().length()==0){
            p.setThumbnailLink(fileName);
            id = postDB.addPost(p);
        }else{
            inputStream = request.getPart(part.getName()).getInputStream();
        
            // refines the fileName in case it is an absolute path
            int i = inputStream.available();
            byte[] b = new byte[i];
            inputStream.read(b);
            fileName = extractFileName(part);

            String pathName = getFolderUpload()+"\\" + fileName;
            System.out.println(fileName);
            fileOutputStream  = new FileOutputStream(pathName);
            fileOutputStream.write(b);
            inputStream.close();
            fileOutputStream.close();
            p.setThumbnailLink("assets/images/"+fileName);
            id = postDB.addPost(p);
        }
        
        
        response.sendRedirect("details?pid=" + id);
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
        File folderUpload = new File(getServletContext().getRealPath("/") + "..\\..\\web\\assets\\images");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

}
