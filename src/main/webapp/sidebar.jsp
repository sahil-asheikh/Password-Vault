<%-- 
    Document   : sidebar
    Created on : 3 Feb, 2022, 10:33:51 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav id="sidebar">
    <div class="sidebar-header">
        <h3 class="beg-font-mplusrounded1c text-dark">
            <i class="bi bi-columns-gap"></i> Dashboard
        </h3>
    </div>

    <ul class="list-unstyled components beg-font-mplusrounded1c sub-heading ms-2">
        <li>
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle active">Home</a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">Home 1</a>
                </li>
                <li>
                    <a href="#">Home 2</a>
                </li>
                <li>
                    <a href="#">Home 3</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">About</a>
        </li>
        <li>
            <a href="#">Portfolio</a>
        </li>
        <li>
            <a href="#">Posts</a>
        </li>
        <li>
            <a href="#">Contact</a>
        </li>
        <li>
            <a href="#">Logout</a>
        </li>
    </ul>
</nav>
