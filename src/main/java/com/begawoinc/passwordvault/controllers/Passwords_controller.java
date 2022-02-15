/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.begawoinc.passwordvault.controllers;

import com.begawoinc.passwordvault.enums.PasswordResponseMessages;
import com.begawoinc.passwordvault.model.Passwords;
import com.begawoinc.passwordvault.service.Passwords_service;
import com.begawoinc.passwordvault.utility.Utils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Passwords_controller", urlPatterns = {"/Passwords_controller"})
public class Passwords_controller extends HttpServlet {

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
    Passwords password = new Passwords();
    Passwords_service password_service = new Passwords_service();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "addPassword":
                addPassword(request, response);
                break;
            case "updatePassword":
                updatePassword(request, response);
                break;
            case "deletePassword":
                deletePassword(request, response);
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

    private void addPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            password.setUser_primary_key(Utils.requiredNotNull(request.getParameter("user_primary_key"), "Didn't find user primary key"));
            password.setPassword(Utils.requiredNotNull(request.getParameter("password"), "Password should not be empty"));
            password.setPassword_key(Utils.requiredNotNull(Integer.parseInt(request.getParameter("password_key")), "Didn't find password key"));
            password.setUsername(Utils.requiredNotNull(request.getParameter("username"), "Username should not be empty"));
            password.setUser_email(Utils.requiredNotNull(request.getParameter("user_email"), "Didn't find user email"));
            password.setApp_name(Utils.requiredNotNull(request.getParameter("app_name"), "App Name should not be empty"));
            password.setUrl(request.getParameter("app_name").toLowerCase() + ".com/");
            message = password_service.addPassword(password);
        } catch (NumberFormatException e) {
            message = "com.begawoinc.passwordvault.controllers.Passwords_controller.addPassword()" + e.getMessage();
        } finally {
            if (message.equals(PasswordResponseMessages.PASSWORD_ADDED.getPasswordResponseMessages())) {
                response.sendRedirect("dashboard?message=" + message);
            } else {
                response.sendRedirect("dashboard?message=" + message);
            }
        }

    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            password.setPassword_primary_key(Utils.requiredNotNull(request.getParameter("password_primary_key"), "Password Primary Key should not be empty"));
            password.setPassword(Utils.requiredNotNull(request.getParameter("password"), "Password should not be empty"));
            password.setPassword_key(Utils.requiredNotNull(Integer.parseInt(request.getParameter("password_key")), "Password Key should not be empty"));
            password.setUsername(Utils.requiredNotNull(request.getParameter("username"), "Username should not be empty"));
            password.setUser_email(Utils.requiredNotNull(request.getParameter("user_email"), "User Email should not be empty"));
            password.setApp_name(Utils.requiredNotNull(request.getParameter("app_name"), "App Name should not be empty"));
            password.setUrl(Utils.requiredNotNull(request.getParameter("url"), "URL should not be empty"));
            message = password_service.updatePassword(password);
        } catch (NumberFormatException e) {
            message = "com.begawoinc.passwordvault.controllers.Passwords_controller.updatePassword()" + e.getMessage();
        } finally {
            response.sendRedirect("dashboard?message=" + message);
        }
    }

    private void deletePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String password_primary_key = Utils.requiredNotNull(request.getParameter("password_primary_key"), "Password Primary Key should not be empty");
            message = password_service.deletePassword(password_primary_key);
        } catch (NumberFormatException e) {
            message = "com.begawoinc.passwordvault.controllers.Passwords_controller.deletePassword()" + e.getMessage();
        } finally {
            response.sendRedirect("dashboard?message=" + message);
        }
    }

}
