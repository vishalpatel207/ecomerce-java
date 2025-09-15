<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
// Dynamic categories with images and descriptions
Map<String, Map<String, String>> categories = new HashMap<>();
Map<String, String> electronics = new HashMap<>();
electronics.put("name", "Electronics");
electronics.put("description", "Latest gadgets and devices");
electronics.put("image", "https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400&h=300&fit=crop&crop=center");
electronics.put("icon", "fas fa-laptop");

Map<String, String> fashion = new HashMap<>();
fashion.put("name", "Fashion");
fashion.put("description", "Trendy clothes and accessories");
fashion.put("image", "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop&crop=center");
fashion.put("icon", "fas fa-tshirt");

Map<String, String> home = new HashMap<>();
home.put("name", "Home & Garden");
home.put("description", "Everything for your home");
home.put("image", "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop&crop=center");
home.put("icon", "fas fa-home");

Map<String, String> sports = new HashMap<>();
sports.put("name", "Sports");
sports.put("description", "Sports equipment and gear");
sports.put("image", "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop&crop=center");
sports.put("icon", "fas fa-gamepad");

Map<String, String> books = new HashMap<>();
books.put("name", "Books");
books.put("description", "Educational and entertainment books");
books.put("image", "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop&crop=center");
books.put("icon", "fas fa-book");

Map<String, String> beauty = new HashMap<>();
beauty.put("name", "Beauty");
beauty.put("description", "Cosmetics and personal care");
beauty.put("image", "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400&h=300&fit=crop&crop=center");
beauty.put("icon", "fas fa-palette");

categories.put("Electronics", electronics);
categories.put("Fashion", fashion);
categories.put("Home", home);
categories.put("Sports", sports);
categories.put("Books", books);
categories.put("Beauty", beauty);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Categories - ShopEasy</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css?v=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }
        .nav-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #667eea;
            text-decoration: none;
        }
        .nav-brand i {
            font-size: 2rem;
        }
        .category-card {
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .category-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .category-card:hover .category-overlay {
            opacity: 1;
        }
        .category-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 50px;
            position: relative;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .container {
                max-width: 100%;
                padding: 0 15px;
            }
        }

        @media (max-width: 992px) {
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }
            
            .section-title {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 768px) {
            .section-title {
                font-size: 1.8rem;
                margin-bottom: 40px;
            }
            
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 15px;
            }
            
            .category-card {
                padding: 30px 15px;
            }
            
            .category-icon {
                width: 50px;
                height: 50px;
                font-size: 1.3rem;
            }
            
            .category-image {
                height: 150px;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding: 0 10px;
            }
            
            .section-title {
                font-size: 1.6rem;
                margin-bottom: 30px;
            }
            
            .categories-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .category-card {
                padding: 25px 15px;
            }
            
            .category-icon {
                width: 45px;
                height: 45px;
                font-size: 1.2rem;
            }
            
            .category-image {
                height: 120px;
            }
            
            .nav-brand {
                font-size: 1.5rem;
            }
            
            .nav-brand i {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .section-title {
                font-size: 1.4rem;
            }
            
            .category-card h5 {
                font-size: 1.1rem;
            }
            
            .category-card p {
                font-size: 0.9rem;
            }
            
            .btn {
                padding: 8px 16px;
                font-size: 12px;
            }
        }

        @media (max-width: 360px) {
            .container {
                padding: 0 5px;
            }
            
            .category-card {
                padding: 20px 10px;
            }
            
            .category-icon {
                width: 40px;
                height: 40px;
                font-size: 1rem;
            }
            
            .category-image {
                height: 100px;
            }
        }
    </style>
</head>
<body>
    <% String message=request.getParameter("message"); String username=(String) session.getAttribute("username"); Boolean isLoggedIn=(Boolean) session.getAttribute("isLoggedIn"); if (isLoggedIn==null) isLoggedIn=false; %>
    <!-- NAVBAR & CSS FROM HOME PAGE START -->
    <link rel="stylesheet" href="css/style.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }
        .nav-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #667eea;
            text-decoration: none;
        }
        .nav-brand i {
            font-size: 2rem;
        }
        .category-card {
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .category-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .category-card:hover .category-overlay {
            opacity: 1;
        }
        .category-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 50px;
            position: relative;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .container {
                max-width: 100%;
                padding: 0 15px;
            }
        }

        @media (max-width: 992px) {
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }
            
            .section-title {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 768px) {
            .section-title {
                font-size: 1.8rem;
                margin-bottom: 40px;
            }
            
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 15px;
            }
            
            .category-card {
                padding: 30px 15px;
            }
            
            .category-icon {
                width: 50px;
                height: 50px;
                font-size: 1.3rem;
            }
            
            .category-image {
                height: 150px;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding: 0 10px;
            }
            
            .section-title {
                font-size: 1.6rem;
                margin-bottom: 30px;
            }
            
            .categories-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .category-card {
                padding: 25px 15px;
            }
            
            .category-icon {
                width: 45px;
                height: 45px;
                font-size: 1.2rem;
            }
            
            .category-image {
                height: 120px;
            }
            
            .nav-brand {
                font-size: 1.5rem;
            }
            
            .nav-brand i {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .section-title {
                font-size: 1.4rem;
            }
            
            .category-card h5 {
                font-size: 1.1rem;
            }
            
            .category-card p {
                font-size: 0.9rem;
            }
            
            .btn {
                padding: 8px 16px;
                font-size: 12px;
            }
        }

        @media (max-width: 360px) {
            .container {
                padding: 0 5px;
            }
            
            .category-card {
                padding: 20px 10px;
            }
            
            .category-icon {
                width: 40px;
                height: 40px;
                font-size: 1rem;
            }
            
            .category-image {
                height: 100px;
            }
        }
    </style>
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
                <a href="index.jsp" class="nav-link">Home</a>
                <a href="category.jsp" class="nav-link active">Categories</a>
                <a href="product.jsp?category=Electronics" class="nav-link">Products</a>
                <a href="cart.jsp" class="nav-link">Cart</a>
                <a href="#about" class="nav-link">About</a>
                <a href="#contact" class="nav-link">Contact</a>
            </div>
            <div class="nav-actions d-none d-lg-flex">
                <a href="#" class="nav-icon" title="Wishlist"><i class="fas fa-heart"></i></a>
                <a href="#" class="nav-icon" title="Shopping Cart"><i class="fas fa-shopping-cart"></i></a>
                <% if (isLoggedIn) { %>
                    <div class="user-info">
                        <span class="welcome-text">Welcome, <%= username %>!</span>
                        <a href="logout.jsp" class="nav-icon" title="Logout"><i class="fas fa-sign-out-alt"></i></a>
                    </div>
                <% } else { %>
                    <a href="login.jsp" class="nav-icon" title="Login"><i class="fas fa-user"></i></a>
                <% } %>
            </div>
            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#navOffcanvas" aria-controls="navOffcanvas" aria-label="Open menu" style="margin-left: 38px;">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </nav>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="navOffcanvas" aria-labelledby="navOffcanvasLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="navOffcanvasLabel">ShopEasy</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body d-flex flex-column">
            <div class="mb-3">
                <div class="d-flex align-items-center p-2 rounded" style="background:#f8f9fa;">
                    <input type="text" class="form-control form-control-sm me-2" placeholder="Search products..." id="offcanvasSearchInput">
                    <button class="btn btn-primary btn-sm" id="offcanvasSearchBtn"><i class="fas fa-search"></i></button>
                </div>
            </div>
            <nav class="nav flex-column mb-3">
                <a href="index.jsp" class="nav-link">Home</a>
                <a href="category.jsp" class="nav-link active" data-bs-dismiss="offcanvas">Categories</a>
                <a href="product.jsp?category=Electronics" class="nav-link" data-bs-dismiss="offcanvas">Products</a>
                <a href="cart.jsp" class="nav-link" data-bs-dismiss="offcanvas">Cart</a>
                <a href="#about" class="nav-link" data-bs-dismiss="offcanvas">About</a>
                <a href="#contact" class="nav-link" data-bs-dismiss="offcanvas">Contact</a>
            </nav>
            <div class="mt-auto d-flex align-items-center gap-3">
                <a href="#" class="text-secondary"><i class="fas fa-heart"></i></a>
                <a href="#" class="text-secondary"><i class="fas fa-shopping-cart"></i></a>
                <% if (isLoggedIn) { %>
                    <span class="text-primary fw-semibold">Welcome, <%= username %></span>
                    <a href="logout.jsp" class="btn btn-outline-primary btn-sm" data-bs-dismiss="offcanvas">Logout</a>
                <% } else { %>
                    <a href="login.jsp" class="btn btn-outline-primary btn-sm" data-bs-dismiss="offcanvas">Login</a>
                <% } %>
            </div>
        </div>
    </div>
    <!-- NAVBAR & CSS FROM HOME PAGE END -->
    
    <div class="container mt-5">
        <h1 class="section-title">Shop by Category</h1>
        <div class="row">
            <% for(Map.Entry<String, Map<String, String>> entry : categories.entrySet()) { 
                Map<String, String> category = entry.getValue();
            %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card category-card h-100" onclick="window.location.href='product.jsp?category=<%=entry.getKey()%>'">
                        <div class="category-image" style="background-image: url('<%=category.get("image")%>')">
                            <div class="category-overlay">
                                <div class="text-center text-white">
                                    <div class="category-icon mx-auto">
                                        <i class="<%=category.get("icon")%>"></i>
                                    </div>
                                    <h4><%=category.get("name")%></h4>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=category.get("name")%></h5>
                            <p class="card-text text-muted"><%=category.get("description")%></p>
                            <a href="product.jsp?category=<%=entry.getKey()%>" class="btn btn-primary">View Products</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>