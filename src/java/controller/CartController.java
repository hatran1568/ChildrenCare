/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CartItem;
import bean.Service;
import bean.User;
import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        switch (action) {

            case "/cart/list":
                showCart(request, response);
                break;

            case "/cart/edit":
                editCart(request, response);
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

    protected void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();

        if (u != null) {

            ArrayList<CartItem> list = new ArrayList<>();

            list = cartDB.getCartByUserId(u);

            float totalcost = 0;

            for (CartItem cartItem : list) {
                totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
            }

            int numberofservice = list.size();

            request.setAttribute("number", numberofservice);
            request.setAttribute("totalcost", totalcost);
            request.setAttribute("list", list);

        } else {

            ArrayList<CartItem> list = new ArrayList<>();
            list = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

            if (list != null) {

                float totalcost = 0;

                for (CartItem cartItem : list) {
                    totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
                }

                request.setAttribute("totalcost", totalcost);
                request.setAttribute("list", list);

            }
        }
        request.getRequestDispatcher("../view/cart/cart.jsp").forward(request, response);
    }

    protected void editCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();

        if (u != null) {

            ArrayList<CartItem> list = new ArrayList<>();

            list = cartDB.getCartByUserId(u);

            float totalcost = 0;

            for (CartItem cartItem : list) {
                int id = cartItem.getService().getId();
                String param = Integer.toString(id);
                int quantity = Integer.parseInt(request.getParameter(param));
                cartItem.setQuantity(quantity);
                cartDB.updateCart(cartItem.getUser(), cartItem.getService(), quantity);
                totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
            }

            int numberofservice = list.size();

            request.setAttribute("number", numberofservice);
            request.setAttribute("totalcost", totalcost);
            request.setAttribute("list", list);

        } else {

            ArrayList<CartItem> list = new ArrayList<>();
            list = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

            if (list != null) {

                float totalcost = 0;

                for (CartItem cartItem : list) {
                    int id = cartItem.getService().getId();
                    String param = Integer.toString(id);
                    int quantity = Integer.parseInt(request.getParameter(param));
                    cartItem.setQuantity(quantity);

                    totalcost += cartItem.getService().getSalePrice() * cartItem.getQuantity();
                }

                request.getSession().setAttribute("cart", list);
                request.setAttribute("totalcost", totalcost);
                request.setAttribute("list", list);

            }
        }
        response.sendRedirect("list");
    }

    protected void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();

        if (u != null) {

            int user_id = Integer.parseInt(request.getParameter("uid"));
            int service_id = Integer.parseInt(request.getParameter("sid"));
            User user = new User();
            Service service = new Service();

            cartDB.deleteCart(user, service);
        } else {

            ArrayList<CartItem> list = new ArrayList<>();
            list = (ArrayList<CartItem>) request.getSession().getAttribute("cart");

            if (list != null) {
                int user_id = Integer.parseInt(request.getParameter("uid"));
                int service_id = Integer.parseInt(request.getParameter("sid"));
                User user = new User();
                Service service = new Service();

                cartDB.deleteCart(user, service);
            }
            request.getSession().setAttribute("cart", list);
        }

        response.sendRedirect("list");
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
