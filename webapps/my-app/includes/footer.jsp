<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<footer style="background: #2d3748; color: white; padding: 50px 0 20px 0; margin-top: 50px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <h5 style="color: #667eea; margin-bottom: 20px;">
                    <i class="fas fa-shopping-bag me-2"></i>ShopEasy
                </h5>
                <p style="color: #a0aec0; line-height: 1.6;">
                    Your trusted online shopping destination. Discover amazing products at unbeatable prices with fast delivery and excellent customer service.
                </p>
                <div style="margin-top: 20px;">
                    <a href="#" style="color: #667eea; margin-right: 15px; font-size: 1.2rem;"><i class="fab fa-facebook"></i></a>
                    <a href="#" style="color: #667eea; margin-right: 15px; font-size: 1.2rem;"><i class="fab fa-twitter"></i></a>
                    <a href="#" style="color: #667eea; margin-right: 15px; font-size: 1.2rem;"><i class="fab fa-instagram"></i></a>
                    <a href="#" style="color: #667eea; margin-right: 15px; font-size: 1.2rem;"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
            
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 style="color: white; margin-bottom: 20px;">Quick Links</h6>
                <ul style="list-style: none; padding: 0;">
                    <li style="margin-bottom: 10px;"><a href="index.jsp" style="color: #a0aec0; text-decoration: none;">Home</a></li>
                    <li style="margin-bottom: 10px;"><a href="category.jsp" style="color: #a0aec0; text-decoration: none;">Categories</a></li>
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Electronics" style="color: #a0aec0; text-decoration: none;">Products</a></li>
                    <li style="margin-bottom: 10px;"><a href="about.jsp" style="color: #a0aec0; text-decoration: none;">About Us</a></li>
                    <li style="margin-bottom: 10px;"><a href="contact.jsp" style="color: #a0aec0; text-decoration: none;">Contact</a></li>
                </ul>
            </div>
            
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 style="color: white; margin-bottom: 20px;">Categories</h6>
                <ul style="list-style: none; padding: 0;">
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Electronics" style="color: #a0aec0; text-decoration: none;">Electronics</a></li>
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Fashion" style="color: #a0aec0; text-decoration: none;">Fashion</a></li>
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Home" style="color: #a0aec0; text-decoration: none;">Home & Garden</a></li>
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Sports" style="color: #a0aec0; text-decoration: none;">Sports</a></li>
                    <li style="margin-bottom: 10px;"><a href="product.jsp?category=Books" style="color: #a0aec0; text-decoration: none;">Books</a></li>
                </ul>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <h6 style="color: white; margin-bottom: 20px;">Contact Info</h6>
                <div style="margin-bottom: 15px; color: #a0aec0;">
                    <i class="fas fa-map-marker-alt me-2" style="color: #667eea;"></i>
                    Ahmedabad, Gujarat, India
                </div>
                <div style="margin-bottom: 15px; color: #a0aec0;">
                    <i class="fas fa-phone me-2" style="color: #667eea;"></i>
                    +91 88490 58246
                </div>
                <div style="margin-bottom: 15px; color: #a0aec0;">
                    <i class="fas fa-envelope me-2" style="color: #667eea;"></i>
                    patelvishal77890@gmail.com
                </div>
                <div style="margin-top: 20px;">
                    <h6 style="color: white; margin-bottom: 15px;">Newsletter</h6>
                    <div style="display: flex; gap: 10px;">
                        <input type="email" placeholder="Your email" style="flex: 1; padding: 10px; border: none; border-radius: 5px;">
                        <button style="background: #667eea; color: white; border: none; padding: 10px 15px; border-radius: 5px; cursor: pointer;">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <hr style="border-color: #4a5568; margin: 30px 0 20px 0;">
        
        <div class="row align-items-center">
            <div class="col-md-6">
                <p style="color: #a0aec0; margin: 0;">
                    © 2024 ShopEasy. All rights reserved.
                </p>
            </div>
            <div class="col-md-6 text-md-end">
                <div style="display: flex; gap: 20px; justify-content: flex-end; flex-wrap: wrap;">
                    <a href="#" style="color: #a0aec0; text-decoration: none; font-size: 14px;">Privacy Policy</a>
                    <a href="#" style="color: #a0aec0; text-decoration: none; font-size: 14px;">Terms of Service</a>
                    <a href="#" style="color: #a0aec0; text-decoration: none; font-size: 14px;">Support</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
@media (max-width: 768px) {
    footer .col-md-6.text-md-end div {
        justify-content: center !important;
        margin-top: 10px;
    }
}
</style>