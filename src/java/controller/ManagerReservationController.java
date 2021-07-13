/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Reservation;
import bean.ReservationService;
import bean.Service;
import bean.User;
import dao.ReservationDAO;
import dao.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class ManagerReservationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            case "/manager/reservation/list":
                showReservationList(request, response);
                break;
            case "/manager/reservation/approve":
                approveReservation(request, response);
                break;
            case "/manager/reservation/reject":
                rejectReservation(request, response);
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

    private void showReservationList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ReservationDAO reservationDB = new ReservationDAO();
        ArrayList<Reservation> reservations = reservationDB.getSubmittedReservations();
        request.setAttribute("reservations", reservations);
        for (Reservation reservation : reservations) {
            reservation.setEnough(true);
            ArrayList<ReservationService> re_services = reservation.getListReservationService();
            for (ReservationService re_service : re_services) {
                if(re_service.getQuantity() > re_service.getService().getQuantity()){
                    reservation.setEnough(false);
                    break;
                }
                
            }
        }
        request.getRequestDispatcher("../../view/manager/reservation/list.jsp").forward(request, response);
    }

    private void approveReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("id"));
        ServiceDAO serviceDB = new ServiceDAO();
        ReservationDAO reservationDB = new ReservationDAO();
        Reservation reservation = reservationDB.getReservationById(rid);
        ArrayList<ReservationService> re_services = reservation.getListReservationService();

        re_services.forEach((rs) -> {
            serviceDB.subtractServiceQuantity(rs.getService().getId(), rs.getQuantity());
        });
        reservationDB.setReservationStatus(rid, "Approved");

    }

    private void rejectReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("id"));
        ServiceDAO serviceDB = new ServiceDAO();
        ReservationDAO reservationDB = new ReservationDAO();
        Reservation reservation = reservationDB.getReservationById(rid);
        reservationDB.setReservationStatus(rid, "Rejected");

        response.sendRedirect("list");

    }

    private int checkQuantity(int rid) throws ServletException, IOException {

        ReservationDAO reservationDB = new ReservationDAO();
        Reservation reservation = reservationDB.getReservationById(rid);
        ArrayList<ReservationService> re_services = reservation.getListReservationService();
        for (ReservationService rs : re_services) {
            if (rs.getQuantity() < rs.getService().getQuantity()) {
                return rs.getService().getId();
            }
        }

        return -1;
    }
}
