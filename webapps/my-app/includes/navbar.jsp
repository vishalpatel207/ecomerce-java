<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Check if user session variables exist, if not set defaults
    if (session.getAttribute("username") == null) {
        session.setAttribute("username", null);
    }
    if (session.getAttribute("isLoggedIn") == null) {
        session.setAttribute("isLoggedIn", false);
    }
%>

<% if (request.getParameter("message") != null) { %>
    <div class="success-message">
        <i class="fas fa-check-circle"></i>
        <%= request.getParameter("message") %>
        <button onclick="this.parentElement.style.display='none'" class="close-btn">&times;</button>
    </div>
<% } %>

<nav class="navbar">
    <div class="nav-container">
        <div class="nav-brand">
            <i class="fas fa-shopping-bag"></i>
            <span>ShopEasy</span>
        </div>

        <div class="nav-search d-none d-lg-flex">
            <input type="text" placeholder="Search products..." class="search-input">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>

        <div class="nav-links">
            <a href="index.jsp" class="nav-link <%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>">Home</a>
            <a href="category.jsp" class="nav-link <%= request.getRequestURI().contains("category.jsp") ? "active" : "" %>">Categories</a>
            <a href="product.jsp?category=Electronics" class="nav-link <%= request.getRequestURI().contains("product.jsp") ? "active" : "" %>">Products</a>
            <a href="cart.jsp" class="nav-link <%= request.getRequestURI().contains("cart.jsp") ? "active" : "" %>">Cart</a>
            <a href="about.jsp" class="nav-link <%= request.getRequestURI().contains("about.jsp") ? "active" : "" %>">About</a>
            <a href="contact.jsp" class="nav-link <%= request.getRequestURI().contains("contact.jsp") ? "active" : "" %>">Contact</a>
        </div>

        <div class="nav-actions d-none d-lg-flex">
            <a href="#" class="nav-icon" title="Wishlist"><i class="fas fa-heart"></i></a>
            <a href="cart.jsp" class="nav-icon" title="Shopping Cart"><i class="fas fa-shopping-cart"></i></a>
            <% if (session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn")) { %>
                <div class="user-info">
                    <span class="welcome-text">Welcome, <%= session.getAttribute("username") %>!</span>
                    <a href="logout.jsp" class="nav-icon" title="Logout"><i class="fas fa-sign-out-alt"></i></a>
                </div>
            <% } else { %>
                <a href="login.jsp" class="nav-icon" title="Login"><i class="fas fa-user"></i></a>
            <% } %>
        </div>

        <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas"
            data-bs-target="#navOffcanvas" aria-controls="navOffcanvas" aria-label="Open menu"
            style="margin-left: 38px;">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>

<!-- Mobile Navigation Offcanvas -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="navOffcanvas" aria-labelledby="navOffcanvasLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="navOffcanvasLabel">ShopEasy</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body d-flex flex-column">
        <div class="mb-3">
            <div class="d-flex align-items-center p-2 rounded" style="background:#f8f9fa;">
                <input type="text" class="form-control form-control-sm me-2"
                    placeholder="Search products..." id="offcanvasSearchInput">
                <button class="btn btn-primary btn-sm" id="offcanvasSearchBtn"><i class="fas fa-search"></i></button>
            </div>
        </div>
        <nav class="nav flex-column mb-3">
            <a href="index.jsp" class="nav-link <%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">Home</a>
            <a href="category.jsp" class="nav-link <%= request.getRequestURI().contains("category.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">Categories</a>
            <a href="product.jsp?category=Electronics" class="nav-link <%= request.getRequestURI().contains("product.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">Products</a>
            <a href="cart.jsp" class="nav-link <%= request.getRequestURI().contains("cart.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">Cart</a>
            <a href="about.jsp" class="nav-link <%= request.getRequestURI().contains("about.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">About</a>
            <a href="contact.jsp" class="nav-link <%= request.getRequestURI().contains("contact.jsp") ? "active" : "" %>" data-bs-dismiss="offcanvas">Contact</a>
        </nav>
        <div class="mt-auto d-flex align-items-center gap-3">
            <a href="#" class="text-secondary"><i class="fas fa-heart"></i></a>
            <a href="cart.jsp" class="text-secondary"><i class="fas fa-shopping-cart"></i></a>
            <% if (session.getAttribute("isLoggedIn") != null && (Boolean) session.getAttribute("isLoggedIn")) { %>
                <span class="text-primary fw-semibold">Welcome, <%= session.getAttribute("username") %></span>
                <a href="logout.jsp" class="btn btn-outline-primary btn-sm" data-bs-dismiss="offcanvas">Logout</a>
            <% } else { %>
                <a href="login.jsp" class="btn btn-primary btn-sm" data-bs-dismiss="offcanvas">Login</a>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>