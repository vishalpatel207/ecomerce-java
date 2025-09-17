
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - ShopEasy</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .about-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0 60px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .about-hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            animation: fadeInUp 0.7s;
        }
        .about-hero p {
            font-size: 1.3rem;
            margin-bottom: 30px;
            animation: fadeInUp 1.1s;
        }
        .about-hero .about-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #fff;
            animation: bounce 1.5s infinite alternate;
        }
        @keyframes bounce {
            0% { transform: translateY(0); }
            100% { transform: translateY(-20px); }
        }
        .about-section {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(102,126,234,0.08);
            padding: 50px 30px;
            margin-top: 25px;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
            animation: fadeInUp 1.2s;
        }
        .about-features {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            margin-top: 40px;
        }
        .about-feature {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 30px 25px;
            min-width: 220px;
            max-width: 300px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(102,126,234,0.12);
            animation: fadeInUp 1.5s;
        }
        .about-feature i {
            font-size: 2.2rem;
            margin-bottom: 15px;
        }
        @media (max-width: 768px) {
            .about-section { padding: 30px 10px; }
            .about-features { flex-direction: column; gap: 20px; }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="about-hero" style="margin-top: 70px;">
        <div class="about-icon"><i class="fas fa-users"></i></div>
        <h1>About ShopEasy</h1>
        <p>ShopEasy is your one-stop destination for a seamless, secure, and joyful online shopping experience. We bring you the best products, top brands, and unbeatable deals—all in one place.</p>
    </div>
    <div class="about-section">
        <h2 class="mb-4">Why Shop with Us?</h2>
        <div class="about-features">
            <div class="about-feature">
                <i class="fas fa-shipping-fast"></i>
                <h5>Fast Delivery</h5>
                <p>Lightning-fast shipping to your doorstep, every time.</p>
            </div>
            <div class="about-feature">
                <i class="fas fa-lock"></i>
                <h5>Secure Payments</h5>
                <p>100% secure payment options for worry-free shopping.</p>
            </div>
            <div class="about-feature">
                <i class="fas fa-headset"></i>
                <h5>24/7 Support</h5>
                <p>Our support team is always here to help you, day or night.</p>
            </div>
            <div class="about-feature">
                <i class="fas fa-tags"></i>
                <h5>Best Deals</h5>
                <p>Unbeatable prices and exclusive offers on top products.</p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>