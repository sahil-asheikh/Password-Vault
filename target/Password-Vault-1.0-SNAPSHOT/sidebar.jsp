<%-- 
    Document   : sidebar
    Created on : 3 Feb, 2022, 10:33:51 PM
    Author     : LENOVO
--%>

<%
    String uri = null, pageName = null;
    try {
        uri = request.getRequestURI();
        pageName = uri.substring(uri.lastIndexOf("/") + 1).replace(".jsp", "");
    } catch (Exception e) {
        System.out.println("Page URI : " + e.getMessage());
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <a class="sidebar-brand brand-logo" href="index.html">
            <!--<img src="assets/images/logo.svg" alt="logo" />-->
            <span class="text-light beg-font-mplusrounded1c">Password Vault</span>
        </a>
        <a class="sidebar-brand brand-logo-mini" href="index.html">
            <!--<img src="assets/images/logo-mini.svg" alt="logo" />-->
            <span class="text-light beg-font-mplusrounded1c">Password Vault</span>
        </a>
    </div>
    <ul class="nav">
        <li class="nav-item nav-category">
            <span class="nav-link beg-font-segoeui">Navigation</span>
        </li>
        <li class="nav-item menu-items <%= pageName.equals("index") ? "active" : ""%>">
            <a class="nav-link" href="index.jsp">
                <span class="menu-icon">
                    <i class="mdi mdi-speedometer"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Dashboard</span>
            </a>
        </li>
        <li class="nav-item menu-items <%= pageName.equals("profile") ? "active" : ""%>">
            <a class="nav-link" href="profile.jsp">
                <span class="menu-icon">
                    <i class="mdi mdi-account"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Profile</span>
            </a>
        </li>
        <li class="nav-item menu-items <%= pageName.equals("settings") ? "active" : ""%>">
            <a class="nav-link" href="settings.jsp">
                <span class="menu-icon">
                    <i class="mdi mdi-settings"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Settings</span>
            </a>
        </li>
        <li class="nav-item menu-items">
            <a class="nav-link" href="Users_controller?action=logout">
                <span class="menu-icon">
                    <i class="mdi mdi-logout"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Log out</span>
            </a>
        </li>
        <!--<li class="nav-item menu-items">
            <div role="separator" class="dropdown-divider"></div>
        </li>
        <li class="nav-item nav-category">
            <span class="nav-link beg-font-segoeui">Extras</span>
        </li>
        <li class="nav-item menu-items <%= pageName.equals("terms-condition")%>">
            <a class="nav-link" href="terms-condition.jsp">
                <span class="menu-icon">
                    <i class="mdi mdi-security"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Privacy Policy</span>
            </a>
        </li>
        <li class="nav-item menu-items <%= pageName.equals("about-us")%>">
            <a class="nav-link" href="about-us.jsp">
                <span class="menu-icon">
                    <i class="mdi mdi-file-document-box"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Abouts</span>
            </a>
        </li>-->
    </ul>
</nav>