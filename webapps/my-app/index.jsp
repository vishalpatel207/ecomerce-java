<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopEasy - Your Online Shopping Destination</title>
    <link rel="stylesheet" href="css/style.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Critical CSS for immediate loading */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
            padding: 8px 12px;
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
        
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            color: #4a5568;
            font-size: 1.5rem;
            cursor: pointer;
            padding: 5px;
        }
        
        .mobile-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-top: 1px solid #e2e8f0;
        }
        
        .mobile-menu.active {
            display: block;
        }
        
        .mobile-menu .nav-link {
            display: block;
            padding: 15px 20px;
            border-bottom: 1px solid #f1f5f9;
        }
        
        .mobile-menu .nav-link:last-child {
            border-bottom: none;
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
            padding: 100px 0;
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
            height: 250px;
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
            background: #2d3748;
            color: white;
            padding: 60px 0 20px;
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
            color: #a0aec0;
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
        
        @media (max-width: 768px) {
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
                font-size: 2.5rem;
            }
            
            .slide-content p {
                font-size: 1.1rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .categories-grid,
            .products-grid {
                grid-template-columns: 1fr;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
                text-align: center;
            }
            
            .social-links {
                justify-content: center;
            }
            
            .success-message {
                top: 100px;
                left: 20px;
                right: 20px;
                transform: none;
                max-width: none;
            }
        }
        
        @media (max-width: 480px) {
            .container {
                padding: 0 15px;
            }
            
            .nav-container {
                padding: 10px 15px;
            }
            
            .slide-content h1 {
                font-size: 2rem;
            }
            
            .success-message {
                top: 80px;
                left: 10px;
                right: 10px;
                padding: 12px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%
        String message = request.getParameter("message");
        String username = (String) session.getAttribute("username");
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        if (isLoggedIn == null) isLoggedIn = false;
    %>
    
    <% if (message != null) { %>
    <div class="success-message">
        <i class="fas fa-check-circle"></i> <%= message %>
        <button onclick="this.parentElement.style.display='none'" class="close-btn">&times;</button>
    </div>
    <% } %>

    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <i class="fas fa-shopping-bag"></i>
                <span>ShopEasy</span>
            </div>
            
            <div class="nav-search">
                <input type="text" placeholder="Search products..." class="search-input">
                <button class="search-btn"><i class="fas fa-search"></i></button>
            </div>
            
            <div class="nav-links">
                <a href="index.jsp" class="nav-link active">Home</a>
                <a href="#products" class="nav-link">Products</a>
                <a href="#categories" class="nav-link">Categories</a>
                <a href="#about" class="nav-link">About</a>
                <a href="#contact" class="nav-link">Contact</a>
            </div>
            
            <button class="mobile-menu-btn" onclick="toggleMobileMenu()">
                <i class="fas fa-bars"></i>
            </button>
            
            <div class="mobile-menu" id="mobileMenu">
                <a href="index.jsp" class="nav-link active">Home</a>
                <a href="#products" class="nav-link">Products</a>
                <a href="#categories" class="nav-link">Categories</a>
                <a href="#about" class="nav-link">About</a>
                <a href="#contact" class="nav-link">Contact</a>
            </div>
            
            <div class="nav-actions">
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
        </div>
    </nav>
    
    <!-- Hero Slider Section -->
    <section class="hero-slider">
        <div class="slider-container">
            <div class="slide active">
                <div class="slide-content">
                    <h1>Welcome to ShopEasy</h1>
                    <p>Discover amazing products at unbeatable prices</p>
                    <a href="#products" class="btn btn-primary">Shop Now</a>
                </div>
                <div class="slide-bg" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"></div>
            </div>
            
            <div class="slide">
                <div class="slide-content">
                    <h1>New Collection</h1>
                    <p>Latest trends and fashion items</p>
                    <a href="#products" class="btn btn-primary">Explore</a>
                </div>
                <div class="slide-bg" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);"></div>
            </div>
            
            <div class="slide">
                <div class="slide-content">
                    <h1>Electronics Sale</h1>
                    <p>Up to 50% off on all electronics</p>
                    <a href="#products" class="btn btn-primary">Buy Now</a>
                </div>
                <div class="slide-bg" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);"></div>
            </div>
        </div>
        
        <div class="slider-nav">
            <button class="slider-btn prev" onclick="changeSlide(-1)"><i class="fas fa-chevron-left"></i></button>
            <button class="slider-btn next" onclick="changeSlide(1)"><i class="fas fa-chevron-right"></i></button>
        </div>
        
        <div class="slider-dots">
            <span class="dot active" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories" id="categories">
        <div class="container">
            <h2 class="section-title">Shop by Category</h2>
            <div class="categories-grid">
                <div class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-laptop"></i>
                    </div>
                    <h3>Electronics</h3>
                    <p>Latest gadgets and devices</p>
                </div>
                
                <div class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-tshirt"></i>
                    </div>
                    <h3>Fashion</h3>
                    <p>Trendy clothes and accessories</p>
                </div>
                
                <div class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <h3>Home & Garden</h3>
                    <p>Everything for your home</p>
                </div>
                
                <div class="category-card">
                    <div class="category-icon">
                        <i class="fas fa-gamepad"></i>
                    </div>
                    <h3>Sports</h3>
                    <p>Sports equipment and gear</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Section -->
    <section class="products" id="products">
        <div class="container">
            <h2 class="section-title">Featured Products</h2>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=300&fit=crop&crop=center" alt="Smartphone Pro" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>Smartphone Pro</h3>
                        <p class="product-price">₹25,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span>(4.5)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop&crop=center" alt="Gaming Laptop" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>Gaming Laptop</h3>
                        <p class="product-price">₹65,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(4.2)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop&crop=center" alt="Wireless Headphones" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>Wireless Headphones</h3>
                        <p class="product-price">₹8,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span>(4.8)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop&crop=center" alt="Smart Watch" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>Smart Watch</h3>
                        <p class="product-price">₹12,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(4.3)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=300&fit=crop&crop=center" alt="Tablet Pro" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>Tablet Pro</h3>
                        <p class="product-price">₹18,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span>(4.6)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
                
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400&h=300&fit=crop&crop=center" alt="DSLR Camera" loading="lazy">
                        <div class="product-overlay">
                            <button class="btn btn-sm">Quick View</button>
                        </div>
                    </div>
                    <div class="product-info">
                        <h3>DSLR Camera</h3>
                        <p class="product-price">₹45,999</p>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(4.4)</span>
                        </div>
                        <button class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer" id="contact">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <div class="footer-brand">
                        <i class="fas fa-shopping-bag"></i>
                        <span>ShopEasy</span>
                    </div>
                    <p>Your trusted online shopping destination for quality products at great prices.</p>
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
                        <p><i class="fas fa-map-marker-alt"></i> 123 Shopping Street, Mumbai, India</p>
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
        // Slider functionality
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

        // Auto-slide functionality
        setInterval(() => {
            changeSlide(1);
        }, 5000);

        // Smooth scrolling for navigation links
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

        // Add to cart functionality
        document.querySelectorAll('.product-card .btn-primary').forEach(button => {
            button.addEventListener('click', function() {
                const productName = this.closest('.product-card').querySelector('h3').textContent;
                alert(`${productName} added to cart!`);
            });
        });

        // Search functionality
        document.querySelector('.search-btn').addEventListener('click', function() {
            const searchTerm = document.querySelector('.search-input').value;
            if (searchTerm.trim()) {
                alert(`Searching for: ${searchTerm}`);
            }
        });

        // Enter key for search
        document.querySelector('.search-input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.querySelector('.search-btn').click();
            }
        });

        // Mobile menu functionality
        function toggleMobileMenu() {
            const mobileMenu = document.getElementById('mobileMenu');
            mobileMenu.classList.toggle('active');
        }

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            const mobileMenu = document.getElementById('mobileMenu');
            const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
            
            if (!mobileMenu.contains(e.target) && !mobileMenuBtn.contains(e.target)) {
                mobileMenu.classList.remove('active');
            }
        });

        // Close mobile menu when clicking on a link
        document.querySelectorAll('.mobile-menu .nav-link').forEach(link => {
            link.addEventListener('click', function() {
                document.getElementById('mobileMenu').classList.remove('active');
            });
        });
    </script>
</body>
</html>