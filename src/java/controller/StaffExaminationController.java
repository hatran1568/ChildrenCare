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
import com.google.gson.Gson;
import dao.ExaminationDAO;
import dao.ReceiverDAO;
import dao.ReservationDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.EmailVerify;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class StaffExaminationController extends HttpServlet {

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
            case "/staff/examination/new":
                showFormAddExamination(request,response);
                break;
            case "/staff/examination/list":
                showPrescriptionList(request,response);
                break;
            case "/staff/examination/details":
                showPrescriptionDetails(request,response);
                break;
            case "/staff/examination/add":
                addPrescription(request,response);
                break;
            case "/staff/examination/checkemail":
                checkExistingReceiver(request,response);
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

    private void showFormAddExamination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationID = Integer.parseInt(request.getParameter("rid"));
        int serviceID = Integer.parseInt(request.getParameter("sid"));
        
        request.setAttribute("rid", reservationID);
        request.setAttribute("sid", serviceID);
        
        request.getRequestDispatcher("../../view/staff/examination/add.jsp").forward(request, response);

    }

    private void addPrescription(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ExaminationDAO examinationDB = new ExaminationDAO();
        ReservationDAO reservationDB = new ReservationDAO();
        int reservationID = Integer.parseInt(request.getParameter("rid"));
        int serviceID = Integer.parseInt(request.getParameter("sid"));
        String fullName = request.getParameter("name");
        boolean gender = request.getParameter("gender").equals("male");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String prescription = request.getParameter("prescription");
        
        // Get info of the patient
        Receiver r = new Receiver();
        r.setFullName(fullName);
        r.setGender(gender);
        r.setMobile(mobile);
        r.setAddress(address);
        r.setEmail(email);
        
        // set info of the examination
        MedicalExamination exam = new MedicalExamination();
        exam.setPrescription(prescription);
        ReservationService rs = new ReservationService();
        Reservation res = new Reservation();
        res.setId(reservationID);
        Service service = new Service();
        service.setId(serviceID);
        rs.setService(service);
        rs.setReservation(res);
        exam.setReservationService(rs);
        ReceiverDAO receiverDB = new ReceiverDAO();
        
        // update new patient info if email already exist
        if(receiverDB.checkExistingReceiver(email)){
            receiverDB.updateReceiverInfo(r);
            Receiver newReceiver = receiverDB.getReceiverByEmail(email);
            exam.setReceiver(newReceiver);
            examinationDB.addExamination(exam);
        } else { // add new patient if email is not in DB
            receiverDB.addReceiver(r);
            Receiver newReceiver = receiverDB.getReceiverByEmail(email);
            exam.setReceiver(newReceiver);
            examinationDB.addExamination(exam);
        }
        
        boolean completed = true;
        ArrayList<ReservationService> services = reservationDB.getReservationServices(reservationDB.getReservationById(reservationID));
        for(ReservationService iter: services){
            if(iter.getQuantity()!=examinationDB.countExamination(iter.getReservation().getId(), iter.getService().getId()))
                completed=false;
        }
        if(completed){
            reservationDB.changeReservationStatus(reservationID, 27);
        }
        
        // send email with prescription info
        EmailVerify emailSender = new EmailVerify();
        try {
            String emailContent = "<h3 style=\"text-align: center\">Examination details</h3>\n" +
"                <div class=\"row\">\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Reservation ID: </strong>\n" +
"                        <span>"+exam.getReservationService().getReservation().getId()+"</span>\n" +
"                    </p>\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Checkup date:</strong>\n" +
"                        <span>"+exam.getReservationService().getReservation().getCheckupTime()+"</span>\n" +
"                    </p>\n" +
"                </div>\n" +
"                    \n" +
"                   <h3 style=\"text-align: center\">Receiver info</h3> \n" +
"                <div class=\"row\">\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Service ID:</strong>\n" +
"                        <span>"+exam.getReservationService().getService().getId()+"</span>\n" +
"                    </p>\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Service name:</strong>\n" +
"                        <span>"+exam.getReservationService().getService().getFullname()+"</span>\n" +
"                    </p>\n" +
"                </div>\n" +
"                <div class=\"row\">\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Receiver name:</strong>\n" +
"                        <span>"+exam.getReceiver().getFullName()+"</span>\n" +
"                    </p>\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Gender:</strong>\n" +
"                        <span>"+((exam.getReceiver().isGender())?"Male":"Female")+"</span>\n" +
"                        </p>\n" +
"                </div>\n" +
"                <div class=\"row\">\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong> Email:</strong>\n" +
"                        <span>"+exam.getReceiver().getEmail()+"</span>\n" +
"                    </p>\n" +
"                    <p class=\"col-md-6\">\n" +
"                        <strong>Mobile</strong>\n" +
"                        <span>"+exam.getReceiver().getMobile()+"</span>\n" +
"                    </p>\n" +
"                </div>\n" +
"                    <p>\n" +
"                        <strong>Address</strong>\n" +
"                        <span>"+exam.getReceiver().getAddress()+"</span>\n" +
"                    </p>\n" +
"                    <p style=\"margin-top: 30px;\">\n" +
"                        <strong>Prescription:</strong>\n" +
"                        <span>"+exam.getPrescription()+ "</span>\n" +
"            </div>";
            emailSender.sendText(email, emailContent);
        } catch (MessagingException ex) {
            Logger.getLogger(StaffExaminationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("../reservation/details?rid="+reservationID);
        
    }

    private void checkExistingReceiver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        ReceiverDAO receiverDB = new ReceiverDAO();
        Receiver r = receiverDB.getReceiverByEmail(email);
        String json = new Gson().toJson(r);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    private void showPrescriptionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        ExaminationDAO examDB = new ExaminationDAO();
        int reservationID = Integer.parseInt(request.getParameter("rid"));
        ArrayList<MedicalExamination> exams = examDB.getExamsByReservation(reservationID);
        request.setAttribute("exams", exams);
        request.getRequestDispatcher("../../view/staff/examination/list.jsp").forward(request, response);
    }

    private void showPrescriptionDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationID = Integer.parseInt(request.getParameter("resid"));
        int serviceID = Integer.parseInt(request.getParameter("sid"));
        int receiverID = Integer.parseInt(request.getParameter("recid"));
        ExaminationDAO examDB = new ExaminationDAO();
        MedicalExamination exam = examDB.getAnExamination(reservationID, serviceID, receiverID);
        ReservationDAO reservationDB = new ReservationDAO();
        Reservation res = reservationDB.getReservationById(reservationID);
        request.setAttribute("reservation", res);
        request.setAttribute("exam", exam);
        request.getRequestDispatcher("../../view/staff/examination/details.jsp").forward(request, response);
        
        
    }
    
    

}
