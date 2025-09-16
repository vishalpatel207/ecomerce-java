<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
if (cart == null) {
    cart = new ArrayList<>();
}

// Handle adding products to cart
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String productImage = request.getParameter("productImage");
    
    if (productId != null && productName != null && productPrice != null && productImage != null) {
        // Check if product already exists in cart
        boolean found = false;
        for (Map<String, String> item : cart) {
            if (item.get("id").equals(productId)) {
                int quantity = Integer.parseInt(item.get("quantity"));
                item.put("quantity", String.valueOf(quantity + 1));
                found = true;
                break;
            }
        }
        
        if (!found) {
            Map<String, String> newItem = new HashMap<>();
            newItem.put("id", productId);
            newItem.put("name", productName);
            newItem.put("price", productPrice);
            newItem.put("image", productImage);
            newItem.put("quantity", "1");
            cart.add(newItem);
        }
        session.setAttribute("cart", cart);
    }
}

// Handle removing products from cart
String removeId = request.getParameter("removeId");
if (removeId != null) {
    cart.removeIf(item -> item.get("id").equals(removeId));
    session.setAttribute("cart", cart);
}

// Handle updating quantities
String updateId = request.getParameter("updateId");
String newQuantity = request.getParameter("newQuantity");
if (updateId != null && newQuantity != null) {
    try {
        int qty = Integer.parseInt(newQuantity);
        if (qty <= 0) {
            cart.removeIf(item -> item.get("id").equals(updateId));
        } else {
            for (Map<String, String> item : cart) {
                if (item.get("id").equals(updateId)) {
                    item.put("quantity", String.valueOf(qty));
                    break;
                }
            }
        }
        session.setAttribute("cart", cart);
    } catch (NumberFormatException e) {
        // Invalid quantity, ignore
    }
}

// Calculate total
double total = 0;
for (Map<String, String> item : cart) {
    String priceStr = item.get("price").replace("₹", "").replace(",", "");
    double price = Double.parseDouble(priceStr);
    int quantity = Integer.parseInt(item.get("quantity"));
    total += price * quantity;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart | ShopEasy</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css?v=1.0">
    <style>
        /* --- NAVBAR CSS FROM HOME PAGE --- */
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
 .custom-top{
            margin-top: 110px;
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
}
@media (max-width: 768px) {
    .nav-container {
        padding: 10px 15px;
    }
    .nav-brand {
        font-size: 1.5rem;
    }
    .nav-brand i {
        font-size: 1.5rem;
    }
}
@media (max-width: 576px) {
    .nav-container {
        padding: 8px 10px;
    }
    .nav-brand {
        font-size: 1.2rem;
    }
    .nav-brand i {
        font-size: 1.2rem;
    }
}

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
        .cart-item {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .cart-item:hover {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        .product-image {
            width: 100px;
            object-fit: cover;
            border-radius: 10px;
            max-height: 100%;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .quantity-btn {
            width: 35px;
            height: 35px;
            border: 1px solid #dee2e6;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .quantity-btn:hover {
            background: #667eea;
            color: white;
            border-color: #667eea;
        }
        .quantity-input {
            width: 60px;
            text-align: center;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 5px;
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
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        .btn-danger {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
        }
        .btn-secondary {
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
        }
        .total-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .empty-cart {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-cart i {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
        }
         .custom-top{
            margin-top: 110px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .container {
                max-width: 100%;
                padding: 0 15px;
            }
        }

        @media (max-width: 992px) {
            .section-title {
                font-size: 2.2rem;
            }
            
            .cart-item .row {
                flex-direction: column;
                text-align: center;
            }
            
            .cart-item .col-md-2,
            .cart-item .col-md-4,
            .cart-item .col-md-3,
            .cart-item .col-md-1 {
                width: 100%;
                margin-bottom: 15px;
            }
            
            .product-image {
                width: 150px;
                /* height removed for auto aspect ratio */
                margin: 0 auto;
            }
            
            .quantity-controls {
                justify-content: center;
            }
        }

        @media (max-width: 768px) {
            .section-title {
                font-size: 1.8rem;
                margin-bottom: 40px;
            }
            
            .cart-item {
                padding: 20px 15px;
            }
            
            .product-image {
                width: 120px;
                /* height removed for auto aspect ratio */
            }
            
            .total-section {
                padding: 20px;
                margin-top: 20px;
            }
            
            .nav-brand {
                font-size: 1.5rem;
            }
            
            .nav-brand i {
                font-size: 1.5rem;
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
            
            .cart-item {
                padding: 15px 10px;
            }
            
            .product-image {
                width: 100px;
                /* height removed for auto aspect ratio */
            }
            
            .cart-item h5 {
                font-size: 1.1rem;
            }
            
            .cart-item h6 {
                font-size: 1rem;
            }
            
            .quantity-btn {
                width: 30px;
                height: 30px;
                font-size: 12px;
            }
            
            .quantity-input {
                width: 50px;
                font-size: 14px;
            }
            
            .btn {
                padding: 8px 16px;
                font-size: 13px;
            }
            
            .total-section {
                padding: 15px;
            }
            
            .empty-cart i {
                font-size: 3rem;
            }
        }

        @media (max-width: 480px) {
            .section-title {
                font-size: 1.4rem;
            }
            
            .cart-item {
                padding: 12px 8px;
            }
            
            .product-image {
                width: 80px;
                /* height removed for auto aspect ratio */
            }
            
            .cart-item h5 {
                font-size: 1rem;
            }
            
            .cart-item h6 {
                font-size: 0.9rem;
            }
            
            .quantity-btn {
                width: 25px;
                height: 25px;
                font-size: 10px;
            }
            
            .quantity-input {
                width: 40px;
                font-size: 12px;
            }
            
            .btn {
                padding: 6px 12px;
                font-size: 12px;
            }
            
            .empty-cart i {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 360px) {
            .container {
                padding: 0 5px;
            }
            
            .cart-item {
                padding: 10px 5px;
            }
            
            .product-image {
                width: 70px;
                /* height removed for auto aspect ratio */
            }
            
            .btn {
                padding: 5px 10px;
                font-size: 11px;
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
}
@media (max-width: 768px) {
    .nav-container {
        padding: 10px 15px;
    }
    .nav-brand {
        font-size: 1.5rem;
    }
    .nav-brand i {
        font-size: 1.5rem;
    }
}
@media (max-width: 576px) {
    .nav-container {
        padding: 8px 10px;
    }
    .nav-brand {
        font-size: 1.2rem;
    }
    .nav-brand i {
        font-size: 1.2rem;
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
            <a href="category.jsp" class="nav-link">Categories</a>
            <a href="product.jsp?category=Electronics" class="nav-link">Products</a>
            <a href="cart.jsp" class="nav-link active">Cart</a>
            <a href="about.jsp" class="nav-link">About</a>
            <a href="contact.jsp" class="nav-link">Contact</a>
        </div>
        <div class="nav-actions d-none d-lg-flex">
            <a href="#" class="nav-icon" title="Wishlist"><i class="fas fa-heart"></i></a>
            <a href="cart.jsp" class="nav-icon" title="Shopping Cart"><i class="fas fa-shopping-cart"></i></a>
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
            <a href="category.jsp" class="nav-link" data-bs-dismiss="offcanvas">Categories</a>
            <a href="product.jsp?category=Electronics" class="nav-link" data-bs-dismiss="offcanvas">Products</a>
            <a href="cart.jsp" class="nav-link active" data-bs-dismiss="offcanvas">Cart</a>
            <a href="about.jsp" class="nav-link" data-bs-dismiss="offcanvas">About</a>
            <a href="contact.jsp" class="nav-link" data-bs-dismiss="offcanvas">Contact</a>
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
    
    <div class="container custom-top">
        <h1 class="section-title">Your Shopping Cart</h1>
        
        <% if(cart.isEmpty()) { %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p class="text-muted">Add some products to get started!</p>
                <a href="category.jsp" class="btn btn-primary mt-3">
Start Shopping
                </a>
            </div>
        <% } else { %>
            <div class="row">
                <div class="col-lg-8">
                    <% for(Map<String, String> item : cart) { %>
                    <div class="cart-item mb-4 p-4">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <img src="<%=item.get("image")%>" alt="<%=item.get("name")%>" class="product-image">
                            </div>
                            <div class="col-md-4">
                                <h5 class="mb-1"><%=item.get("name")%></h5>
                                <p class="text-muted mb-0">Product ID: <%=item.get("id")%></p>
                            </div>
                            <div class="col-md-2">
                                <h6 class="text-black mb-0"><%=item.get("price")%></h6>
                            </div>
                            <div class="col-md-3">
                                <div class="quantity-controls">
                                    <form action="cart.jsp" method="post" class="d-inline">
                                        <input type="hidden" name="updateId" value="<%=item.get("id")%>">
                                        <input type="hidden" name="newQuantity" value="<%=Integer.parseInt(item.get("quantity")) - 1%>">
                                        <button type="submit" class="quantity-btn" <%=Integer.parseInt(item.get("quantity")) <= 1 ? "disabled" : ""%>>
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </form>
                                    <input type="number" value="<%=item.get("quantity")%>" class="quantity-input" 
                                           onchange="updateQuantity('<%=item.get("id")%>', this.value)" min="1">
                                    <form action="cart.jsp" method="post" class="d-inline">
                                        <input type="hidden" name="updateId" value="<%=item.get("id")%>">
                                        <input type="hidden" name="newQuantity" value="<%=Integer.parseInt(item.get("quantity")) + 1%>">
                                        <button type="submit" class="quantity-btn">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <form action="cart.jsp" method="post" class="d-inline">
                                    <input type="hidden" name="removeId" value="<%=item.get("id")%>">
                                    <button type="submit" class="btn  btn-sm" 
                                            onclick="return confirm('Remove this item from cart?')">
                                        <i class="fas fa-trash" style="color: white;"></i>
                                    </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                
                <div class="col-lg-4">
                    <div class="total-section">
                        <h4 class="mb-4">Order Summary</h4>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Items (<%=cart.size()%>):</span>
                            <span>₹<%=String.format("%.2f", total)%></span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Shipping:</span>
                            <span class="text-success">Free</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <h5>Total:</h5>
                            <h5 class="text-black">₹<%=String.format("%.2f", total)%></h5>
                        </div>
                        <button id="rzp-button1" class="btn btn-primary w-100 mb-3">
                            <i class="fas fa-credit-card me-2"></i>Pay with Razorpay
                        </button>
                        <%
                        int razorpayAmount = (int)(total*100);
                        String razorpayName = username != null ? username.replace("\"", "\\\"") : "";
                        out.println("<script type=\"text/javascript\">");
                        out.println("var razorpayAmount = " + razorpayAmount + "; // in paise");
                        out.println("var razorpayName = '" + razorpayName.replace("'", "\\'") + "';");
                        out.println("</script>");
                        %>
                        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
                        <script>
                        document.getElementById('rzp-button1').onclick = function(e){
                            e.preventDefault();
                            var options = {
                                key: "rzp_test_YourKeyHere", // Replace with your Razorpay Test Key
                                amount: razorpayAmount, // Amount in paise
                                currency: "INR",
                                name: "ShopEasy",
                                description: "Order Payment",
                                image: "https://cdn-icons-png.flaticon.com/512/1170/1170678.png",
                                handler: function (response){
                                    // On payment success, redirect or show message
                                    window.location.href = 'thankyou.jsp?payment_id=' + response.razorpay_payment_id;
                                },
                                prefill: {
                                    name: razorpayName,
                                    email: "",
                                    contact: ""
                                },
                                theme: {
                                    color: "#667eea"
                                }
                            };
                            var rzp1 = new Razorpay(options);
                            rzp1.open();
                        }
                        </script>
                        <a href="category.jsp" class="btn btn-primary w-100">
                            <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                        </a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function updateQuantity(productId, newQuantity) {
            if (newQuantity < 1) {
                if (confirm('Remove this item from cart?')) {
                    document.querySelector(`form input[name="removeId"][value="${productId}"]`).closest('form').submit();
                } else {
                    location.reload();
                }
            } else {
                const form = document.createElement('form');
                form.method = 'post';
                form.action = 'cart.jsp';
                
                const updateIdInput = document.createElement('input');
                updateIdInput.type = 'hidden';
                updateIdInput.name = 'updateId';
                updateIdInput.value = productId;
                
                const newQuantityInput = document.createElement('input');
                newQuantityInput.type = 'hidden';
                newQuantityInput.name = 'newQuantity';
                newQuantityInput.value = newQuantity;
                
                form.appendChild(updateIdInput);
                form.appendChild(newQuantityInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>
