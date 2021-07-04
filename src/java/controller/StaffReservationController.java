/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Reservation;
import bean.ReservationService;
import bean.User;
import dao.ExaminationDAO;
import dao.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class StaffReservationController extends HttpServlet {

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
            case "/staff/reservation/details":
                getReservationDetails(request,response);
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

    private void getReservationDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));
        User u = (User) request.getSession().getAttribute("user");
        
        ReservationDAO reservationDB = new ReservationDAO();
        ExaminationDAO examinationDB = new ExaminationDAO();
        Reservation r = reservationDB.getReservationById(rid);
        if (r.getStaff().getId() != u.getId()){
            response.sendRedirect("list");
        } else {
            ArrayList<ReservationService> services = reservationDB.getReservationServices(r);
            float totalCost = 0;
            for(ReservationService rs: services){
                totalCost += rs.getQuantity()*rs.getUnitPrice();
            }
            r.setTotalCost(totalCost);
            request.setAttribute("services", services);
            ArrayList<Integer> examinationCount = new ArrayList<>();
            for(ReservationService rs : services){
                examinationCount.add(examinationDB.countExamination(rs.getReservation().getId(), rs.getService().getId()));
            }
            request.setAttribute("reservation", r);
            request.setAttribute("examinationCount", examinationCount);
            request.getRequestDispatcher("../../view/staff/reservation/details.jsp").forward(request, response);
        }
        
    }

}
