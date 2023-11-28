/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.Helper;
import dal.ProductsDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Book;
import model.Products;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet(name = "UpdateServlet", urlPatterns = {"/update"})
public class UpdateServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
    int id;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAO dao = new DAO();
            id = Integer.parseInt(request.getParameter("id"));
            Book p = dao.getBookById(id);
            request.setAttribute("product", p);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
        try {

            String sTitle = request.getParameter("title");
            String sAuthor = request.getParameter("author");
            String sPyear = request.getParameter("publicYear");
            int sCid = Integer.parseInt(request.getParameter("cid"));
            String sDescribe = request.getParameter("describe");
//            String sImg = request.getParameter("img");
//            String oldImg = request.getParameter("oldImgPath");
            Part part = request.getPart("img");
            String sImg = part.getSubmittedFileName();
            String oldImagePath = request.getParameter("oldImgPath");
            if (!sImg.isEmpty()) {
                String path = "D:\\The Witcher\\SE1742_2\\web\\img";
                Helper.uploadFile(part.getInputStream(), path + File.separator + sImg);
                if (oldImagePath != null && !oldImagePath.isEmpty()) {
                    String oldPath = "D:\\The Witcher\\SE1742_2\\web\\img";
//                oldImgFile.delete();
                    Helper.deleteFile(oldPath + File.separator + oldImagePath);
                }
            } else {
                sImg = oldImagePath;

            }

//            int scaId = Integer.parseInt(request.getParameter("caId"));
//            String sname = request.getParameter("name");
//            String snote = request.getParameter("note");
//            String simg = request.getParameter("img");
//            p.setCatalogy_Id(caId);
//            p.setName(name);
//            p.setNote(note);
//            p.setImages(img);
            String number = request.getParameter("number");
            DAO dao = new DAO();
            dao.updateBook(sTitle, sAuthor, sPyear, sDescribe, sCid, sImg, number, id);
            response.sendRedirect("list");
        } catch (Exception e) {
            System.out.println(e);
        }
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
