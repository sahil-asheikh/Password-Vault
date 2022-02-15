/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.controllers;

import com.begawoinc.passwordvault.enums.AuthResponseMessages;
import com.begawoinc.passwordvault.model.Users;
import com.begawoinc.passwordvault.service.Users_service;
import com.begawoinc.passwordvault.utility.Utils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Users_controller", urlPatterns = {"/Users_controller"})
public class Users_controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String message;
    Users user = new Users();
    Users_service user_service = new Users_service();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                loginUser(request, response);
                break;
            case "signup":
                signupUser(request, response);
                break;
            case "logout":
                logoutUser(request, response);
            case "updateUser":
                updateUser(request, response);
            default:
                break;
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

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            user.setUsername(Utils.requiredNotNull(request.getParameter("username"), "Username should not be empty"));
            user.setPassword(Utils.requiredNotNull(request.getParameter("password"), "Password should not be empty"));
            message = user_service.user_login(user, request);
        } catch (Exception e) {
            message = "com.begawoinc.passwordvault.controllers.User_controller.userLogin()" + e.getMessage();
        } finally {
            if (message.equals(AuthResponseMessages.LOGIN_SUCCESS.getAuthResponseMessage())) {
                response.sendRedirect("dashboard?message=" + message);
            } else {
                response.sendRedirect("login?message=" + message);
            }
        }

    }

    private void signupUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            user.setUsername(Utils.requiredNotNull(request.getParameter("username"), "Username should not be empty"));
            user.setUser_email(Utils.requiredNotNull(request.getParameter("email"), "Email should not be empty"));
            user.setPassword(Utils.requiredNotNull(request.getParameter("password"), "Password should not be empty"));
            message = user_service.register_user(user);
        } catch (Exception e) {
            message = "com.begawoinc.passwordvault.controllers.User_controller.register_user()" + e.getMessage();
        } finally {
            response.sendRedirect("login?message=" + message + " please login to continue");
        }
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("login");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            user.setUser_primary_key(Utils.requiredNotNull(request.getParameter("user_primary_key"), "User Primary Key found empty"));
            user.setUsername(Utils.requiredNotNull(request.getParameter("username"), "Username should not be empty"));
            user.setName(Utils.requiredNotNull(request.getParameter("name"), "Name should not be empty"));
            user.setUser_email(Utils.requiredNotNull(request.getParameter("user_email"), "Email should not be empty"));
            user.setPassword(Utils.requiredNotNull(request.getParameter("password"), "Password should not be empty"));
            user.setGender(Utils.requiredNotNull(request.getParameter("gender"), "Gender should not be empty"));
            message = user_service.update_user(user);
        } catch (Exception e) {
            message = "com.begawoinc.passwordvault.controllers.User_controller.updateUser()" + e.getMessage();
        } finally {
            response.sendRedirect("profile?message=" + message);
        }
    }

}
