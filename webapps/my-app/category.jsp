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
<html lang="en">
<head>
    <title>Categories - ShopEasy</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 120px 0 80px;
            margin-top: 70px;
            text-align: center;
        }
        
        .page-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .page-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .categories-section {
            padding: 80px 0;
            background: #f8f9fa;
        }
        
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }
        
        .category-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        
        .category-image {
            height: 250px;
            background-size: cover;
            background-position: center;
            position: relative;
            overflow: hidden;
        }
        
        .category-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(102, 126, 234, 0.8), rgba(118, 75, 162, 0.8));
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s ease;
        }
        
        .category-card:hover .category-overlay {
            opacity: 1;
        }
        
        .category-content {
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            text-align: center;
        }
        
        .category-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
            margin: 0 auto 20px;
            transition: all 0.3s ease;
        }
        
        .category-card:hover .category-icon {
            transform: scale(1.1);
        }
        
        .category-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 15px;
        }
        
        .category-description {
            color: #6c757d;
            font-size: 1rem;
            margin-bottom: 25px;
            flex: 1;
        }
        
        .category-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            margin-top: auto;
        }
        
        .category-btn:hover {
            background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
            transform: translateY(-2px);
            color: white;
            text-decoration: none;
        }
        
        .overlay-icon {
            font-size: 3rem;
            color: white;
            opacity: 0.9;
        }
        
        /* Responsive Design */
        @media (max-width: 1200px) {
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            }
        }
        
        @media (max-width: 992px) {
            .page-title {
                font-size: 2.5rem;
            }
            
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 25px;
            }
            
            .category-image {
                height: 200px;
            }
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 100px 0 60px;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .page-subtitle {
                font-size: 1.1rem;
            }
            
            .categories-section {
                padding: 60px 0;
            }
            
            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }
            
            .category-content {
                padding: 25px 20px;
            }
            
            .category-icon {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
            }
        }
        
        @media (max-width: 576px) {
            .page-title {
                font-size: 1.75rem;
            }
            
            .categories-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .category-image {
                height: 180px;
            }
            
            .category-content {
                padding: 20px 15px;
            }
            
            .category-icon {
                width: 50px;
                height: 50px;
                font-size: 1.3rem;
            }
            
            .category-title {
                font-size: 1.3rem;
            }
        }
        
        @media (max-width: 480px) {
            .page-header {
                padding: 90px 0 50px;
            }
            
            .page-title {
                font-size: 1.5rem;
            }
            
            .page-subtitle {
                font-size: 1rem;
            }
            
            .category-image {
                height: 150px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1 class="page-title">Shop by Categories</h1>
            <p class="page-subtitle">Discover our wide range of products across different categories. Find exactly what you're looking for.</p>
        </div>
    </section>
    
    <!-- Categories Section -->
    <section class="categories-section">
        <div class="container">
            <div class="categories-grid">
                <% for(Map.Entry<String, Map<String, String>> entry : categories.entrySet()) {
                    Map<String, String> category = entry.getValue();
                %>
                <div class="category-card" onclick="location.href='product.jsp?category=<%=entry.getKey()%>'">
                    <div class="category-image" style="background-image: url('<%=category.get("image")%>')">
                        <div class="category-overlay">
                            <i class="<%=category.get("icon")%> overlay-icon"></i>
                        </div>
                    </div>
                    <div class="category-content">
                        <div class="category-icon">
                            <i class="<%=category.get("icon")%>"></i>
                        </div>
                        <h3 class="category-title"><%=category.get("name")%></h3>
                        <p class="category-description"><%=category.get("description")%></p>
                        <a href="product.jsp?category=<%=entry.getKey()%>" class="category-btn">
                            <i class="fas fa-arrow-right me-2"></i>View Products
                        </a>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>