<%-- 
    Document   : settings
    Created on : 6 Feb, 2022, 4:34:42 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error-page.jsp"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Setting</title>

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
                                            <h4 class="card-title">User Setting</h4>
                                            <hr class="dropdown-divider">
                                            <form class="forms-sample" action="Users_controller" method="post">
                                                <input type="hidden" name="action" value="updateUser">
                                                <input type="hidden" name="user_primary_key" value="<%= userNav.getUser_primary_key()%>">

                                                <div class="form-group">
                                                    <label for="exampleInputName1">Name</label>
                                                    <input type="text" class="form-control" name="name" placeholder="Enter Your Name" value="<%= Utils.isEmpty(userNav.getName()) ? "" : userNav.getName()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail3">Email address</label>
                                                    <input type="email" class="form-control" name="user_email" placeholder="Please Enter your Email" value="<%= Utils.isEmpty(userNav.getUser_email()) ? "" : userNav.getUser_email()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword4">Username</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">@</span>
                                                        </div>
                                                        <input type="text" class="form-control" name="username" placeholder="Please Enter your Username" value="<%= Utils.isEmpty(userNav.getUsername()) ? "" : userNav.getUsername()%>" aria-label="Username" aria-describedby="basic-addon1">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputPassword4">Password</label>
                                                    <input type="text" class="form-control" name="password" placeholder="Please Enter your Password" value="<%= Utils.isEmpty(userNav.getPassword()) ? "" : userNav.getPassword()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleSelectGender">Gender</label>
                                                    <select class="form-control" name="gender">
                                                        <option value="Male" <%= userNav.getGender().equals("Male") ? "selected" : ""%>>Male</option>
                                                        <option value="Female" <%= userNav.getGender().equals("Female") ? "selected" : ""%>>Female</option>
                                                        <option value="Other" <%= userNav.getGender().equals("Other") ? "selected" : ""%>>Other</option>
                                                    </select>
                                                </div>
                                                <hr class="dropdown-divider my-3" >
                                                <button type="submit" class="btn btn-primary mr-2">Update</button>
                                            </form>
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
