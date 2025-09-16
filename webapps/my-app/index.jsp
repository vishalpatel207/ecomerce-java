<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ShopEasy - Your Online Shopping Destination</title>
        <link rel="stylesheet" href="css/style.css?v=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .offcanvas {
                max-width: 85% !important;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                color: #333;
                background-color: #f8f9fa;
            }

            .navbar {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
                right: 0 !important;
                z-index: 1000 !important;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
                box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            }

            .nav-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 70px;
            }

            .nav-brand {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 1.8rem;
                font-weight: 700;
                color: #667eea;
                text-decoration: none;
            }

            .nav-brand i {
                font-size: 2rem;
            }

            .nav-search {
                display: flex;
                align-items: center;
                background: #f8f9fa;
                border-radius: 25px;
                padding: 8px 15px;
                flex: 1;
                max-width: 400px;
                margin: 0 20px;
            }

            .search-input {
                border: none;
                background: transparent;
                outline: none;
                flex: 1;
                padding: 5px 10px;
                font-size: 14px;
            }

            .search-btn {
                background: #667eea;
                border: none;
                color: white;
                padding: 5px 11px;
                border-radius: 50%;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .nav-links {
                display: flex;
                gap: 30px;
            }

            .nav-link {
                color: #4a5568;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s ease;
                position: relative;
            }

            .nav-link:hover,
            .nav-link.active {
                color: #667eea;
            }

            .nav-actions {
                display: flex;
                gap: 20px;
                padding-left: 20px;
            }

            .nav-icon {
                color: #4a5568;
                font-size: 1.2rem;
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .nav-icon:hover {
                color: #667eea;
                transform: scale(1.1);
            }

            .user-info {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .welcome-text {
                color: #667eea;
                font-weight: 600;
                font-size: 14px;
                background: rgba(102, 126, 234, 0.1);
                padding: 5px 12px;
                border-radius: 15px;
                white-space: nowrap;
            }

            .navbar .btn.d-lg-none {
                border: 1px solid #e2e8f0;
            }

            .hero-slider {
                position: relative;
                height: 100vh;
                overflow: hidden;
                margin-top: 70px !important;
            }

            .slider-container {
                position: relative;
                height: 100%;
            }

            .slide {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
                transition: opacity 0.5s ease-in-out;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .slide.active {
                opacity: 1;
            }

            .slide-bg {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -1;
            }

            .slide-content {
                text-align: center;
                color: white;
                z-index: 2;
                max-width: 600px;
                padding: 0 20px;
            }

            .slide-content h1 {
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 20px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            }

            .slide-content p {
                font-size: 1.3rem;
                margin-bottom: 30px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            }

            .btn {
                display: inline-block;
                padding: 12px 30px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                text-decoration: none;
                border: none;
                border-radius: 25px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 14px;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .section-title {
                                margin-top: 50px;

                text-align: center;
                font-size: 2.5rem;
                font-weight: 700;
                color: #2d3748;
                margin-bottom: 50px;
                position:relative;

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

            .categories {
                padding: 100px 0;
                background: white;
            }   

            .categories-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 30px;
            }

            .category-card {
                text-align: center;
                padding: 40px 20px;
                border-radius: 15px;
                background: #f8f9fa;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .category-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                background: white;
            }

            .category-icon {
                width: 80px;
                height: 80px;
                margin: 0 auto 20px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
               display: flex;
               align-items: center;
               justify-content: center;
                color: white;
                font-size: 2rem;
            }

            .category-card h3 {
                font-size: 1.5rem;
                font-weight: 600;
                color: #2d3748;
                margin-bottom: 10px;
            }

            .category-card p {
                color: #718096;
                font-size: 1rem;
            }

            .products {
                padding: 0 0;
                background: #f8f9fa;
            }

            .products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 30px;
            }

            .product-card {
                background: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .product-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            }

            .product-image {
                position: relative;
                overflow: hidden;
            }

            .product-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .product-card:hover .product-image img {
                transform: scale(1.1);
            }

            .product-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.7);
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .product-card:hover .product-overlay {
                opacity: 1;
            }

            .product-info {
                padding: 25px;
            }

            .product-info h3 {
                font-size: 1.3rem;
                font-weight: 600;
                color: #2d3748;
                margin-bottom: 10px;
            }

            .product-price {
                font-size: 1.5rem;
                font-weight: 700;
                color: #667eea;
                margin-bottom: 15px;
            }

            .product-rating {
                display: flex;
                align-items: center;
                gap: 5px;
                margin-bottom: 20px;
            }

            .product-rating i {
                color: #fbbf24;
                font-size: 14px;
            }

            .product-rating span {
                color: #718096;
                font-size: 14px;
                margin-left: 5px;
            }

            .footer {
                margin-top: 20px;
                background: #2d3748;
                color: white;
                padding: 60px 0 20px;
            }

            ol,
            ul {
                padding-left: 0 !important;
            }

            .footer-content {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 40px;
                margin-bottom: 40px;
            }

            .footer-brand {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 1.5rem;
                font-weight: 700;
                color: #667eea;
                margin-bottom: 20px;
            }

            .footer-brand i {
                font-size: 1.8rem;
            }

            .footer-section p {
                color: #a0aec0;
                line-height: 1.6;
                margin-bottom: 20px;
            }

            .footer-section h3 {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 20px;
                color: white;
            }

            .footer-section ul {
                list-style: none;
            }

            .footer-section ul li {
                margin-bottom: 10px;
            }

            .footer-section ul li a {
                color: white;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .footer-section ul li a:hover {
                color: #667eea;
            }

            .social-links {
                display: flex;
                gap: 15px;
            }

            .social-links a {
                width: 40px;
                height: 40px;
                background: #4a5568;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .social-links a:hover {
                background: #667eea;
                transform: translateY(-3px);
            }

            .contact-info p {
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
                color: #a0aec0;
            }

            .contact-info i {
                color: #667eea;
                width: 20px;
            }

            .footer-bottom {
                border-top: 1px solid #4a5568;
                padding-top: 20px;
                text-align: center;
                color: #a0aec0;
            }

            .success-message {
                position: fixed;
                top: 80px;
                left: 50%;
                transform: translateX(-50%);
                background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
                color: white;
                padding: 15px 25px;
                border-radius: 8px;
                box-shadow: 0 10px 25px rgba(72, 187, 120, 0.3);
                z-index: 1001;
                display: flex;
                align-items: center;
                gap: 10px;
                animation: slideDown 0.3s ease-out;
                max-width: 90%;
            }

            .success-message .close-btn {
                background: none;
                border: none;
                color: white;
                font-size: 20px;
                cursor: pointer;
                padding: 0;
                margin-left: 10px;
                opacity: 0.8;
                transition: opacity 0.3s ease;
            }

            .success-message .close-btn:hover {
                opacity: 1;
            }

            @keyframes slideDown {
                from {
                    opacity: 0;
                    transform: translateX(-50%) translateY(-20px);
                }

                to {
                    opacity: 1;
                    transform: translateX(-50%) translateY(0);
                }
            }

            /* Mobile First Responsive Design */
            @media (max-width: 1200px) {
                .container {
                    max-width: 100%;
                    padding: 0 15px;
                }
                
                .categories-grid,
                .products-grid {
                    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                    gap: 20px;
                }
            }

            @media (max-width: 992px) {
                .nav-links {
                    display: none !important;
                }

                .mobile-menu-btn {
                    display: block !important;
                }

                .nav-container {
                    flex-wrap: wrap;
                    height: auto;
                    padding: 15px 20px;
                    position: relative;
                }

                .nav-search {
                    order: 3;
                    width: 100%;
                    margin: 15px 0 0 0;
                    max-width: none;
                }

                .nav-actions {
                    gap: 10px;
                }

                .welcome-text {
                    display: none;
                }

                .slide-content h1 {
                    font-size: 2.8rem;
                }

                .slide-content p {
                    font-size: 1.2rem;
                }

                .section-title {
                    font-size: 2.2rem;
                }

                .categories-grid,
                .products-grid {
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 20px;
                }

                .footer-content {
                    grid-template-columns: repeat(2, 1fr);
                    gap: 30px;
                }

            
                .success-message {
                    top: 100px;
                    left: 20px;
                    right: 20px;
                    transform: none;
                    max-width: none;
                }
            }

            @media (max-width: 768px) {
                .nav-container {
                    padding: 10px 15px;
                }

                .slide-content h1 {
                    font-size: 2.2rem;
                }

                .slide-content p {
                    font-size: 1.1rem;
                }

                .section-title {
                    font-size: 1.8rem;
                }

                .categories-grid,
                .products-grid {
                    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                    gap: 15px;
                }

                .category-card,
                .product-card {
                    padding: 20px 15px;
                }

                .category-icon {
                    width: 60px;
                    height: 60px;
                    font-size: 1.5rem;
                }

                .product-image {
                    height: 200px;
                }

                .footer-content {
                    grid-template-columns: 1fr;
                    text-align: center;
                    gap: 25px;
                }

                .success-message {
                    top: 90px;
                    left: 15px;
                    right: 15px;
                    padding: 12px 20px;
                    font-size: 14px;
                }

                .hero-slider {
                    height: 70vh;
                }
            }

            @media (max-width: 576px) {
                .container {
                    padding: 0 10px;
                }

                .nav-container {
                    padding: 8px 10px;
                }

                .nav-brand {
                    font-size: 1.5rem;
                }

                .nav-brand i {
                    font-size: 1.5rem;
                }

                .slide-content h1 {
                    font-size: 1.8rem;
                    margin-bottom: 15px;
                }

                .slide-content p {
                    font-size: 1rem;
                    margin-bottom: 20px;
                }

                .section-title {
                    font-size: 1.6rem;
                    margin-bottom: 30px;
                }

                .categories-grid,
                .products-grid {
                    grid-template-columns: 1fr;
                    gap: 15px;
                }

                .category-card,
                .product-card {
                    padding: 15px 10px;
                }

                .category-icon {
                    width: 50px;
                    height: 50px;
                    font-size: 1.2rem;
                }

                .product-image {
                    height: 180px;
                }

                .product-info h3 {
                    font-size: 1.1rem;
                }

                .product-price {
                    font-size: 1.3rem;
                }

                .btn {
                    padding: 10px 20px;
                    font-size: 13px;
                }

                .hero-slider {
                    height: 60vh;
                }

                .success-message {
                    top: 80px;
                    left: 10px;
                    right: 10px;
                    padding: 10px 15px;
                    font-size: 13px;
                }

                .footer {
                    padding: 40px 0 15px;
                }

                .footer-content {
                    gap: 20px;
                }
            }

            @media (max-width: 480px) {
                .slide-content h1 {
                    font-size: 1.5rem;
                }

                .slide-content p {
                    font-size: 0.9rem;
                }

                .section-title {
                    font-size: 1.4rem;
                }

                .category-card h3,
                .product-info h3 {
                    font-size: 1rem;
                }

                .product-price {
                    font-size: 1.2rem;
                }

                .btn {
                    padding: 8px 16px;
                    font-size: 12px;
                }

                .hero-slider {
                    height: 50vh;
                }
            }

            /* Extra small devices */
            @media (max-width: 360px) {
                .container {
                    padding: 0 5px;
                }

                .nav-container {
                    padding: 5px 8px;
                }

                .slide-content h1 {
                    font-size: 1.3rem;
                }

                .slide-content p {
                    font-size: 0.8rem;
                }

                .section-title {
                    font-size: 1.2rem;
                }

                .category-card,
                .product-card {
                    padding: 12px 8px;
                }

                .btn {
                    padding: 6px 12px;
                    font-size: 11px;
                }
            }
        </style>
    </head>

    <body>
        <% String message=request.getParameter("message"); String username=(String) session.getAttribute("username");
            Boolean isLoggedIn=(Boolean) session.getAttribute("isLoggedIn"); if (isLoggedIn==null) isLoggedIn=false; %>

            <% if (message !=null) { %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i>
                    <%= message %>
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
                                <a href="index.jsp" class="nav-link active">Home</a>
                                <a href="category.jsp" class="nav-link">Categories</a>
                                <a href="product.jsp?category=Electronics" class="nav-link">Products</a>
                                <a href="cart.jsp" class="nav-link">Cart</a>
                                <a href="about.jsp" class="nav-link">About</a>
                                <a href="contact.jsp" class="nav-link">Contact</a>
                            </div>

                            <div class="nav-actions d-none d-lg-flex">
                                <a href="#" class="nav-icon" title="Wishlist"><i class="fas fa-heart"></i></a>
                                <a href="cart.jsp" class="nav-icon" title="Shopping Cart"><i
                                        class="fas fa-shopping-cart"></i></a>
                                <% if (isLoggedIn) { %>
                                    <div class="user-info">
                                        <span class="welcome-text">Welcome, <%= username %>!</span>
                                        <a href="logout.jsp" class="nav-icon" title="Logout"><i
                                                class="fas fa-sign-out-alt"></i></a>
                                    </div>
                                    <% } else { %>
                                        <a href="login.jsp" class="nav-icon" title="Login"><i
                                                class="fas fa-user"></i></a>
                                        <% } %>
                            </div>

                            <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#navOffcanvas" aria-controls="navOffcanvas" aria-label="Open menu"
                                style="margin-left: 38px;">
                                <i class="fas fa-bars"></i>
                            </button>
                        </div>
                    </nav>

                    <div class="offcanvas offcanvas-end" tabindex="-1" id="navOffcanvas"
                        aria-labelledby="navOffcanvasLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="navOffcanvasLabel">ShopEasy</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body d-flex flex-column">
                            <div class="mb-3">
                                <div class="d-flex align-items-center p-2 rounded" style="background:#f8f9fa;">
                                    <input type="text" class="form-control form-control-sm me-2"
                                        placeholder="Search products..." id="offcanvasSearchInput">
                                    <button class="btn btn-primary btn-sm" id="offcanvasSearchBtn"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </div>
                            <nav class="nav flex-column mb-3">
                                <a href="index.jsp" class="nav-link">Home</a>
                                <a href="category.jsp" class="nav-link" data-bs-dismiss="offcanvas">Categories</a>
                                <a href="product.jsp?category=Electronics" class="nav-link" data-bs-dismiss="offcanvas">Products</a>
                                <a href="cart.jsp" class="nav-link" data-bs-dismiss="offcanvas">Cart</a>
                                <a href="about.jsp" class="nav-link" data-bs-dismiss="offcanvas">About</a>
                                <a href="contact.jsp" class="nav-link" data-bs-dismiss="offcanvas">Contact</a>
                            </nav>
                            <div class="mt-auto d-flex align-items-center gap-3">
                                <a href="#" class="text-secondary"><i class="fas fa-heart"></i></a>
                                <a href="#" class="text-secondary"><i class="fas fa-shopping-cart"></i></a>
                                <% if (isLoggedIn) { %>
                                    <span class="text-primary fw-semibold">Welcome, <%= username %></span>
                                    <a href="logout.jsp" class="btn btn-outline-primary btn-sm"
                                        data-bs-dismiss="offcanvas">Logout</a>
                                    <% } else { %>
                                        <a href="login.jsp" class="btn btn-primary btn-sm"
                                            data-bs-dismiss="offcanvas">Login</a>
                                        <% } %>
                            </div>
                        </div>
                    </div>

                    <section class="hero-slider">
                        <div class="slider-container">
                            <div class="slide active">
                                <div class="slide-content">
                                    <h1>Welcome to ShopEasy</h1>
                                    <p>Discover amazing products at unbeatable prices</p>
                                    <a href="#products" class="btn btn-primary">Shop Now</a>
                                </div>
                                <div class="slide-bg"
                                    style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"></div>
                            </div>

                            <div class="slide">
                                <div class="slide-content">
                                    <h1>New Collection</h1>
                                    <p>Latest trends and fashion items</p>
                                    <a href="#products" class="btn btn-primary">Explore</a>
                                </div>
                                <div class="slide-bg"
                                    style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);"></div>
                            </div>


                            <div class="slide">
                                <div class="slide-content">
                                    <h1>Electronics Sale</h1>
                                    <p>Up to 50% off on all electronics</p>
                                    <a href="#products" class="btn btn-primary">Buy Now</a>
                                </div>
                                <div class="slide-bg"
                                    style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);"></div>
                            </div>
                        </div>

                        <div class="slider-nav">
                            <button class="slider-btn prev" onclick="changeSlide(-1)"><i
                                    class="fas fa-chevron-left"></i></button>
                            <button class="slider-btn next" onclick="changeSlide(1)"><i
                                    class="fas fa-chevron-right"></i></button>
                        </div>

                        <div class="slider-dots">
                            <span class="dot active" onclick="currentSlide(1)"></span>
                            <span class="dot" onclick="currentSlide(2)"></span>
                            <span class="dot" onclick="currentSlide(3)"></span>
                        </div>
                    </section>

                    <!-- Ecommerce Section Start -->
                    <% String[]
                        ecommerceImages={ "https://images.unsplash.com/photo-1515168833906-d2a3b82b1a48?w=600&h=400&fit=crop&crop=center"
                        , "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=600&h=400&fit=crop&crop=center"
                        , "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?w=600&h=400&fit=crop&crop=center"
                        , "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600&h=400&fit=crop&crop=center"
                        }; int imgIdx=(int)(Math.random() * ecommerceImages.length); %>
                        <section class="ecommerce-section"
                            style="padding: 80px 0; background: linear-gradient(135deg, #f8fafc 0%, #e9e4f0 100%);">
                            <div class="container">
                                <div class="row align-items-center flex-column-reverse flex-md-row">
                                    <div class="col-12 col-md-6 mt-4 mt-md-0 d-flex ">
                                        <img src="<%= ecommerceImages[imgIdx] %>" alt="Ecommerce"
                                            class="img-fluid rounded shadow w-100"
                                            style="max-width:420px; max-height:500px; object-fit:cover;">
                                    </div>
                                    <div
                                        class="col-12 col-md-6 d-flex flex-column justify-content-center align-items-start">
                                        <h2
                                            style="font-size:2.3rem; font-weight:700; color:#667eea; margin-bottom:20px;">
                                            Why Shop with ShopEasy?</h2>
                                        <ul style="list-style:none; padding:0; margin-bottom:25px;">
                                            <li style="margin-bottom:15px; font-size:1.1rem;"><i
                                                    class="fas fa-check-circle text-success me-2"></i>Wide range of
                                                products & categories</li>
                                            <li style="margin-bottom:15px; font-size:1.1rem;"><i
                                                    class="fas fa-check-circle text-success me-2"></i>Secure payments &
                                                fast delivery</li>
                                            <li style="margin-bottom:15px; font-size:1.1rem;"><i
                                                    class="fas fa-check-circle text-success me-2"></i>Easy returns &
                                                24/7 support</li>
                                            <li style="margin-bottom:15px; font-size:1.1rem;"><i
                                                    class="fas fa-check-circle text-success me-2"></i>Exclusive deals &
                                                offers</li>
                                        </ul>
                                        <a href="#products" class="btn btn-primary"
                                            style="font-size:1.1rem; padding:12px 32px;">Start Shopping</a>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Ecommerce Section End -->

                        <section class="categories" id="categories">
                            <div class="container">
                                <h2 class="section-title">Shop by Category</h2>
                                <div class="categories-grid">
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

                                    for(Map.Entry<String, Map<String, String>> entry : categories.entrySet()) { 
                                        Map<String, String> category = entry.getValue();
                                    %>
                                        <div class="category-card" onclick="window.location.href='product.jsp?category=<%=entry.getKey()%>'">
                                            <div class="category-icon">
                                                <i class="<%=category.get("icon")%>"></i>
                                            </div>
                                            <h3><%=category.get("name")%></h3>
                                            <p><%=category.get("description")%></p>
                                        </div>
                                    <% } %>
                                </div>
                            </div>
                        </section>

                        <section class="products" id="products">
                            <div class="container">
                                <h2 class="section-title">Featured Products</h2>
                                <div class="products-grid">
                                    <%
                                    // Dynamic featured products
                                    List<Map<String, String>> featuredProducts = new ArrayList<>();
                                    
                                    Map<String, String> phone = new HashMap<>();
                                    phone.put("name", "Smartphone Pro");
                                    phone.put("price", "₹25,999");
                                    phone.put("image", "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=300&fit=crop&crop=center");
                                    phone.put("description", "Latest Smartphone Pro with advanced features and 5G connectivity");
                                    phone.put("rating", "4.5");
                                    phone.put("id", "phone1");
                                    featuredProducts.add(phone);

                                    Map<String, String> laptop = new HashMap<>();
                                    laptop.put("name", "Gaming Laptop");
                                    laptop.put("price", "₹65,999");
                                    laptop.put("image", "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop&crop=center");
                                    laptop.put("description", "High performance gaming laptop for pro gamers");
                                    laptop.put("rating", "4.2");
                                    laptop.put("id", "laptop1");
                                    featuredProducts.add(laptop);

                                    Map<String, String> headphones = new HashMap<>();
                                    headphones.put("name", "Wireless Headphones");
                                    headphones.put("price", "₹8,999");
                                    headphones.put("image", "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop&crop=center");
                                    headphones.put("description", "Noise-cancelling wireless headphones with premium sound");
                                    headphones.put("rating", "4.8");
                                    headphones.put("id", "headphones1");
                                    featuredProducts.add(headphones);

                                    Map<String, String> smartwatch = new HashMap<>();
                                    smartwatch.put("name", "Smart Watch");
                                    smartwatch.put("price", "₹12,999");
                                    smartwatch.put("image", "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop&crop=center");
                                    smartwatch.put("description", "Smart Watch with fitness tracking and health monitoring");
                                    smartwatch.put("rating", "4.3");
                                    smartwatch.put("id", "smartwatch1");
                                    featuredProducts.add(smartwatch);

                                    Map<String, String> tablet = new HashMap<>();
                                    tablet.put("name", "Tablet Pro");
                                    tablet.put("price", "₹18,999");
                                    tablet.put("image", "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=300&fit=crop&crop=center");
                                    tablet.put("description", "Tablet Pro with high-res display and long battery life");
                                    tablet.put("rating", "4.6");
                                    tablet.put("id", "tablet1");
                                    featuredProducts.add(tablet);

                                    Map<String, String> camera = new HashMap<>();
                                    camera.put("name", "DSLR Camera");
                                    camera.put("price", "₹45,999");
                                    camera.put("image", "https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=300&fit=crop&crop=center");
                                    camera.put("description", "Professional DSLR Camera for photography lovers");
                                    camera.put("rating", "4.4");
                                    camera.put("id", "camera1");
                                    featuredProducts.add(camera);

                                    for(Map<String, String> product : featuredProducts) { 
                                    %>
                                        <div class="product-card">
                                            <div class="product-image">
                                                <img src="<%=product.get("image")%>" alt="<%=product.get("name")%>" loading="lazy">
                                                <div class="product-overlay">
                                                    <button class="btn btn-sm btn-quick-view" data-bs-toggle="modal"
                                                        data-bs-target="#quickViewModal" data-title="<%=product.get("name")%>"
                                                        data-img="<%=product.get("image")%>"
                                                        data-price="<%=product.get("price")%>" data-rating="<%=product.get("rating")%>"
                                                        data-desc="<%=product.get("description")%>">
                                                        Quick View
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <h3><%=product.get("name")%></h3>
                                                <p class="product-price"><%=product.get("price")%></p>
                                                <div class="product-rating">
                                                    <% 
                                                    double rating = Double.parseDouble(product.get("rating"));
                                                    for(int i = 1; i <= 5; i++) {
                                                        if(i <= rating) {
                                                    %>
                                                        <i class="fas fa-star"></i>
                                                    <% } else if(i - 0.5 <= rating) { %>
                                                        <i class="fas fa-star-half-alt"></i>
                                                    <% } else { %>
                                                        <i class="far fa-star"></i>
                                                    <% } } %>
                                                    <span>(<%=product.get("rating")%>)</span>
                                                </div>
                                                <form action="cart.jsp" method="post">
                                                    <input type="hidden" name="productId" value="<%=product.get("id")%>" />
                                                    <input type="hidden" name="productName" value="<%=product.get("name")%>" />
                                                    <input type="hidden" name="productPrice" value="<%=product.get("price")%>" />
                                                    <input type="hidden" name="productImage" value="<%=product.get("image")%>" />
                                                    <button type="submit" class="btn btn-primary">Add to Cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    <% } %>
                                </div>
                            </div>
                        </section>

                        <footer class="footer" id="contact">
                            <div class="container">
                                <div class="footer-content">
                                    <div class="footer-section">
                                        <div class="footer-brand">
                                            <i class="fas fa-shopping-bag"></i>
                                            <span>ShopEasy</span>
                                        </div>
                                        <p>Your trusted online shopping destination for quality products at great
                                            prices.
                                        </p>
                                        <div class="social-links">
                                            <a href="#"><i class="fab fa-facebook"></i></a>
                                            <a href="#"><i class="fab fa-twitter"></i></a>
                                            <a href="#"><i class="fab fa-instagram"></i></a>
                                            <a href="#"><i class="fab fa-linkedin"></i></a>
                                        </div>
                                    </div>

                                    <div class="footer-section">
                                        <h3>Quick Links</h3>
                                        <ul>
                                            <li><a href="index.jsp">Home</a></li>
                                            <li><a href="#products">Products</a></li>
                                            <li><a href="#categories">Categories</a></li>
                                            <li><a href="#about">About Us</a></li>
                                        </ul>
                                    </div>

                                    <div class="footer-section">
                                        <h3>Customer Service</h3>
                                        <ul>
                                            <li><a href="#">Help Center</a></li>
                                            <li><a href="#">Shipping Info</a></li>
                                            <li><a href="#">Returns</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                        </ul>
                                    </div>

                                    <div class="footer-section">
                                        <h3>Contact Info</h3>
                                        <div class="contact-info">
                                            <p><i class="fas fa-map-marker-alt"></i> 123 Shopping Street, Mumbai, India
                                            </p>
                                            <p><i class="fas fa-phone"></i> +91 98765 43210</p>
                                            <p><i class="fas fa-envelope"></i> info@shopeasy.com</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="footer-bottom">
                                    <p>&copy; 2024 ShopEasy. All rights reserved.</p>
                                </div>
                            </div>
                        </footer>

                        <script>

                            let currentSlideIndex = 0;
                            const slides = document.querySelectorAll('.slide');
                            const dots = document.querySelectorAll('.dot');
                            const totalSlides = slides.length;

                            function showSlide(index) {
                                slides.forEach(slide => slide.classList.remove('active'));
                                dots.forEach(dot => dot.classList.remove('active'));

                                slides[index].classList.add('active');
                                dots[index].classList.add('active');
                            }

                            function changeSlide(direction) {
                                currentSlideIndex += direction;

                                if (currentSlideIndex >= totalSlides) {
                                    currentSlideIndex = 0;
                                } else if (currentSlideIndex < 0) {
                                    currentSlideIndex = totalSlides - 1;
                                }

                                showSlide(currentSlideIndex);
                            }

                            function currentSlide(index) {
                                currentSlideIndex = index - 1;
                                showSlide(currentSlideIndex);
                            }

                            setInterval(() => {
                                changeSlide(1);
                            }, 5000);

                            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                                anchor.addEventListener('click', function (e) {
                                    e.preventDefault();
                                    const target = document.querySelector(this.getAttribute('href'));
                                    if (target) {
                                        target.scrollIntoView({
                                            behavior: 'smooth',
                                            block: 'start'
                                        });
                                    }
                                });
                            });

                            document.querySelectorAll('.product-card .btn-primary').forEach(button => {
                                button.addEventListener('click', function () {
                                    const productName = this.closest('.product-card').querySelector('h3').textContent;
                                    alert(`${productName} added to cart!`);
                                });
                            });

                            document.querySelector('.search-btn').addEventListener('click', function () {
                                const searchTerm = document.querySelector('.search-input').value;
                                if (searchTerm.trim()) {
                                    alert(`Searching for: ${searchTerm}`);
                                }
                            });

                            document.querySelector('.search-input').addEventListener('keypress', function (e) {
                                if (e.key === 'Enter') {
                                    document.querySelector('.search-btn').click();
                                }
                            });

                            // Offcanvas is handled by Bootstrap; no custom JS needed
                        </script>

                        <!-- Quick View Modal -->
                        <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="quickViewModalLabel">Product Name</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row g-3">
                                            <div class="col-12 col-lg-6">
                                                <img id="quickViewImg" src="" class="w-100 rounded" alt="Product Image">
                                            </div>
                                            <div class="col-12 col-lg-6">
                                                <p id="quickViewDesc" class="mb-3">Product description here.</p>
                                                <p class="mb-1"><strong>Price:</strong> <span
                                                        id="quickViewPrice"></span>
                                                </p>
                                                <p class="mb-3"><strong>Rating:</strong> <span
                                                        id="quickViewRating"></span>
                                                </p>
                                                <button type="button" class="btn btn-success ">Add to Cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                        <script>
                            document.querySelectorAll('.btn-quick-view').forEach(function (btn) {
                                btn.addEventListener('click', function () {
                                    document.getElementById('quickViewModalLabel').textContent = this.getAttribute('data-title') || '';
                                    document.getElementById('quickViewImg').src = this.getAttribute('data-img') || '';
                                    document.getElementById('quickViewDesc').textContent = this.getAttribute('data-desc') || '';
                                    document.getElementById('quickViewPrice').textContent = this.getAttribute('data-price') || '';
                                    document.getElementById('quickViewRating').textContent = this.getAttribute('data-rating') || '';
                                });
                            });

                            // Keep offcanvas hidden by default and hide on large screens
                            document.addEventListener('DOMContentLoaded', function () {
                                var offcanvasEl = document.getElementById('navOffcanvas');
                                if (offcanvasEl && offcanvasEl.classList.contains('show')) {
                                    var off = bootstrap.Offcanvas.getOrCreateInstance(offcanvasEl);
                                    off.hide();
                                }
                            });
                            window.addEventListener('resize', function () {
                                var offcanvasEl = document.getElementById('navOffcanvas');
                                if (window.innerWidth >= 992 && offcanvasEl) {
                                    var off = bootstrap.Offcanvas.getOrCreateInstance(offcanvasEl);
                                    off.hide();
                                }
                            });

                            // Offcanvas search: reuse same alert flow as top search
                            var offBtn = document.getElementById('offcanvasSearchBtn');
                            var offInput = document.getElementById('offcanvasSearchInput');
                            if (offBtn && offInput) {
                                offBtn.addEventListener('click', function () {
                                    var term = offInput.value || '';
                                    if (term.trim()) {
                                        alert(`Searching for: ${term}`);
                                    }
                                });
                                offInput.addEventListener('keypress', function (e) {
                                    if (e.key === 'Enter') {
                                        offBtn.click();
                                    }
                                });
                            }
                        </script>
    </body>

    </html>