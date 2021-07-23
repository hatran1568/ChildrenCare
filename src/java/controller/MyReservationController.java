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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "MyReservationController", urlPatterns = {"/customer/reservation/my"})
public class MyReservationController extends HttpServlet {
ReservationDAO reservationDB = new ReservationDAO();
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
            case "/customer/reservation/my":
                showMyreservation(request, response);
                break;
            case "/customer/reservation/details":
                showDetailsReservation(request, response);
                break;
            case "/customer/reservation/cancel":
                cancelReservation(request, response);
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

    protected void showMyreservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Reservation> list = new ArrayList<Reservation>();
        User u = (User) request.getSession().getAttribute("user");

        
        list = reservationDB.getReservationWithoutPending(u);

        for (Reservation reservation : list) {
           
            ArrayList<ReservationService> listservice = new ArrayList<>();
            listservice = reservationDB.getReservationServices(reservation);
            float total = 0;
            ArrayList<Service> servicelist = new ArrayList<>();
            for (ReservationService reservationService : listservice) {
                total += reservationService.getUnitPrice();
                servicelist.add(reservationService.getService());

            }
            reservation.setListService(servicelist);
            reservation.setTotalCost(reservationDB.getTotalCost(reservation));
        }

        request.setAttribute("list", list);
        request.getRequestDispatcher("../../view/customer/reservation/myReservation.jsp").forward(request, response);

    }

    protected void showDetailsReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Reservation r = new Reservation();
        int id = Integer.parseInt(request.getParameter("id"));
        ArrayList<ReservationService> res = new ArrayList<>();
        r.setId(id);
        
        Reservation rerser = new Reservation();
        
        rerser = reservationDB.getReservationById(id);
        rerser.setTotalCost(reservationDB.getTotalCost(rerser));
        res = reservationDB.getReservationServices(rerser);
        request.setAttribute("reservation", rerser);
        request.setAttribute("list", res);
        request.getRequestDispatcher("../../view/customer/reservation/reservationInformation.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

    public void cancelReservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Reservation r = new Reservation();
        int id = Integer.parseInt(request.getParameter("id"));
        r = reservationDB.getReservationById(id);
        reservationDB.deleteReservationService(r);
        reservationDB.cancelReservation(r);
        response.sendRedirect("my");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
