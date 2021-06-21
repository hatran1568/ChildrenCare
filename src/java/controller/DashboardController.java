/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Service;
import dao.FeedbackDAO;
import dao.ReservationDAO;
import dao.ServiceDAO;
import dao.UserDAO;
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
public class DashboardController extends HttpServlet {

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
            out.println("<title>Servlet DashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardController at " + request.getContextPath() + "</h1>");
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
        ReservationDAO resDB = new ReservationDAO();
        int submit = resDB.countReservation("Submited");
        int cancel = resDB.countReservation("Cancel");
        int success = resDB.countReservation("Success");
        float total = submit + success + cancel;
        float Submit = submit / total * 100;
        float Cancel = cancel / total * 100;
        float Success = success / total * 100;
        ArrayList<Service> list = new ArrayList<>();
        ServiceDAO serDB = new ServiceDAO();
        list = serDB.getServices();
        ArrayList<Float> revernue = new ArrayList<>();
        ArrayList<Integer> avg_feed = new ArrayList<>();
        FeedbackDAO fbDB = new FeedbackDAO();
        UserDAO userDB = new UserDAO();
        int total_customer = userDB.countUser();
        int tostar = 0;
        int toSer = 0;
        for (Service s : list) {
            toSer += fbDB.getService(s);
            tostar += fbDB.getRatingStar(s);
            avg_feed.add(fbDB.getRatingStar(s)/fbDB.getService(s));
        }
        float sum = 0;
        for (Service s : list) {
            revernue.add(resDB.getRevenue(s));
            
            sum += resDB.getRevenue(s);
        }
        tostar = tostar/toSer;
        request.setAttribute("service", list);
        request.setAttribute("star", avg_feed);
        request.setAttribute("tostar", tostar);

        request.setAttribute("revernue", revernue);
        request.setAttribute("Submit", Submit);
        request.setAttribute("Cancel", Cancel);

        request.setAttribute("Success", Success);
        request.setAttribute("Total", total);
        request.setAttribute("Customer", total_customer);
        request.setAttribute("sum", sum);

        request.getRequestDispatcher("../../view/dashboard/dashboard.jsp").forward(request, response);
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

}
