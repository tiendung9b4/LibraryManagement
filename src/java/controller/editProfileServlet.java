/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Helper;
import dal.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import model.Users;

/**
 *
 * @author tanki
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class editProfileServlet extends HttpServlet {

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
        String email = request.getParameter("email");
        String phno = request.getParameter("phone");
        String address = request.getParameter("address");
        String name = request.getParameter("name");
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");
        user.setName(name);
        user.setEmail(email);
        user.setPhno(phno);
        user.setAddress(address);

        if (oldPass.equals(user.getPassword())) {
            user.setPassword(newPass);
        }

        Part filePart = request.getPart("imageFile");
        // Get the filename and extract its extension
        String fileName = filePart.getSubmittedFileName();
        user.setAvt(fileName);
        String oldImagePath = request.getParameter("oldImagePath");
        if (!fileName.isEmpty()) {
//            String oldImagePath = request.getParameter("oldImagePath");
            String path = "D:\\The Witcher\\SE1742_2\\web\\img\\avt";
            Helper.uploadFile(filePart.getInputStream(), path+File.separator+user.getAvt());
//            filePart.write(path + File.separator + user.getAvt());
//            user.setAvt(fileName);
            if (oldImagePath != null && !oldImagePath.isEmpty() && !oldImagePath.equals("avt.jpg")) {
                String oldPath = "D:\\The Witcher\\SE1742_2\\web\\img\\avt";
//                oldImgFile.delete();
                Helper.deleteFile(oldPath + File.separator + oldImagePath);
            }

        } else {
            user.setAvt(oldImagePath);
        }
        // Retrieve the old image path from the request
//        String oldImagePath = request.getParameter("oldImagePath");
//        if (!fileName.isEmpty()) {
//
////            filePart.write(imagePath);
//            user.setAvt(imagePath);
//        }
//        if (oldImagePath != null && !oldImagePath.isEmpty()) {
//            String oldImageFilePath = getServletContext().getRealPath(oldImagePath);
//            File oldImageFile = new File(oldImageFilePath);
//            oldImageFile.delete();
//        } else {
//            user.setAvt(oldImagePath);
//        }
        UsersDAO dao = new UsersDAO();
        dao.updateUser(user.getEmail(), user.getPhno(), user.getAddress(), user.getName(), user.getPassword(), user.getAvt(), user.getId());
        session.setAttribute("acc", user);
        response.sendRedirect("home");

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
