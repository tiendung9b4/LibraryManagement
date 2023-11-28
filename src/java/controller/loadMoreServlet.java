/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.ProductsDAO;
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
import model.Products;

/**
 *
 * @author tanki
 */
public class loadMoreServlet extends HttpServlet {

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
        DAO dao = new DAO();
        String n = request.getParameter("exist");
        String cid = request.getParameter("cid");
        int amount = Integer.parseInt(n);
        PrintWriter out = response.getWriter();
//        List<Book> list = dao.getNextBooksByCid(amount, cid);

//        out.println("<h1>" + cid + "</h1>");
        if (cid.isEmpty()) {
            List<Book> list = dao.getNextBooks(amount);
            for (Book o : list) {
                out.println("  <div class=\"bookPro col-sm-3 mt-4\">\n"
                        + "                                <div class=\"card\">\n"
                        + "                                    <div class=\"img-container\">\n"
                        + "                                        <img alt=\"\" src=\"img/" + o.getImg() + "\" class=\"image card-img-top\">\n"
                        + "                                        <div class=\"overlay\">\n"
                        + "                                            <button class=\"btn btn-outline-secondary btn-sm\"><i class=\"fas fa-cart-plus mr-2\"></i>Add to Cart</button>\n"
                        + "                                            <button class=\"btn btn-outline-secondary btn-sm\"><i class=\"far fa-heart\"></i></button>\n<p style=\"text-align: left;font-size: 12px\" class=\"card-text pt-5\">" + o.getDescribe() + "</p>\n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                    <div class=\"card-body\">\n"
                        + "                                        <a style=\"text-decoration: none;\"  href=\"detail?bId=" + o.getBookId() + "\">   <h5 class=\"card-title\">" + o.getTitle() + "</h5> </a>\n"
                        + "                                        <h6 class=\"card-subtitle mb-2 text-muted\">Author: " + o.getAuthor() + "</h6>\n"
                        + "                                        <h6 class=\"card-subtitle mb-2 text-muted\">Genre: " + o.getCategory() + "</h6>\n"
                        + "\n"
                        + "\n"
                        + "                                    </div>\n"
                        + "                                </div>\n"
                        + "                            </div>");
            }
            return;
        }
        List<Book> list = dao.getNextBooksByCid(amount, cid);
        for (Book o : list) {
            out.println("  <div class=\"bookPro col-sm-3 mt-4\">\n"
                    + "                                <div class=\"card\">\n"
                    + "                                    <div class=\"img-container\">\n"
                    + "                                        <img alt=\"\" src=\"img/" + o.getImg() + "\" class=\"image card-img-top\">\n"
                    + "                                        <div class=\"overlay\">\n"
                    + "                                            <button class=\"btn btn-outline-secondary btn-sm\"><i class=\"fas fa-cart-plus mr-2\"></i>Add to Cart</button>\n"
                    + "                                            <button class=\"btn btn-outline-secondary btn-sm\"><i class=\"far fa-heart\"></i></button>\n<p style=\"text-align: left;font-size: 12px\" class=\"card-text pt-5\">" + o.getDescribe() + "</p>\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "                                    <div class=\"card-body\">\n"
                    + "                                        <a style=\"text-decoration: none;\"  href=\"detail?bId=" + o.getBookId() + "\">   <h5 class=\"card-title\">" + o.getTitle() + "</h5> </a>\n"
                    + "                                        <h6 class=\"card-subtitle mb-2 text-muted\">Author: " + o.getAuthor() + "</h6>\n"
                    + "                                        <h6 class=\"card-subtitle mb-2 text-muted\">Genre: " + o.getCategory() + "</h6>\n"
                    + "\n"
                    + "\n"
                    + "                                    </div>\n"
                    + "                                </div>\n"
                    + "                            </div>");
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
