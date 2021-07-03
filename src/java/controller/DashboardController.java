/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Service;
import bean.Setting;
import bean.User;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import dao.FeedbackDAO;
import dao.ReservationDAO;
import dao.ServiceDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
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
        long DAY_IN_MS = 1000 * 60 * 60 * 24;
        ArrayList<Integer> reservationSuccessList = new ArrayList<>();
        ArrayList<Integer> reservationList = new ArrayList<>();
       ReservationDAO resDB = new ReservationDAO();
        String r_start = request.getParameter("start");
        String r_end = request.getParameter("end");
        if (r_start != null && r_end != null) {
            Date start = Date.valueOf(r_start);
            Date end = Date.valueOf(r_end);
            List<LocalDate> dates = new ArrayList<>();
            dates = getDatesBetweenUsingJava8(start.toLocalDate(), end.toLocalDate());
            ArrayList<Date> date = new ArrayList<>();
            for (LocalDate date1 : dates) {
                date.add(Date.valueOf(date1));
            }

            for (Date date1 : date) {
                reservationSuccessList.add(resDB.countReservation(27, date1));
                reservationList.add(resDB.countReservation(date1));

            }
        }

        if (r_start == null || r_end == null) {
            long millis = System.currentTimeMillis();
            Date end = new Date(millis);
            Date start = new Date(System.currentTimeMillis() - (7 * DAY_IN_MS));
            List<LocalDate> dates = new ArrayList<>();
            dates = getDatesBetweenUsingJava8(start.toLocalDate(), end.toLocalDate());
            ArrayList<Date> date = new ArrayList<>();
            for (LocalDate date1 : dates) {
                date.add(Date.valueOf(date1));
            }

            for (Date date1 : date) {
                reservationSuccessList.add(resDB.countReservation(27, date1));
                reservationList.add(resDB.countReservation(date1));

            }

        }

        int submit = resDB.countReservation(20);
        int cancel = resDB.countReservation(21);
        int success = resDB.countReservation(27);
        int pending = resDB.countReservation(19);
        int approve = resDB.countReservation(22);
        int reject = resDB.countReservation(23);

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
            avg_feed.add(fbDB.getRatingStar(s) / fbDB.getService(s));
        }
        ArrayList<User> listPotential = new ArrayList<>();
        ArrayList<User> listCustomer = new ArrayList<>();
        Setting set = new Setting();
        set.setId(16);
        listPotential = userDB.getUserByStatus(set);
        set.setId(17);
        listCustomer = userDB.getUserByStatus(set);
        int registed = 0;
        int reserved = 0;
        if (listPotential != null) {
            registed = listPotential.size();
        }
        if (listCustomer != null) {
            reserved = listCustomer.size();
        }

        float sum = 0;
        for (Service s : list) {
            revernue.add(resDB.getRevenue(s));

            sum += resDB.getRevenue(s);
        }
        tostar = tostar / toSer;
        request.setAttribute("service", list);
        request.setAttribute("star", avg_feed);
        request.setAttribute("tostar", tostar);

        request.setAttribute("revernue", revernue);
        request.setAttribute("Submit", Submit);
        request.setAttribute("Cancel", Cancel);
        request.setAttribute("Success", Success);
        request.setAttribute("Approve", approve);
        request.setAttribute("Reject", reject);

        request.setAttribute("Success", Success);
        request.setAttribute("Total", total);
        request.setAttribute("Customer", total_customer);
        request.setAttribute("sum", sum);
        request.setAttribute("registed", registed);
        request.setAttribute("reserved", reserved);
        request.setAttribute("listSuccessre", reservationSuccessList);
        request.setAttribute("listre", reservationList);

       
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

    public static List<LocalDate> getDatesBetweenUsingJava8(
            LocalDate startDate, LocalDate endDate) {

        long numOfDaysBetween = ChronoUnit.DAYS.between(startDate, endDate);
        return IntStream.iterate(0, i -> i + 1)
                .limit(numOfDaysBetween)
                .mapToObj(i -> startDate.plusDays(i))
                .collect(Collectors.toList());
    }
}
