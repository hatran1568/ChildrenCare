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
import com.google.gson.Gson;

import dao.ReservationDAO;
import dao.ServiceDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class CartController extends HttpServlet {

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        switch (action) {

            case "/cart/list":
                showCart(request, response);
                break;

            case "/cart/edit":
                editOneItemCart(request, response);
                break;
            case "/cart/add":
                addToCart(request, response);
                break;
            case "/cart/delete":
                deleteCart(request, response);
                break;
            default:
                showCart(request, response);
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

    //Show List service user added to cart
    protected void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Check if user login or not
        User u = (User) request.getSession().getAttribute("user");
        ReservationDAO reservationDB = new ReservationDAO();

        String r_rid = request.getParameter("rid");
        if (r_rid == null || r_rid.length() == 0) {
            if (u != null) {

                if (reservationDB.getReservation(u, 19).size() != 0) {
                    Reservation reservation = reservationDB.getReservation(u, 19).get(0);
                    ArrayList<ReservationService> reservationServices = new ArrayList<>();
                    reservationServices = reservationDB.getReservationServices(reservation);
                    float total = 0;
                    for (ReservationService reservationService : reservationServices) {
                        total += reservationService.getQuantity() * reservationService.getUnitPrice();
                    }
                    request.setAttribute("totalcost", total);
                    request.setAttribute("list", reservationServices);
                }

                //If user not logged in get data from session
            } else {
                Reservation reservation = new Reservation();
                if (request.getSession().getAttribute("reservation_id") != null) {
                    int rid = Integer.parseInt(request.getSession().getAttribute("reservation_id").toString());

                    reservation = reservationDB.getReservationById(rid);

                    ArrayList<ReservationService> reservationServices = new ArrayList<>();
                    reservationServices = reservationDB.getReservationServices(reservation);
                    float total = 0;
                    for (ReservationService reservationService : reservationServices) {
                        total += reservationService.getQuantity() * reservationService.getUnitPrice();
                    }
                    request.setAttribute("totalcost", total);
                    request.setAttribute("list", reservationServices);
                }
            }

        } else {
            int rid = Integer.parseInt(r_rid);
            Reservation reservation = new Reservation();
            reservation = reservationDB.getReservationById(rid);

            ArrayList<ReservationService> reservationServices = new ArrayList<>();
            reservationServices = reservationDB.getReservationServices(reservation);
            float total = 0;
            for (ReservationService reservationService : reservationServices) {
                total += reservationService.getQuantity() * reservationService.getUnitPrice();
            }
            request.setAttribute("totalcost", total);
            request.setAttribute("list", reservationServices);
        }

        request.getRequestDispatcher("../view/public/cart/cart.jsp").forward(request, response);
    }

    //Edit Function to edit quantity  from Database/Session
//    protected void editCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User u = (User) request.getSession().getAttribute("user");
//        CartDAO cartDB = new CartDAO();
//
//        //If user logged in edit to Database
//        if (u != null) {
//
//            ArrayList<CartItem> list = new ArrayList<>();
//
//            list = cartDB.getCartByUserId(u);
//
//            float totalcost = 0;
//
//            for (CartItem cartItem : list) {
//                int id = cartItem.getService().getId();
//                String param = Integer.toString(id);
//                int quantity = Integer.parseInt(request.getParameter(param));
//                cartItem.setQuantity(quantity);
//                cartDB.updateCart(cartItem.getUser(), cartItem.getService(), quantity);
//                totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
//            }
//
//            int numberofservice = list.size();
//
//            request.setAttribute("number", numberofservice);
//            request.setAttribute("totalcost", totalcost);
//            request.setAttribute("list", list);
//
//            //If user not logged in edit to Session
//        } else {
//
//            ArrayList<CartItem> list = new ArrayList<>();
//            list = (ArrayList<CartItem>) request.getSession().getAttribute("cart");
//
//            if (list != null) {
//
//                float totalcost = 0;
//
//                for (CartItem cartItem : list) {
//                    int id = cartItem.getService().getId();
//                    String param = Integer.toString(id);
//                    int quantity = Integer.parseInt(request.getParameter(param));
//                    cartItem.setQuantity(quantity);
//
//                    totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
//                }
//
//                request.getSession().setAttribute("cart", list);
//                request.setAttribute("totalcost", totalcost);
//                request.setAttribute("list", list);
//
//            }
//        }
//        response.sendRedirect("list");
//    }
    public void editOneItemCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.editReservationService(rid, sid, quantity);
        ArrayList<ReservationService> list = new ArrayList<>();
        list = reservationDAO.getReservationServices(reservationDAO.getReservationById(rid));
        ServiceDAO serviceDAO = new ServiceDAO();
        float price = reservationDAO.getReservationServices(reservationDAO.getReservationById(rid), serviceDAO.getService(sid)).get(0).getUnitPrice();
        float total = 0;
        for (ReservationService reservationService : list) {
            total += reservationService.getQuantity() * reservationService.getUnitPrice();
        }
        Map<String, Float> options = new LinkedHashMap<>();
        options.put("price", price * quantity);
        options.put("total", total);
        String json = new Gson().toJson(options);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

    }

    //Delete Function to delete service  from Database/Session
    protected void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.deleteReservationService(rid, sid);
        response.sendRedirect("list");
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String reservation_id = "";
        if (request.getSession().getAttribute("reservation_id") == null) {
            reservation_id = (String) request.getSession().getAttribute("reservation_id");
        } else {
            reservation_id = request.getSession().getAttribute("reservation_id").toString();
        }
        int rid;
        int service_id = Integer.parseInt(request.getParameter("service_id"));
        ReservationDAO reservationDB = new ReservationDAO();
        ServiceDAO serviceDB = new ServiceDAO();
        if (user == null) {
            user = new User();
            user.setId(-1);
            if (reservation_id == null) {
                rid = reservationDB.addPendingReservation(user);
                Reservation reservation = reservationDB.getReservationById(rid);
                Service service = serviceDB.getService(service_id);
                reservationDB.addReservationService(reservation, service, 1);
                request.getSession().setAttribute("reservation_id", rid);
            } else if (reservation_id != null) {
                rid = Integer.parseInt(reservation_id);
                Reservation reservation = reservationDB.getReservationById(rid);
                Service service = serviceDB.getService(service_id);
                reservationDB.addReservationService(reservation, service, 1);
            }
        } else if (user.getId() == -1) {
            rid = Integer.parseInt(reservation_id);
            Reservation reservation = reservationDB.getReservationById(rid);
            Service service = serviceDB.getService(service_id);
            reservationDB.addReservationService(reservation, service, 1);
        } else if (user.getId() > 0) {
            int pr_id = reservationDB.getPendingReservation(user);
            if (pr_id == 0) {
                rid = reservationDB.addPendingReservation(user);
                Reservation reservation = reservationDB.getReservationById(rid);
                Service service = serviceDB.getService(service_id);
                reservationDB.addReservationService(reservation, service, 1);
                request.getSession().setAttribute("reservation_id", rid);
            } else if (pr_id > 0) {
                rid = pr_id;
                Reservation reservation = reservationDB.getReservationById(rid);
                Service service = serviceDB.getService(service_id);
                reservationDB.addReservationService(reservation, service, 1);
                request.getSession().setAttribute("reservation_id", rid);
            }
        }
        response.sendRedirect("../service/list");
    }
}
