/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CartItem;
import bean.Receiver;
import bean.User;
import dao.CartDAO;
import dao.ReceiverDAO;
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
                
            default:
                getCartInfo(request, response);
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
            throws ServletException, IOException{
        User u = (User) request.getSession().getAttribute("user");
        CartDAO cartDB = new CartDAO();
        ReceiverDAO receiverDB = new ReceiverDAO();
        
        ArrayList<Receiver> receiverList = (ArrayList<Receiver>)request.getSession().getAttribute("receivers");
        if (u!=null && receiverList == null){
            receiverList = receiverDB.getReceivers(u.getId());
        }
        ArrayList<CartItem> list = new ArrayList<>();
        if (u!= null){
            
            
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
        }
        request.getSession().setAttribute("receivers", receiverList);
        request.getRequestDispatcher("../view/reservation/reservationContact.jsp").forward(request, response);
    }

    private void addReceiver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User u = (User) request.getSession().getAttribute("user");
        String name = request.getParameter("fullName");
        boolean gender = request.getParameter("gender").equals("male");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        
        ArrayList<Receiver> receivers = (ArrayList<Receiver>) request.getSession().getAttribute("receivers");
        
        
        Receiver r = new Receiver();
        r.setId(receivers.size());
        r.setFullName(name);
        r.setGender(gender);
        r.setAddress(address);
        r.setEmail(email);
        r.setMobile(mobile);
        r.setUser(u);
        
        receivers.add(r);
        request.getSession().removeAttribute("receivers");
        request.getSession().setAttribute("receivers", receivers);
        
        response.sendRedirect("../contact");
    }
    
    private void getReservationInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String[] raw_receiverid = request.getParameterValues("receiver");
        ArrayList<Integer> receiverIDs = new ArrayList<>();
        for (String s: raw_receiverid){
            receiverIDs.add(Integer.parseInt(s));
        }
        request.getSession().setAttribute("receiverIDs",receiverIDs);
        response.sendRedirect("../reservationcompletion");
    }
}