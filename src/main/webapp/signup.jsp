<%-- 
    Document   : signup
    Created on : 6 Feb, 2022, 1:43:31 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error-page.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sign Up</title>

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
        <div class="container-scroller bg-dark">
            <div class="container-fluid page-body-wrapper">
                <div class="main-panel">
                    <!--Main content-->
                    <div class="container-scroller">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
                                    <div class="card col-lg-4 mx-md-auto">
                                        <div class="card-body px-md-5">
                                            <h3 class="card-title text-left mb-3">Register</h3>
                                            <div class="form-group text-center">
                                                <label>${param.message}</label>
                                            </div>
                                            <form action="Users_controller" method="get">
                                                <input type="hidden" name="action" value="signup">
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input type="text" class="form-control p_input" name="username" placeholder="Please enter your username">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" class="form-control p_input" name="email" placeholder="Please enter your email">
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" class="form-control p_input" name="password" placeholder="Please enter your password">
                                                </div>
                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-primary btn-block enter-btn">Register</button>
                                                </div>
                                                <p class="sign-up text-center">Already have an Account?<a href="login"> Login</a></p>
                                                <p class="terms">By creating an account you are accepting our<a href="terms-condition"> Terms & Conditions</a></p>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- content-wrapper ends -->
                            </div>
                            <!-- row ends -->
                        </div>
                        <!-- page-body-wrapper ends -->
                    </div>
                    <!--/Main content-->
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
