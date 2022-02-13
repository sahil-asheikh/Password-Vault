<%-- 
    Document   : index
    Created on : 3 Feb, 2022, 10:24:04 PM
    Author     : LENOVO
--%>

<%@page import="com.begawoinc.passwordvault.service.Passwords_service"%>
<%@page import="com.begawoinc.passwordvault.model.Passwords"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error-page.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>

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
                    <%                        Passwords_service passwords_service = new Passwords_service();
                        List<Passwords> passwords = passwords_service.findPasswordsByUserID(user_primary_key);
                    %>
                    <!--Main content-->
                    <div class="content-wrapper">

                        <div class="row mt-md-3 mt-xl-3">
                            <div class="col-md-7 col-xl-7">
                                <div class="grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="beg-font-mplusrounded1c card-title fw-bold">Your Passwords</h4>
                                            </p>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th class="beg-font-mplusrounded1c fw-bold">Social</th>
                                                            <th class="beg-font-mplusrounded1c fw-bold">Username</th>
                                                            <th class="beg-font-mplusrounded1c fw-bold">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            for (Passwords password : passwords) {
                                                        %>
                                                        <tr>
                                                            <td class="beg-font-segoeui"><%= Utils.isEmpty(password.getApp_name()) ? "Not-Given" : password.getApp_name()%></td>
                                                            <td class="beg-font-segoeui"><%= Utils.isEmpty(password.getUsername()) ? "Not-Given" : password.getUsername()%></td>
                                                            <td class="beg-font-mplusrounded1c">
                                                                <!--for mobile screens-->
                                                                <a href="#" class="badge badge-success d-block d-sm-none"><i class="mdi mdi-eye"></i></a>
                                                                <!--for large screen-->
                                                                <a href="#" class="badge badge-success d-none d-md-block d-xl-block">Revel <i class="mdi mdi-arrow-right-bold"></i></a>
                                                            </td>
                                                        </tr>                                                                
                                                        <%
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 col-xl-5 d-none d-md-block d-xl-block">
                                <div class="revel-password" id="revel-password">
                                    <div class="grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Password</h4>
                                                <div class="d-none d-md-block d-xl-block mt-2 my-md-3 my-xl-3 text-center">
                                                    <img class="img-fluid bg-light rounded-circle p-3 w-25" src="assets/images/favicon.png">
                                                </div>
                                                <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                    <div class="text-md-center text-xl-left">
                                                        <h6 class="mb-1">Instagram</h6>
                                                        <p class="text-muted mb-0">instagram.com</p>
                                                    </div>
                                                </div>
                                                <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                    <div class="text-md-center text-xl-left">
                                                        <h6 class="mb-1">Username</h6>
                                                        <p class="text-muted mb-0">username</p>
                                                    </div>
                                                </div>
                                                <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                    <div class="text-md-center text-xl-left">
                                                        <h6 class="mb-1">Email</h6>
                                                        <p class="text-muted mb-0">username@gmail.com</p>
                                                    </div>
                                                </div>
                                                <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                                                    <div class="text-md-center text-xl-left">
                                                        <h6 class="mb-1">Password</h6>
                                                        <p class="text-muted mb-0">my password</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <a href="#" class="my-2 w-100 badge badge-primary">
                                                            Update <i class="mdi mdi-update"></i>
                                                        </a>
                                                    </div>
                                                    <div class="col-6">
                                                        <a href="#" class="mt-2 w-100 badge badge-danger">
                                                            Delete <i class="mdi mdi-delete"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
