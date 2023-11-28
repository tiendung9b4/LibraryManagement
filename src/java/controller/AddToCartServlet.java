/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Cart;

/**
 *
 * @author tanki
 */
public class AddToCartServlet extends HttpServlet {

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
        List<Cart> cartList = new ArrayList<>();
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("bookId"));
        HttpSession session = request.getSession();
        Cart cm = new Cart();
        cm.setBookId(id);
        cm.setQuantity(1);
        List<Cart> cart_list = (List<Cart>) session.getAttribute("cart");
        if (cart_list == null) {
            cartList.add(cm);
            session.setAttribute("cart", cartList);
            out.println("session created and added the list");
            response.sendRedirect("home");
        } else {
            cartList = cart_list;
            boolean exist = false;
            cartList.contains(cm);
            for (Cart c : cartList) {
                if (c.getBookId() == id) {
                    exist = true;
                    request.setAttribute("messe", "Exist in cart!");
                    request.getRequestDispatcher("home").forward(request, response);
                }
            }
            if (!exist) {
                cartList.add(cm);
//                out.println("Added to cart");
                response.sendRedirect("home");
            }
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

}
