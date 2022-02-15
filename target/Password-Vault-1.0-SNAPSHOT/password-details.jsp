<%-- 
    Document   : password-details
    Created on : 15 Feb, 2022, 1:59:33 PM
    Author     : LENOVO
--%>

<%@page import="com.begawoinc.passwordvault.utility.Cipher"%>
<%@page import="com.begawoinc.passwordvault.model.Passwords"%>
<%@page import="com.begawoinc.passwordvault.service.Passwords_service"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error-page.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Password Detail</title>

        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">

        <!-- Font Style - M PLUS Rounded 1c (Bold 700)  -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@700&display=swap" rel="stylesheet">
        <style>
            .beg-font-mplusrounded1c {
                font-family: 'M PLUS Rounded 1c', sans-serif;
            }

            .beg-font-segoeui {
                font-family: 'Segoe UI', sans-serif;
            }
        </style>

        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.png" />


    </head>
    <body>
        <div class="container-scroller">
            <!--Side bar-->
            <%@include file="sidebar.jsp" %>
            <!--/Side bar-->
            <div class="container-fluid page-body-wrapper">
                <!--Nav bar-->
                <%@include file="navbar.jsp" %>
                <!--/Nav bar-->
                <div class="main-panel">

                    <!--Main content-->
                    <div class="content-wrapper">
                        <%                            String password_primary_key = request.getParameter("password_primary_key");
                            System.out.println("SimplifiedJSPServlet.mergedScriptlets()::" + password_primary_key);
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
                                            <!--<input type="text" required class="form-control" placeholder="Password" name="password" value="<%= Utils.isEmpty(password.getPassword()) ? "Password Not Found" : Cipher.decrypt(password.getPassword(), password.getPassword_key())%>">-->
                                        </div>
                                        <button type="submit" class="btn btn-danger w-100 mb-3 mr-2 float-left">Delete</button>
                                        <button class="btn btn-dark w-100 float-right" data-dismiss="modal">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--/Main content-->

                    <!--Footer-->
                    <%@include file="footer.jsp" %>
                    <!--/Footer-->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js"></script>
        <script src="assets/js/hoverable-collapse.js"></script>
        <script src="assets/js/misc.js"></script>
        <script src="assets/js/settings.js"></script>
        <script src="assets/js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page -->
        <!-- End custom js for this page -->
    </body>
</html>
