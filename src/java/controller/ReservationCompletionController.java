/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import bean.CartItem;
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
import dao.CartDAO;
import dao.ReceiverDAO;
import dao.ReservationDAO;
import dao.UserDAO;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.Session;
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
        UserDAO userDB = new UserDAO();
        //Sub-function 1: The reservation is submitted and assigned to a staff
        Reservation reservation = new Reservation();
            //Set Customer
        User u = (User) request.getSession().getAttribute("user");
        if (u != null)
            reservation.setCustomer(u);
        else 
        {
            User guest = new User();
            guest.setId(0);
            reservation.setCustomer(guest);
        }
            //Set Reservation date
        Date d = null;
        LocalDateTime now = LocalDateTime.ofInstant(d.toInstant(), ZoneId.systemDefault());
        Date reservation_date = (Date) Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
        reservation.setReservation_date(reservation_date);
            //Set status
        reservation.setStatus("Submitted");
            //Set Staff
        ArrayList<User> staff = userDB.getStaff();
        int staff_id = ThreadLocalRandom.current().nextInt(0, staff.size() + 1);
        reservation.setStaff(staff.get(staff_id));
            //Set numberofperson
        reservation.setNumber_of_person(1);
            //Submit reservation services
            
        CartDAO cartDB = new CartDAO();
        if (u == null)
        {
            ArrayList<CartItem> cart = new ArrayList<>();
            cart = (ArrayList<CartItem>) request.getSession().getAttribute("cart");
            ArrayList<Receiver> receivers = ;
            int rcount = 0;
            for (CartItem cartItem : cart) {
                reservationDB.addReservationService(reservation, cartItem.getService(), receivers.get(rcount));
                rcount++;
            }
        }
        else
        {
            ArrayList<CartItem> cart = cartDB.getCartByUserId(u);
            ReceiverDAO receiverDB = new ReceiverDAO();
            ArrayList<Receiver> receivers = ;
            int rcount = 0;
            for (CartItem cartItem : cart) {
                reservationDB.addReservationService(reservation, cartItem.getService(), receivers.get(rcount));
                rcount++;
            }
        }
        //Sub-function 2: Receiver information are saved
        
        //Sub-function 3: Send email to customer confirming reservation and payment guides
        User user = userDB.getUser(reservation.getCustomer().getId());
        try {
            e.sendText(user, "UwU");
        } catch (MessagingException ex) {
            Logger.getLogger(ReservationCompletionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ArrayList<Service> reservation_services = reservationDB.getReservationServices(reservation.getId());
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
