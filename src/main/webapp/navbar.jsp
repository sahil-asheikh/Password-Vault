<%-- 
    Document   : navbar
    Created on : 3 Feb, 2022, 10:32:32 PM
    Author     : LENOVO
--%>

<%@page import="com.begawoinc.passwordvault.model.Users"%>
<%@page import="com.begawoinc.passwordvault.service.Users_service"%>
<%@page import="com.begawoinc.passwordvault.utility.Utils"%>
<%
    String user_primary_key = String.valueOf(session.getAttribute("user_primary_key"));
    if (Utils.isEmpty(user_primary_key)) {
        response.sendRedirect("login?message=Please login to continue");
    }

    Users_service users_serviceNav = new Users_service();
    Users userNav = users_serviceNav.findUserByUsername(String.valueOf(session.getAttribute("user_primary_key")));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar p-0 fixed-top d-flex flex-row">
    <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
        <a class="navbar-brand brand-logo-mini beg-font-mplusrounded1c" href="dashboard">
            <img class="d-block d-md-none d-lg-none d-xl-none" src="assets/images/favicon.png" alt="logo"/>
            <span class="text-light beg-font-mplusrounded1c d-none d-md-block d-lg-block d-xl-block">Password Vault</span>
        </a>
    </div>
    <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>
        <ul class="navbar-nav w-100">
            <li class="nav-item w-100">
                <!--<form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                    <input type="text" class="form-control beg-font-mplusrounded1c" placeholder="Search passwords">
                </form>-->
                <label>${param.message}</label>
            </li>
        </ul>
        <!--Add Password-->
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown d-none d-lg-block">
                <!-- Button to trigger save password modal for large screen -->
                <button type="button" class="nav-link btn btn-success create-new-button beg-font-mplusrounded1c" data-toggle="modal" data-target="#savePassword">
                    Create New Password
                </button>
                <!-- /Button to trigger save password modal -->
            </li>
        </ul>
        <!-- Button to trigger save password modal for mobile screen-->
        <button type="button" class="navbar-toggler navbar-toggler-right d-lg-none align-self-center beg-font-mplusrounded1c text-success" data-toggle="modal" data-target="#savePassword">
            <span class="mdi mdi-plus-box-outline text-success"></span>
        </button>
        <!-- /Button to trigger side bar for mobile screen -->
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-format-line-spacing text-primary"></span>
        </button>
    </div>
</nav>

<!-- Modal to add password -->
<div class="modal fade" id="savePassword" tabindex="-1" aria-labelledby="savePasswordLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mx-3 m-md-auto m-xl-auto m-lg-auto">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="savePasswordLabel">Add Password</h5>
                <button type="button" class="btn-close bg-danger rounded border-0" data-dismiss="modal" aria-label="Close">
                    <span class="mdi mdi-close text-light"></span>
                </button>
            </div>
            <form class="modal-body" action="Passwords_controller" method="post">
                <input type="hidden" name="action" value="addPassword">
                <input type="hidden" name="user_primary_key" value="<%= Utils.isEmpty(userNav.getUser_primary_key()) ? "" : userNav.getUser_primary_key()%>">
                <input type="hidden" name="user_email" value="<%= Utils.isEmpty(userNav.getUser_email()) ? "" : userNav.getUser_email()%>">
                <input type="hidden" name="password_key" value="<%= Utils.isEmpty(userNav.getPassword()) ? "" : userNav.getPassword().length()%>">

                <div class="form-group">
                    <label for="exampleInputUsername1">Password</label>
                    <input type="text" required class="form-control" placeholder="Password" name="password">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Username</label>
                    <input type="text" required class="form-control" placeholder="Enter your username" name="username">
                </div>
                <div class="form-group">
                    <label for="exampleInputConfirmPassword1">App Name</label>
                    <input type="text" required class="form-control" placeholder="Enter app name" name="app_name">
                </div>
                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                <button class="btn btn-dark" data-dismiss="modal">Cancel</button>
            </form>
        </div>
    </div>
</div>
