/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Receiver;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.User;
import bean.Reservation;
import bean.Service;
import bean.Setting;
import dao.ReceiverDAO;
import dao.ReservationDAO;
import dao.UserDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import util.EmailVerify;

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
        EmailVerify e = new EmailVerify();
        ReservationDAO reservationDB = new ReservationDAO();
        UserDAO userDB = new UserDAO();
        int rid = Integer.parseInt(request.getParameter("rid"));
        //Sub-function 2: The reservation is submitted and assigned to a staff
        Reservation reservation = reservationDB.getReservationById(rid);
        //Set status to submitted
        reservationDB.submitReservation(rid);
        //Set Staff
        ArrayList<User> staff = userDB.getStaff();
        int minRes = 900;
        User assignStaff = new User();
        for (User s : staff) {
            if (reservationDB.countReservations(s) <= minRes) {
                minRes = reservationDB.countReservations(s);
                assignStaff.setId(s.getId());
                assignStaff.setFullName(s.getFullName());
                assignStaff.setEmail(s.getEmail());
                assignStaff.setMobile(s.getMobile());
                assignStaff.setImageLink(s.getImageLink());
            }
        }
        reservationDB.changeStaffReservation(rid, assignStaff.getId());
        
//        Reservation reservationedit = new Reservation();
//        reservationedit =(Reservation) request.getSession().getAttribute("reservationidedit");
//        if(reservationedit!=null){
//            reservationDB.deleteReservationService(reservationedit);
//            reservationDB.deleteReservation(reservationedit.getId());
//            request.getSession().removeAttribute("reservationidedit");
//        }

        //Sub-function 3: Send email to customer confirming reservation and payment guides
        User user = userDB.getUser(reservation.getCustomer().getId());
        try {
            String content = "Your reservation has been submitted. Your doctor is Dr. " + assignStaff.getFullName() + ". Email: " + assignStaff.getEmail() + ". Mobile: " + assignStaff.getMobile() + ". Please complete the transaction by transfering the fees to the following bank account: ";
            e.sendText(user, content);
        } catch (MessagingException ex) {
            Logger.getLogger(ReservationCompletionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ReceiverDAO rdao = new ReceiverDAO();
        Receiver receiver = rdao.getReceiversById(reservation.getCustomer().getId());
        request.setAttribute("reservation", reservation);
        request.setAttribute("receiver", receiver);
        request.setAttribute("staff", assignStaff);
        
        User u = (User) request.getSession().getAttribute("user");
        request.getSession().removeAttribute("cart");
        request.getRequestDispatcher("../view/customer/reservation/reservationcompletion.jsp").forward(request, response);
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
