<%-- 
    Document   : navbar
    Created on : 3 Feb, 2022, 10:32:32 PM
    Author     : LENOVO
--%>

<%@page import="com.begawoinc.passwordvault.utility.Utils"%>
<%
    if (Utils.isEmpty(String.valueOf(session.getAttribute("user_primary_key")))) {
        response.sendRedirect("login.jsp?msg=Login Frist");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar p-0 fixed-top d-flex flex-row">
    <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
        <a class="navbar-brand brand-logo-mini beg-font-mplusrounded1c" href="index.html">
            <!--<img src="assets/images/favicon.png" alt="logo" />-->
            <span class="text-light  beg-font-mplusrounded1c">Password Vault</span>
        </a>
    </div>
    <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>
        <ul class="navbar-nav w-100">
            <li class="nav-item w-100">
                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                    <input type="text" class="form-control beg-font-mplusrounded1c" placeholder="Search passwords">
                </form>
            </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown d-none d-lg-block">
                <!-- Button to trigger save password modal -->
                <button type="button" class="nav-link btn btn-success create-new-button beg-font-mplusrounded1c" data-toggle="modal" data-target="#savePassword">
                    Create New Password
                </button>
                <!-- /Button to trigger save password modal -->
            </li>
        </ul>
        <!-- Button to trigger save password modal -->
        <button type="button" class="navbar-toggler navbar-toggler-right d-lg-none align-self-center beg-font-mplusrounded1c text-success" data-toggle="modal" data-target="#savePassword">
            <span class="mdi mdi-plus-box-outline text-success"></span>
            <!--Add Password-->
        </button>
        <!-- /Button to trigger save password modal -->
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-format-line-spacing text-primary"></span>
        </button>
    </div>
</nav>

<!-- Modal to add password -->
<div class="modal fade" id="savePassword" tabindex="-1" aria-labelledby="savePasswordLabel" aria-hidden="true">
    <div class="modal-dialog mx-3 m-md-auto m-xl-auto m-lg-auto">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="savePasswordLabel">Add Password</h5>
                <button type="button" class="btn-close bg-danger rounded border-0" data-dismiss="modal" aria-label="Close">
                    <span class="mdi mdi-close text-light"></span>
                </button>
            </div>
            <form class="modal-body" action="Passwords_controller" method="post">
                <input type="hidden" name="action" value="addPassword">
                <div class="form-group">
                    <label for="exampleInputUsername1">Password</label>
                    <input type="text" required class="form-control" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Key</label>
                    <input type="number" required class="form-control" placeholder="0 to 99">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Username</label>
                    <input type="text" required class="form-control" placeholder="Enter your username">
                </div>
                <div class="form-group">
                    <label for="exampleInputConfirmPassword1">App Name</label>
                    <input type="text" required class="form-control" placeholder="Enter app name">
                </div>
                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                <button class="btn btn-dark" data-dismiss="modal">Cancel</button>
            </form>
        </div>
    </div>
</div>
