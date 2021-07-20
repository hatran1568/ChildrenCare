package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import bean.Slider;
import com.google.gson.Gson;
import dao.SliderDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
        maxRequestSize = 1024 * 1024 * 50, location = "swp\\") // 50MB
public class SliderController extends HttpServlet {

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
            out.println("<title>Servlet SliderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderController at " + request.getContextPath() + "</h1>");
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
            case "/manager/slider/list":
                showListPagination(request, response);
                break;
            case "/manager/slider/change":
                changeStatus(request, response);
                break;
            case "/manager/slider/search":
                search(request, response);
                break;
            case "/manager/slider/details":
                showSliderDetails(request, response);
                break;
            case "/manager/slider/add":
                showFormAddSlider(request, response);
                break;
            case "/manager/slider/insert":
                saveFile(request, response);
                break;
            case "/manager/slider/edit":
                showEditForm(request, response);
                break;
            case "/manager/slider/update":
                Update(request, response);
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

    public void showListPagination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String r_index = request.getParameter("page");
        if (r_index == null) {
            r_index = "1";
        }
        int index = Integer.parseInt(r_index);
        SliderDAO sliderDB = new SliderDAO();
        ArrayList<Slider> list = new ArrayList<Slider>();
        int count = sliderDB.count();
        int totalpage = (count % 12 == 0)
                ? count / 12
                : count / 12 + 1;
        list = sliderDB.getSliderPagination(index, 12);
        ArrayList<Slider> allList = new ArrayList<Slider>();
        allList = sliderDB.getAllSliders();
        request.setAttribute("all", allList);
        request.setAttribute("list", list);
        request.setAttribute("totalPage", totalpage);
        request.setAttribute("index", index);
        request.setAttribute("url", "list");
        request.getRequestDispatcher("../../view/manager/slider/newlist.jsp").forward(request, response);
    }

    public void changeStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Slider s = new Slider();
        SliderDAO sliderDB = new SliderDAO();
        s = sliderDB.getSliderByID(id);
        if (s.isStatus() == true) {
            sliderDB.setStatus(false, s);
        } else {
            sliderDB.setStatus(true, s);
        }
        s = sliderDB.getSliderByID(id);
        Map<String, Boolean> options = new LinkedHashMap<>();

        options.put("status", s.isStatus());
        String json = new Gson().toJson(options);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

    public void showFormAddSlider(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../../view/manager/slider/add.jsp").forward(request, response);
    }

    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String status = request.getParameter("status");
        String r_index = request.getParameter("page");
        if (search == null) {
            search = "";
        }
        if (r_index == null) {
            r_index = "1";
        }
        if (status.equals("none")) {
            int index = Integer.parseInt(r_index);
            SliderDAO sliderDB = new SliderDAO();
            ArrayList<Slider> list = new ArrayList<Slider>();
            int count = sliderDB.count(search);
            int totalpage = (count % 12 == 0)
                    ? count / 12
                    : count / 12 + 1;
            list = sliderDB.searchSliderPagination(index, 12, search);
            request.setAttribute("list", list);
            request.setAttribute("totalPage", totalpage);
            request.setAttribute("index", index);
            request.setAttribute("url", "search");
            request.setAttribute("search", search);
            request.setAttribute("status", status);
            request.getRequestDispatcher("../../view/manager/slider/search.jsp").forward(request, response);
        } else {
            boolean sta = Boolean.parseBoolean(status);
            int index = Integer.parseInt(r_index);
            SliderDAO sliderDB = new SliderDAO();
            ArrayList<Slider> list = new ArrayList<Slider>();
            int count = sliderDB.count(search, sta);
            int totalpage = (count % 12 == 0)
                    ? count / 12
                    : count / 12 + 1;
            list = sliderDB.searchSliderPagination(index, 12, search, sta);
            request.setAttribute("list", list);
            request.setAttribute("totalPage", totalpage);
            request.setAttribute("index", index);
            request.setAttribute("search", search);
            request.setAttribute("status", status);
            request.setAttribute("url", "search");
            request.getRequestDispatcher("../../view/manager/slider/search.jsp").forward(request, response);
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

    private void showSliderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SliderDAO sliderDB = new SliderDAO();
        Slider s = sliderDB.getSliderByID(id);
        request.setAttribute("slider", s);
        request.getRequestDispatcher("../../view/manager/slider/details.jsp").forward(request, response);
    }

    protected void saveFile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part part = request.getPart("file");
        InputStream inputStream;
        FileOutputStream fileOutputStream;
        String fileName = extractFileName(part);
        inputStream = request.getPart(part.getName()).getInputStream();
        // refines the fileName in case it is an absolute path
        int i = inputStream.available();
        byte[] b = new byte[i];
        inputStream.read(b);
        fileName = extractFileName(part);
        
        File test = getFolderUpload();
        String pathName = getFolderUpload()+"\\" + fileName;
        System.out.println(fileName);
        
        fileOutputStream  = new FileOutputStream(pathName);
        fileOutputStream.write(b);
        inputStream.close();
        fileOutputStream.close();
        String tilte = request.getParameter("title");
        String backlink = request.getParameter("backlink");
        String note = request.getParameter("note");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Slider s = new Slider();
        s.setBacklink(backlink);
        s.setImageLink("assets/images/" + fileName);
        s.setNotes(note);
        s.setStatus(status);
        s.setTitle(tilte);
        SliderDAO sliDB = new SliderDAO();
        sliDB.insert(s);
        response.sendRedirect("list");

    }

    protected void Update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part part = request.getPart("file");
        InputStream inputStream;
        FileOutputStream fileOutputStream;
        String fileName = extractFileName(part);
        inputStream = request.getPart(part.getName()).getInputStream();
        // refines the fileName in case it is an absolute path
        int i = inputStream.available();
        byte[] b = new byte[i];
        inputStream.read(b);
        fileName = extractFileName(part);
        
        File test = getFolderUpload();
        String pathName = getFolderUpload()+"\\" + fileName;
        System.out.println(fileName);
        File storeFile = new File(pathName);
        fileOutputStream  = new FileOutputStream(pathName);
        fileOutputStream.write(b);
        inputStream.close();
        fileOutputStream.close();
        int id = Integer.parseInt(request.getParameter("rid"));

        String tilte = request.getParameter("title");
        String backlink = request.getParameter("backlink");
        String note = request.getParameter("note");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Slider s = new Slider();
        s.setId(id);
        s.setBacklink(backlink);
        s.setImageLink("assets/images/" + fileName);
        s.setNotes(note);
        s.setStatus(status);
        s.setTitle(tilte);
        SliderDAO sliDB = new SliderDAO();
        sliDB.getSliderByID(id);
        
        File file = new File(getFolderUpload()+"\\"  + sliDB.getSliderByID(id).getImageLink());
        file.delete();
        sliDB.updateSlider(s);
        response.sendRedirect("details?id=" + id);

    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
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

    protected void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SliderDAO sliDB = new SliderDAO();
        Slider s = new Slider();
        s = sliDB.getSliderByID(id);
        request.setAttribute("slider", s);
        request.getRequestDispatcher("../../view/manager/slider/edit.jsp").forward(request, response);
    }

}
