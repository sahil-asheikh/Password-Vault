<%-- 
    Document   : profile
    Created on : 6 Feb, 2022, 4:34:30 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error-page.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Profile</title>

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
                        <div class="row">
                            <div class="col-md-6 col-lg-6 col-xl-8">
                                <div class="grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">User Profile</h4>
                                            <hr class="dropdown-divider">
                                            <br>
                                            <div class="form-group">
                                                <h5 type="text" class=""> <%= Utils.isEmpty(userNav.getName()) ? "Update Profile to save your name" : "Name: " + userNav.getName()%></h5>
                                            </div>
                                            <div class="form-group">
                                                <h5 type="text" class=""> <%= Utils.isEmpty(userNav.getUser_email()) ? "Update Profile to save your email" : "Email: " + userNav.getUser_email()%></h5>
                                            </div>
                                            <div class="form-group">
                                                <h5 type="text" class=""> <%= Utils.isEmpty(userNav.getUsername()) ? "Update Profile to save your username" : "Username: @" + userNav.getUsername()%></h5>
                                            </div>
                                            <div class="form-group">
                                                <h5 type="text" class=""> <%= Utils.isEmpty(userNav.getGender()) ? "Update Profile to save your gender" : "Gender: " + userNav.getGender()%></h5>
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
