/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.User;
import bean.Post;
import bean.Reservation;
import bean.Service;
import dao.PostDAO;
import dao.ReservationDAO;
import dao.UserDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import ulti.EmailVerify;

/**
 *
 * @author HP
 */
public class ReservationCompletionController extends HttpServlet {

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
        EmailVerify e = new EmailVerify();
        ReservationDAO reservationDB = new ReservationDAO();
        Reservation reservation = reservationDB.getReservationById(5);
        ArrayList<Service> reservation_services = reservationDB.getReservationServices(5);
        //Sub-function 1: The reservation status is changed to submitted
        reservationDB.submitReservation(5);
        //Sub-function 2: The reservation is assigned to a staff
        if (reservationDB.getReservationById(5).getStaff()!=null)
            reservationDB.changeStaffReservation(5, 2);
        //Sub-function 4: Send email to customer, confirming reservation and payment guides
        UserDAO userDB = new UserDAO();
        User user = userDB.getUser(reservation.getCustomer().getId());
        try {
            e.sendText(user, "UwU");
        } catch (MessagingException ex) {
            Logger.getLogger(ReservationCompletionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("reservation", reservation);
        request.setAttribute("reservation_services", reservation_services);
        request.getRequestDispatcher("../view/reservation/reservationcompletion.jsp").forward(request, response);
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
