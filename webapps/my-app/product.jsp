<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String category = request.getParameter("category");
if (category == null) category = "Electronics";

// Dynamic products with detailed information
Map<String, List<Map<String, String>>> products = new HashMap<>();

// Electronics products
List<Map<String, String>> electronicsProducts = new ArrayList<>();
Map<String, String> phone = new HashMap<>();
phone.put("name", "Smartphone Pro");
phone.put("price", "₹25,999");
phone.put("image", "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=300&fit=crop&crop=center");
phone.put("description", "Latest Smartphone Pro with advanced features and 5G connectivity");
phone.put("rating", "4.5");
phone.put("id", "phone1");
electronicsProducts.add(phone);

Map<String, String> laptop = new HashMap<>();
laptop.put("name", "Gaming Laptop");
laptop.put("price", "₹65,999");
laptop.put("image", "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop&crop=center");
laptop.put("description", "High performance gaming laptop for pro gamers");
laptop.put("rating", "4.2");
laptop.put("id", "laptop1");
electronicsProducts.add(laptop);

Map<String, String> headphones = new HashMap<>();
headphones.put("name", "Wireless Headphones");
headphones.put("price", "₹8,999");
headphones.put("image", "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop&crop=center");
headphones.put("description", "Noise-cancelling wireless headphones with premium sound");
headphones.put("rating", "4.8");
headphones.put("id", "headphones1");
electronicsProducts.add(headphones);

Map<String, String> smartwatch = new HashMap<>();
smartwatch.put("name", "Smart Watch");
smartwatch.put("price", "₹12,999");
smartwatch.put("image", "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop&crop=center");
smartwatch.put("description", "Smart Watch with fitness tracking and health monitoring");
smartwatch.put("rating", "4.3");
smartwatch.put("id", "smartwatch1");
electronicsProducts.add(smartwatch);

// Fashion products
List<Map<String, String>> fashionProducts = new ArrayList<>();
Map<String, String> tshirt = new HashMap<>();
tshirt.put("name", "Premium T-Shirt");
tshirt.put("price", "₹1,299");
tshirt.put("image", "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=300&fit=crop&crop=center");
tshirt.put("description", "Comfortable cotton t-shirt in various colors");
tshirt.put("rating", "4.4");
tshirt.put("id", "tshirt1");
fashionProducts.add(tshirt);

Map<String, String> jeans = new HashMap<>();
jeans.put("name", "Designer Jeans");
jeans.put("price", "₹2,999");
jeans.put("image", "https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=300&fit=crop&crop=center");
jeans.put("description", "Classic fit designer jeans for everyday wear");
jeans.put("rating", "4.6");
jeans.put("id", "jeans1");
fashionProducts.add(jeans);

Map<String, String> jacket = new HashMap<>();
jacket.put("name", "Winter Jacket");
jacket.put("price", "₹4,999");
jacket.put("image", "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=300&fit=crop&crop=center");
jacket.put("description", "Warm and stylish winter jacket");
jacket.put("rating", "4.7");
jacket.put("id", "jacket1");
fashionProducts.add(jacket);

// Home products
List<Map<String, String>> homeProducts = new ArrayList<>();
Map<String, String> sofa = new HashMap<>();
sofa.put("name", "Modern Sofa");
sofa.put("price", "₹35,999");
sofa.put("image", "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop&crop=center");
sofa.put("description", "Comfortable modern sofa for your living room");
sofa.put("rating", "4.5");
sofa.put("id", "sofa1");
homeProducts.add(sofa);

Map<String, String> lamp = new HashMap<>();
lamp.put("name", "Table Lamp");
lamp.put("price", "₹3,999");
lamp.put("image", "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop&crop=center");
lamp.put("description", "Elegant table lamp for your workspace");
lamp.put("rating", "4.3");
lamp.put("id", "lamp1");
homeProducts.add(lamp);

// Sports products
List<Map<String, String>> sportsProducts = new ArrayList<>();
Map<String, String> basketball = new HashMap<>();
basketball.put("name", "Basketball");
basketball.put("price", "₹2,499");
basketball.put("image", "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop&crop=center");
basketball.put("description", "Professional basketball for indoor and outdoor play");
basketball.put("rating", "4.6");
basketball.put("id", "basketball1");
sportsProducts.add(basketball);

Map<String, String> dumbbells = new HashMap<>();
dumbbells.put("name", "Adjustable Dumbbells");
dumbbells.put("price", "₹8,999");
dumbbells.put("image", "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop&crop=center");
dumbbells.put("description", "Adjustable dumbbells for home gym workouts");
dumbbells.put("rating", "4.4");
dumbbells.put("id", "dumbbells1");
sportsProducts.add(dumbbells);

// Books products
List<Map<String, String>> booksProducts = new ArrayList<>();
Map<String, String> javaBook = new HashMap<>();
javaBook.put("name", "Java Programming Guide");
javaBook.put("price", "₹1,299");
javaBook.put("image", "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop&crop=center");
javaBook.put("description", "Comprehensive guide to Java programming");
javaBook.put("rating", "4.8");
javaBook.put("id", "javabook1");
booksProducts.add(javaBook);

Map<String, String> springBook = new HashMap<>();
springBook.put("name", "Spring Framework Guide");
springBook.put("price", "₹1,599");
springBook.put("image", "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=300&fit=crop&crop=center");
springBook.put("description", "Complete guide to Spring Framework development");
springBook.put("rating", "4.7");
springBook.put("id", "springbook1");
booksProducts.add(springBook);

// Beauty products
List<Map<String, String>> beautyProducts = new ArrayList<>();
Map<String, String> lipstick = new HashMap<>();
lipstick.put("name", "Premium Lipstick Set");
lipstick.put("price", "₹2,999");
lipstick.put("image", "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400&h=300&fit=crop&crop=center");
lipstick.put("description", "Set of 6 premium lipstick shades");
lipstick.put("rating", "4.5");
lipstick.put("id", "lipstick1");
beautyProducts.add(lipstick);

Map<String, String> skincare = new HashMap<>();
skincare.put("name", "Anti-Aging Cream");
skincare.put("price", "₹3,499");
skincare.put("image", "https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400&h=300&fit=crop&crop=center");
skincare.put("description", "Premium anti-aging skincare cream");
skincare.put("rating", "4.6");
skincare.put("id", "skincare1");
beautyProducts.add(skincare);

products.put("Electronics", electronicsProducts);
products.put("Fashion", fashionProducts);
products.put("Home", homeProducts);
products.put("Sports", sportsProducts);
products.put("Books", booksProducts);
products.put("Beauty", beautyProducts);

List<Map<String, String>> prodList = products.getOrDefault(category, new ArrayList<>());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Products - <%=category%> | ShopEasy</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
        .product-card {
            transition: all 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .product-image {
            height: 250px;
            background-size: cover;
            background-position: center;
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
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        .btn-secondary {
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .container {
                max-width: 100%;
                padding: 0 15px;
            }
        }

        @media (max-width: 992px) {
            .products-grid {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
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
            
            .products-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 15px;
            }
            
            .product-card {
                margin-bottom: 20px;
            }
            
            .product-image {
                height: 200px;
            }
            
            .product-info h3 {
                font-size: 1.2rem;
            }
            
            .product-price {
                font-size: 1.3rem;
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
            
            .products-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .product-image {
                height: 180px;
            }
            
            .product-info h3 {
                font-size: 1.1rem;
            }
            
            .product-price {
                font-size: 1.2rem;
            }
            
            .btn {
                padding: 8px 20px;
                font-size: 13px;
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
            
            .product-image {
                height: 160px;
            }
            
            .product-info h3 {
                font-size: 1rem;
            }
            
            .product-price {
                font-size: 1.1rem;
            }
            
            .btn {
                padding: 6px 16px;
                font-size: 12px;
            }
        }

        @media (max-width: 360px) {
            .container {
                padding: 0 5px;
            }
            
            .product-image {
                height: 140px;
            }
            
            .btn {
                padding: 5px 12px;
                font-size: 11px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-shopping-bag"></i>
                <span>ShopEasy</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="category.jsp">Categories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="product.jsp?category=<%=category%>">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cart.jsp">Cart</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <h1 class="section-title"><%=category%> Products</h1>
        <% if(prodList.isEmpty()) { %>
            <div class="alert alert-info text-center">
                <i class="fas fa-info-circle me-2"></i>
                No products found in this category.
            </div>
        <% } else { %>
            <div class="row">
                <% for(Map<String, String> product : prodList) { %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card product-card h-100">
                        <div class="product-image">
                            <img src="<%=product.get("image")%>" alt="<%=product.get("name")%>" loading="lazy">
                            <div class="product-overlay">
                                <button class="btn btn-light btn-sm" data-bs-toggle="modal" 
                                        data-bs-target="#quickViewModal" 
                                        data-title="<%=product.get("name")%>"
                                        data-img="<%=product.get("image")%>"
                                        data-price="<%=product.get("price")%>"
                                        data-rating="<%=product.get("rating")%>"
                                        data-desc="<%=product.get("description")%>">
                                    <i class="fas fa-eye me-1"></i>Quick View
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%=product.get("name")%></h5>
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
                            <p class="card-text text-muted small"><%=product.get("description")%></p>
                            <form action="cart.jsp" method="post" class="mt-3">
                                <input type="hidden" name="productId" value="<%=product.get("id")%>" />
                                <input type="hidden" name="productName" value="<%=product.get("name")%>" />
                                <input type="hidden" name="productPrice" value="<%=product.get("price")%>" />
                                <input type="hidden" name="productImage" value="<%=product.get("image")%>" />
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-shopping-cart me-1"></i>Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        <% } %>
        <div class="text-center mt-4">
            <a href="category.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-1"></i>Back to Categories
            </a>
        </div>
    </div>

    <!-- Quick View Modal -->
    <div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="quickViewModalLabel">Product Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-12 col-lg-6">
                            <img id="quickViewImg" src="" class="w-100 rounded" alt="Product Image">
                        </div>
                        <div class="col-12 col-lg-6">
                            <h4 id="quickViewTitle" class="mb-3"></h4>
                            <p id="quickViewDesc" class="mb-3"></p>
                            <p class="mb-1"><strong>Price:</strong> <span id="quickViewPrice" class="text-primary fs-5"></span></p>
                            <p class="mb-3"><strong>Rating:</strong> <span id="quickViewRating"></span></p>
                            <button type="button" class="btn btn-success">
                                <i class="fas fa-shopping-cart me-1"></i>Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Quick View Modal functionality
        document.querySelectorAll('[data-bs-target="#quickViewModal"]').forEach(function(btn) {
            btn.addEventListener('click', function() {
                document.getElementById('quickViewModalLabel').textContent = this.getAttribute('data-title') || '';
                document.getElementById('quickViewImg').src = this.getAttribute('data-img') || '';
                document.getElementById('quickViewTitle').textContent = this.getAttribute('data-title') || '';
                document.getElementById('quickViewDesc').textContent = this.getAttribute('data-desc') || '';
                document.getElementById('quickViewPrice').textContent = this.getAttribute('data-price') || '';
                document.getElementById('quickViewRating').textContent = this.getAttribute('data-rating') || '';
            });
        });
    </script>
</body>
</html>
