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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Borrow;
import model.Cart;
import model.LibCard;
import model.Users;

/**
 *
 * @author tanki
 */
public class CartDetailServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Users acc = (Users) session.getAttribute("acc");
            DAO dao = new DAO();
            LibCard card = dao.getCard(Integer.toString(acc.getId()));

            List<Cart> cart_list = (List<Cart>) request.getSession().getAttribute("cart");

            if (acc == null) {

                response.sendRedirect("login");

            } else {
                if (card == null) {
                    request.setAttribute("mess3", "Please register Library Card to Borrow Book!");
                    request.getRequestDispatcher("rLibCard.jsp").forward(request, response);
                } else {
                    String bookId = request.getParameter("id");
                    String cardId = Integer.toString(card.getCardId());
                    dao.addBorrow(cardId);
                    Borrow borrow = dao.getBorrowById();
                    int borrowId = borrow.getBorrowId();
                    LocalDate currentDate = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    String today = currentDate.format(formatter);
                    int number = cart_list.size();

                    dao.addBorrowDetails(bookId, today, Integer.toString(number), Integer.toString(borrowId));
                    request.setAttribute("mess", "Your borrow order has sent successfully!");
                    request.getRequestDispatcher("cart").forward(request, response);
                }
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
