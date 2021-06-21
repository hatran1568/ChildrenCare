/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CartItem;
import bean.Receiver;
import bean.Reservation;
import bean.ReservationService;
import bean.User;
import dao.CartDAO;
import dao.ReceiverDAO;
import dao.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class ReservationContactController extends HttpServlet {

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
            out.println("<title>Servlet ReservationContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservationContactController at " + request.getContextPath() + "</h1>");
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

            case "/reservation/contact":
                getCartInfo(request, response);
                break;

            case "/reservation/contact/add":
                addReceiver(request, response);
                break;

            case "/reservation/contact/forward":
                getReservationInfo(request, response);
                break;

            case "/reservation/contactedit":
               getCartInfoFromDB(request, response);
              
                break;
            case "/reservation/contact/forwardedit":
            default:
//                getReservationInfoEdit(request, response);
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
        this.doGet(request, response);

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

    private void getCartInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();
        ReceiverDAO receiverDB = new ReceiverDAO();

        ArrayList<Receiver> receiverList = new ArrayList<>();

        if (u == null) {
            receiverList = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");
            ArrayList<CartItem> list = new ArrayList<>();
            if (request.getSession().getAttribute("cart") != null) {
                list = (ArrayList<CartItem>) request.getSession().getAttribute("cart");
                int numberofservice = list.size();
                float totalcost = 0;

                for (CartItem cartItem : list) {
                    totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
                }
                request.setAttribute("number", numberofservice);
                request.setAttribute("list", list);
                request.setAttribute("totalcost", totalcost);
            }
            request.getSession().setAttribute("receivers", receiverList);
            request.getRequestDispatcher("../view/reservation/reservationContact.jsp").forward(request, response);
        }
//        if (u != null && receiverList == null) {
//            
//        }

        if (u != null) {

            if (request.getSession().getAttribute("receivers") == null) {
                receiverList = receiverDB.getReceivers(u.getId());
            } else {
                receiverList = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");

            }
            ArrayList<CartItem> list = new ArrayList<>();
            list = cartDB.getCartByUserId(u);

            float totalcost = 0;
            for (CartItem cartItem : list) {
                totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
            }
            int numberofservice = list.size();
            request.setAttribute("receivers", receiverList);
            request.setAttribute("number", numberofservice);
            request.setAttribute("totalcost", totalcost);
            request.setAttribute("list", list);
            request.getSession().setAttribute("receivers", receiverList);
        }

        request.getRequestDispatcher("../view/reservation/reservationContact.jsp").forward(request, response);
    }

    private void getCartInfoFromDB(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Reservation rid = new Reservation();
        rid.setId(id);
        request.getSession().setAttribute("reservationidedit", rid);
        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();
        ReceiverDAO receiverDB = new ReceiverDAO();
        ReservationDAO resDB = new ReservationDAO();
        ArrayList<ReservationService> reslist = new ArrayList<>();
        reslist = resDB.getReservationServiceById(rid);
        for (ReservationService reservationService : reslist) {
            cartDB.addToCart(u, reservationService.getS());
        }

        ArrayList<Receiver> receiverList = new ArrayList<>();

        if (u != null) {

            if (request.getSession().getAttribute("receivers") == null) {
                receiverList = receiverDB.getReceivers(u.getId());
            } else {
                receiverList = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");
            }
            ArrayList<CartItem> list = new ArrayList<>();
            for (ReservationService res : reslist) {
                CartItem c = new CartItem();
                c.setService(res.getS());
                if(list.contains(c)){
                    c = list.get(list.indexOf(c));
                    c.setQuantity(c.getQuantity()+1);
                    list.remove(c);
                    list.add(c);
                }
                else{
                    c.setQuantity(1);
                    c.setUser(u);
                    list.add(c);
                }
            }

            float totalcost = 0;
            for (CartItem cartItem : list) {
                totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
            }
            int numberofservice = list.size();
            request.setAttribute("receivers", receiverList);
            request.setAttribute("number", numberofservice);
            request.setAttribute("totalcost", totalcost);
            request.setAttribute("list", list);
            request.setAttribute("id", id);
            request.getSession().setAttribute("receivers", receiverList);
        }
        
         response.sendRedirect("../cart/list");
    }

    private void addReceiver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Receiver> receiverList = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");
        User u = (User) request.getSession().getAttribute("user");
        String name = request.getParameter("fullName");
        boolean gender = request.getParameter("gender").equals("male");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        ArrayList<Receiver> receivers = new ArrayList<Receiver>();
        if (request.getSession().getAttribute("receivers") == null) {
            Receiver r = new Receiver();
            r.setId(0);
            r.setFullName(name);
            r.setGender(gender);
            r.setAddress(address);
            r.setEmail(email);
            r.setMobile(mobile);
            if (u != null) {
                r.setUser(u);
            } else {
                User user = new User();
                user.setId(-1);
                r.setUser(user);
            }

            receivers.add(r);
        } else {
            receivers = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");

            Receiver r = new Receiver();

            r.setId(receivers.size());

            r.setFullName(name);
            r.setGender(gender);
            r.setAddress(address);
            r.setEmail(email);
            r.setMobile(mobile);
            if (u != null) {
                r.setUser(u);
            } else {
                User user = new User();
                user.setId(-1);
                r.setUser(user);
            }

            receivers.add(r);
        }
        request.getSession().removeAttribute("receivers");
        request.getSession().setAttribute("receivers", receivers);

        response.sendRedirect("../contact");
    }

    private void getReservationInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] raw_receiverid = request.getParameterValues("receiver");
        ArrayList<Integer> receiverIDs = new ArrayList<>();
        for (String s : raw_receiverid) {
            receiverIDs.add(Integer.parseInt(s));
        }
        request.getSession().setAttribute("receiverIDs", receiverIDs);
        response.sendRedirect("../reservationcompletion");
    }
//    private void getReservationInfoEdit(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int id =Integer.parseInt(request.getParameter("id"));
//        Reservation r = new Reservation();
//        r.setId(id);
//        ReservationDAO reDB = new ReservationDAO();
//        reDB.deleteReservationService(r);
//        reDB.deleteReservation(r);
//        String[] raw_receiverid = request.getParameterValues("receiver");
//        ArrayList<Integer> receiverIDs = new ArrayList<>();
//        for (String s : raw_receiverid) {
//            receiverIDs.add(Integer.parseInt(s));
//        }
//        request.getSession().setAttribute("receiverIDs", receiverIDs);
//        response.sendRedirect("../reservationcompletion");
//    }
}
