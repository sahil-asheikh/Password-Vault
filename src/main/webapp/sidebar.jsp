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
        <!--<li class="nav-item menu-items <%// pageName.equals("admin_dashboard") ? "active" : ""%>">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-icon">
                    <i class="mdi mdi-laptop"></i>
                </span>
                <span class="menu-title beg-font-mplusrounded1c">Basic UI Elements</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item beg-font-mplusrounded1c"> <a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
                    <li class="nav-item beg-font-mplusrounded1c"> <a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
                    <li class="nav-item beg-font-mplusrounded1c"> <a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
                </ul>
            </div>
        </li>-->
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
    </ul>
</nav>