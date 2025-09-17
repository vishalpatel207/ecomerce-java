
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us - ShopEasy</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .contact-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0 60px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .contact-hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            animation: fadeInUp 0.7s;
        }
        .contact-hero p {
            font-size: 1.3rem;
            margin-bottom: 30px;
            animation: fadeInUp 1.1s;
        }
        .contact-hero .contact-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #fff;
            animation: bounce 1.5s infinite alternate;
        }
        @keyframes bounce {
            0% { transform: translateY(0); }
            100% { transform: translateY(-20px); }
        }
        .contact-section {
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
        .contact-form label {
            font-weight: 600;
            color: #667eea;
        }
        .contact-form input, .contact-form textarea {
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            margin-bottom: 20px;
        }
        .contact-form textarea {
            min-height: 120px;
        }
        .contact-form button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .contact-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        .contact-info {
            margin-top: 40px;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }
        .contact-info-item {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 25px 20px;
            min-width: 220px;
            max-width: 300px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(102,126,234,0.12);
            animation: fadeInUp 1.5s;
        }
        .contact-info-item i {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        @media (max-width: 768px) {
            .contact-section { padding: 30px 10px; }
            .contact-info { flex-direction: column; gap: 20px; }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="contact-hero" style="margin-top: 70px;">
        <div class="contact-icon"><i class="fas fa-envelope-open-text"></i></div>
        <h1>Contact Us</h1>
        <p>Have a question, feedback, or need help? Our team is here for you 24/7. Reach out and we’ll get back to you fast!</p>
    </div>
    <div class="contact-section">
        <form class="contact-form" method="post" action="#">
            <div class="mb-3">
                <label for="name">Your Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                <label for="email">Your Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" name="message" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Send Message</button>
        </form>
        <div class="contact-info">
            <div class="contact-info-item">
                <i class="fas fa-map-marker-alt"></i>
                <div>Ahemdbad-Gujarat , India</div>
            </div>
            <div class="contact-info-item">
                <i class="fas fa-phone"></i>
                <div>+91 88490 58246</div>
            </div>
            <div class="contact-info-item">
                <i class="fas fa-envelope"></i>
                <div>patelvishal77890@gmail.com</div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

