/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.MedicalExamination;
import bean.Receiver;
import bean.Reservation;
import bean.ReservationService;
import bean.Service;
import bean.User;
import dao.ReceiverDAO;
import dao.ReservationDAO;
import dao.UserDAO;
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
@WebServlet(name = "MyPrescriptionController", urlPatterns = {"/customer/myprescription/exams"})
public class MyPrescriptionController extends HttpServlet {

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
            out.println("<title>Servlet MyReservationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyReservationController at " + request.getContextPath() + "</h1>");
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
            case "/customer/myprescription/exams":
                showExams(request, response);
                break;
            case "/customer/myprescription/prescription":
                showPrescription(request, response);
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

    protected void showExams(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int rid = Integer.parseInt(request.getParameter("rid"));
        
            //get checkuptime
        ReservationDAO reservationDB = new ReservationDAO();
        Reservation reservation = reservationDB.getReservationById(rid);
            //get receiver info
        ReceiverDAO receiverDB = new ReceiverDAO();
        Receiver receiver = receiverDB.getReceiversById(rid);
            //get medexam: prescription and service name
        ArrayList<MedicalExamination> medexam = new ArrayList<>();
        medexam = reservationDB.getMedExamByReservation(reservation.getId());

        request.setAttribute("reservation", reservation);
        request.setAttribute("receiver", receiver);
        request.setAttribute("medexam", medexam);
        request.getRequestDispatcher("../../view/reservation/myExams.jsp").forward(request, response);
    }

    protected void showPrescription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int rid = Integer.parseInt(request.getParameter("rid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        ReservationDAO reservationDB = new ReservationDAO();
            //get receiver info
        ReceiverDAO receiverDB = new ReceiverDAO();
        Receiver receiver = receiverDB.getReceiversById(rid);
        MedicalExamination medexam = reservationDB.getMedExamByReservationService(rid, sid);
        
        request.setAttribute("medexam", medexam);
        request.setAttribute("receiver", receiver);
        request.getRequestDispatcher("../../view/reservation/myPrescription.jsp").forward(request, response);
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
