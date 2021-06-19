package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import bean.Slider;
import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
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
            case "/manager/slider/list":
                showListPagination(request, response);
                break;
            case "/manager/slider/change":
                changeStatus(request, response);
                break;
            case"/manager/slider/search":
                search(request, response);
                break;
            case "/manager/slider/details":
                showSliderDetails(request,response);
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
        processRequest(request, response);
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
        request.setAttribute("list", list);
        request.setAttribute("totalPage", totalpage);
        request.setAttribute("index", index);
        request.setAttribute("url", "list");
        request.getRequestDispatcher("../../view/slider/list.jsp").forward(request, response);
    }

    public void changeStatus(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Slider s = new Slider();
        SliderDAO sliderDB = new SliderDAO();
        s = sliderDB.getSliderByID(id);
        if (s.isStatus() == true) {
            sliderDB.setStatus(false, s);
        } else {
            sliderDB.setStatus(true, s);
        }

    }
    
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String search = request.getParameter("search");
        String status = request.getParameter("status");
        String r_index = request.getParameter("page");
        if (search==null){
            search ="";
        }
        if (r_index == null) {
            r_index = "1";
        }
        if(status.equals("none")){
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
        request.setAttribute("search",search);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../../view/slider/search.jsp").forward(request, response);
        }
        else{
        boolean sta = Boolean.parseBoolean(status);
        int index = Integer.parseInt(r_index);
        SliderDAO sliderDB = new SliderDAO();
        ArrayList<Slider> list = new ArrayList<Slider>();
        int count = sliderDB.count(search,sta);
        int totalpage = (count % 12 == 0)
                ? count / 12
                : count / 12 + 1;
        list = sliderDB.searchSliderPagination(index, 12, search,sta);
        request.setAttribute("list", list);
        request.setAttribute("totalPage", totalpage);
        request.setAttribute("index", index);
         request.setAttribute("search",search);
        request.setAttribute("status", status);
        request.setAttribute("url", "search");
        request.getRequestDispatcher("../../view/slider/search.jsp").forward(request, response);
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
        request.getRequestDispatcher("../../view/slider/details.jsp").forward(request, response);
    }

}
