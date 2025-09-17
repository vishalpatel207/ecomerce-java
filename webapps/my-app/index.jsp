<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ShopEasy - Your Premium Online Shopping Destination</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 90vh;
            margin-top: 70px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        
        .hero-content {
            z-index: 2;
            color: white;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }
        
        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .hero-bg-decoration {
            position: absolute;
            top: 0;
            right: -10%;
            width: 60%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><polygon fill="rgba(255,255,255,0.1)" points="0,0 1000,300 1000,1000 0,700"/></svg>') no-repeat;
            background-size: cover;
        }
        
        .btn-hero {
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s ease;
            border: 2px solid white;
            background: white;
            color: #667eea;
            text-decoration: none;
            display: inline-block;
            margin-right: 20px;
        }
        
        .btn-hero:hover {
            background: transparent;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        
        .btn-hero-outline {
            background: transparent;
            color: white;
            border: 2px solid rgba(255,255,255,0.5);
        }
        
        .btn-hero-outline:hover {
            background: white;
            color: #667eea;
            border-color: white;
        }
        
        .features-section {
            padding: 80px 0;
            background: #f8f9fa;
        }
        
        .feature-card {
            background: white;
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: none;
            height: 100%;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }
        
        .feature-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            color: white;
            font-size: 2rem;
        }
        
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 20px;
        }
        
        .section-subtitle {
            text-align: center;
            color: #6c757d;
            font-size: 1.1rem;
            margin-bottom: 50px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .stats-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 10px;
            display: block;
        }
        
        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .cta-section {
            background: #2d3748;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        
        .newsletter-form {
            max-width: 500px;
            margin: 0 auto;
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .newsletter-input {
            flex: 1;
            padding: 15px 20px;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
        }
        
        .newsletter-btn {
            background: #667eea;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
        }
        
        .newsletter-btn:hover {
            background: #5a67d8;
            transform: translateY(-2px);
        }
        
        /* Responsive Design */
        @media (max-width: 1200px) {
            .hero-title {
                font-size: 3rem;
            }
        }
        
        @media (max-width: 992px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .btn-hero {
                padding: 12px 30px;
                font-size: 1rem;
                margin-bottom: 15px;
                display: block;
                text-align: center;
                margin-right: 0;
            }
            
            .features-section {
                padding: 60px 0;
            }
            
            .feature-card {
                padding: 30px 20px;
                margin-bottom: 30px;
            }
        }
        
        @media (max-width: 768px) {
            .hero-section {
                min-height: 70vh;
                text-align: center;
            }
            
            .hero-title {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .stat-number {
                font-size: 2.5rem;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-btn {
                width: 100%;
            }
        }
        
        @media (max-width: 576px) {
            .hero-title {
                font-size: 1.75rem;
            }
            
            .hero-subtitle {
                font-size: 1rem;
            }
            
            .section-title {
                font-size: 1.75rem;
            }
            
            .feature-icon {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
            }
            
            .feature-card {
                padding: 25px 15px;
            }
            
            .stats-section {
                padding: 40px 0;
            }
            
            .cta-section {
                padding: 60px 0;
            }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-bg-decoration"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="hero-content">
                        <h1 class="hero-title">Welcome to ShopEasy</h1>
                        <p class="hero-subtitle">Discover amazing products at unbeatable prices. Shop with confidence and enjoy fast, secure delivery.</p>
                        <div class="hero-buttons">
                            <a href="category.jsp" class="btn-hero">Shop Now</a>
                            <a href="about.jsp" class="btn-hero btn-hero-outline">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-image text-center">
                        <i class="fas fa-shopping-bag" style="font-size: 10rem; opacity: 0.3;"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <h2 class="section-title">Why Choose ShopEasy?</h2>
            <p class="section-subtitle">We provide the best shopping experience with premium features and exceptional service</p>
            
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-shipping-fast"></i>
                        </div>
                        <h4>Fast Delivery</h4>
                        <p>Get your orders delivered quickly with our express shipping options. Free delivery on orders above ₹500.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h4>Secure Shopping</h4>
                        <p>Shop with confidence knowing your data is protected with bank-level security and encrypted transactions.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h4>24/7 Support</h4>
                        <p>Our dedicated customer support team is available round the clock to assist you with any queries.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-undo-alt"></i>
                        </div>
                        <h4>Easy Returns</h4>
                        <p>Not satisfied? No problem! Easy 30-day return policy with hassle-free refunds and exchanges.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-tags"></i>
                        </div>
                        <h4>Best Prices</h4>
                        <p>Competitive pricing with regular discounts and special offers. Save more with our loyalty rewards program.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h4>Quality Products</h4>
                        <p>Curated selection of high-quality products from trusted brands and verified sellers worldwide.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">10K+</span>
                        <div class="stat-label">Happy Customers</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">50K+</span>
                        <div class="stat-label">Products</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">100+</span>
                        <div class="stat-label">Brands</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stat-item">
                        <span class="stat-number">24/7</span>
                        <div class="stat-label">Support</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="section-title text-white">Stay Updated</h2>
                    <p class="section-subtitle text-white opacity-75">Subscribe to our newsletter and never miss out on exclusive deals and new arrivals</p>
                    
                    <form class="newsletter-form">
                        <input type="email" class="newsletter-input" placeholder="Enter your email address" required>
                        <button type="submit" class="newsletter-btn">
                            <i class="fas fa-paper-plane me-2"></i>Subscribe
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Newsletter form handling
        document.querySelector('.newsletter-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const email = this.querySelector('.newsletter-input').value;
            if (email) {
                alert('Thank you for subscribing! You\'ll receive updates at ' + email);
                this.querySelector('.newsletter-input').value = '';
            }
        });
    </script>

    </body>

    </html>