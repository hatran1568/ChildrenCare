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
import dao.CartDAO;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        switch (action) {

            case "/cart/list":
                showCart(request, response);
                break;

            case "/cart/edit":
                editOneItemCart(request, response);
                break;
//            case "/cart/add":
//                if (user == null || user.getId() == -1) {
//                    addToCartSession(request, response);
//                } else {
//                    addToCartDB(request, response);
//                }
//                break;
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

        request.getRequestDispatcher("../view/cart/cart.jsp").forward(request, response);
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
        int sid = Integer.parseInt(request.getParameter("rid"));
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.deleteReservationService(rid, sid);
        response.sendRedirect("list");
    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//    public void addToCartDB(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//
//        String r_serviceid = request.getParameter("serviceid");
//        if (r_serviceid == null) {
//            r_serviceid = "0";//validation
//        }
//
//        int serviceid = Integer.parseInt(r_serviceid);
//        ServiceDAO serviceDB = new ServiceDAO();
//        Service service = serviceDB.getService(serviceid);
//
//        CartDAO cartDB = new CartDAO();
//        cartDB.addToCart((User) request.getSession().getAttribute("user"), service);
//
//        response.sendRedirect("../service/list");
//    }
//
//    public void addToCartSession(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//
//        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new ArrayList<>();
//            session.setAttribute("cart", cart);
//        }
//
//        UserDAO userDB = new UserDAO();
//        User user = userDB.getUser(-1);
//
//        String r_serviceid = request.getParameter("serviceid");
//        if (r_serviceid == null) {
//            r_serviceid = "0";//validation
//        }
//
//        int serviceid = Integer.parseInt(r_serviceid);
//        ServiceDAO serviceDB = new ServiceDAO();
//        Service service = serviceDB.getService(serviceid);
//
//        boolean added = false;
//        for (CartItem cartitem : cart) {
//            if (cartitem.getService().getId() == serviceid) {
//                cartitem.setQuantity(cartitem.getQuantity() + 1);
//                added = true;
//            }
//            if (added) {
//                break;
//            }
//        }
//        if (!added) {
//            CartItem c = new CartItem();
//            c.setUser(user);
//            c.setService(service);
//            c.setQuantity(1);
//
//            cart.add(c);
//        }
//        session.setAttribute("cart", cart);
//        response.sendRedirect("../service/list");
//    }
//    
//    protected void editReservation(HttpServletRequest request, HttpServletResponse response){
//        
//    }
}
