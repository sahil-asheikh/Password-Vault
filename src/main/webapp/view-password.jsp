<%-- 
    Document   : view-password
    Created on : 14 Feb, 2022, 7:55:46 PM
    Author     : LENOVO
--%>

<%@page import="com.begawoinc.passwordvault.utility.Cipher"%>
<%@page import="com.begawoinc.passwordvault.service.Passwords_service"%>
<%@page import="com.begawoinc.passwordvault.model.Passwords"%>
<%@page import="com.begawoinc.passwordvault.utility.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String password_primary_key = request.getParameter("password_primary_key");
    if (Utils.isEmpty(password_primary_key)) {
%>
<div class="grid-margin stretch-card">
    <!--for large screens-->
    <div class="card d-none d-md-block d-lg-block d-xl-block">
        <div class="card-body">
            <div class="d-none d-md-block d-xl-block mt-2 my-md-3 my-xl-3 text-center">
                <img class="img-fluid bg-light rounded-circle p-3 w-25" src="assets/images/favicon.png">
            </div>
            <h3 class="mb-0 text-center text-uppercase">Please Select the password to view</h3>
        </div>
    </div>
    <!-- Modal to add password mobile screens -->
    <div class="d-block d-md-none d-lg-none d-xl-none">
        <div class="modal fade" id="savePassword" tabindex="-1" aria-labelledby="savePasswordLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered mx-3 m-md-auto m-xl-auto m-lg-auto">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="d-none d-md-block d-xl-block mt-2 my-md-3 my-xl-3 text-center">
                            <img class="img-fluid bg-light rounded-circle p-3 w-25" src="assets/images/favicon.png">
                        </div>
                        <h3 class="mb-0 text-center text-uppercase">Please Select the password to view</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
} else {
    Passwords_service passwords_service = new Passwords_service();
    Passwords password = passwords_service.findPasswordByPasswordID(password_primary_key);
%>
<div class="grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Password</h4>
            <div class="d-none d-md-block d-xl-block mt-2 my-md-3 my-xl-3 text-center">
                <img class="img-fluid bg-light rounded-circle p-3 w-25" src="assets/images/favicon.png">
            </div>
            <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                <div class="text-md-center text-xl-left">
                    <h6 class="mb-1"><%= Utils.isEmpty(password.getApp_name()) ? "App name is not mentioned" : password.getApp_name()%></h6>
                    <p class="text-muted mb-0"><%= Utils.isEmpty(password.getUrl()) ? "URL is not mentioned" : password.getUrl()%></p>
                </div>
            </div>
            <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                <div class="text-md-center text-xl-left">
                    <h6 class="mb-1">Username</h6>
                    <p class="text-muted mb-0"><%= Utils.isEmpty(password.getUsername()) ? "Username is not mentioned" : password.getUsername()%></p>
                </div>
            </div>
            <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                <div class="text-md-center text-xl-left">
                    <h6 class="mb-1">Email</h6>
                    <p class="text-muted mb-0"><%= Utils.isEmpty(password.getUser_email()) ? "Email is not mentioned" : password.getUser_email()%></p>
                </div>
            </div>
            <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                <div class="text-md-center text-xl-left">
                    <h6 class="mb-1">Password</h6>
                    <p class="text-muted mb-0"><%= Utils.isEmpty(password.getPassword()) ? "Password is not mentioned" : Cipher.decrypt(password.getPassword(), password.getPassword_key())%></p>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-6">
                    <a href="#" class="my-2 w-100 badge badge-primary" data-toggle="modal" data-target="#updatePassword">
                        Update <i class="mdi mdi-update"></i>
                    </a>
                </div>
                <div class="col-6">
                    <a href="#" class="mt-2 w-100 badge badge-danger" data-toggle="modal" data-target="#deletePassword">
                        Delete <i class="mdi mdi-delete"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal to update password -->
<div class="modal fade" id="updatePassword" tabindex="-1" aria-labelledby="updatePasswordLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mx-3 m-md-auto m-xl-auto m-lg-auto">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updatePasswordLabel">Update Password</h5>
                <button type="button" class="btn-close bg-danger rounded border-0" data-dismiss="modal" aria-label="Close">
                    <span class="mdi mdi-close text-light"></span>
                </button>
            </div>
            <form class="modal-body" action="Passwords_controller" method="post">
                <input type="hidden" name="action" value="updatePassword">
                <input type="hidden" name="password_primary_key" value="<%= Utils.isEmpty(password.getPassword_primary_key()) ? "" : password.getPassword_primary_key()%>">
                <input type="hidden" name="password_key" value="<%= Utils.isEmpty(String.valueOf(password.getPassword_key())) ? "" : password.getPassword_key()%>">

                <div class="form-group">
                    <label for="exampleInputUsername1">Password</label>
                    <input type="text" required class="form-control" placeholder="Password" name="password" value="<%= Utils.isEmpty(password.getPassword()) ? "Password Not Found" : Cipher.decrypt(password.getPassword(), password.getPassword_key())%>">
                </div>
                <div class="form-group">
                    <label for="exampleInputUsername1">Email</label>
                    <input type="text" required class="form-control" placeholder="Password" name="user_email" value="<%= Utils.isEmpty(password.getUser_email()) ? "Email Not Found" : password.getUser_email()%>">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Username</label>
                    <input type="text" required class="form-control" placeholder="Enter your username" name="username" value="<%= Utils.isEmpty(password.getUsername()) ? "Username Not Found" : password.getUsername()%>">
                </div>
                <div class="form-group">
                    <label for="exampleInputConfirmPassword1">App Name</label>
                    <input type="text" required class="form-control" placeholder="Enter app name" name="app_name" value="<%= Utils.isEmpty(password.getApp_name()) ? "App Name Not Found" : password.getApp_name()%>">
                </div>
                <div class="form-group">
                    <label for="exampleInputConfirmPassword1">App Name</label>
                    <input type="text" required class="form-control" placeholder="Enter app name" name="url" value="<%= Utils.isEmpty(password.getUrl()) ? "URL Not Found" : password.getUrl()%>">
                </div>
                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                <button class="btn btn-dark" data-dismiss="modal">Cancel</button>
            </form>
        </div>
    </div>
</div>

<!-- Modal to delete password -->
<div class="modal fade" id="deletePassword" tabindex="-1" aria-labelledby="deletePasswordLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mx-3 m-md-auto m-xl-auto m-lg-auto">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePasswordLabel">Delete Password</h5>
                <button type="button" class="btn-close bg-danger rounded border-0" data-dismiss="modal" aria-label="Close">
                    <span class="mdi mdi-close text-light"></span>
                </button>
            </div>
            <form class="modal-body" action="Passwords_controller" method="post">
                <input type="hidden" name="action" value="deletePassword">
                <input type="hidden" name="password_primary_key" value="<%= Utils.isEmpty(password.getPassword_primary_key()) ? "" : password.getPassword_primary_key()%>">

                <div class="form-group">
                    <label for="exampleInputUsername1">Are you really want to delete the password</label>
<!--                    <input type="text" required class="form-control" placeholder="Password" name="password" value="<%= Utils.isEmpty(password.getPassword()) ? "Password Not Found" : Cipher.decrypt(password.getPassword(), password.getPassword_key())%>">-->
                </div>
                <button type="submit" class="btn btn-danger w-100 mb-3 mr-2 float-left">Delete</button>
                <button class="btn btn-success w-100 float-right" data-dismiss="modal">Cancel</button>
            </form>
        </div>
    </div>
</div>
<%
    }
%>