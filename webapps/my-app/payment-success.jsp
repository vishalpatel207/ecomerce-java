<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
// Clear cart if requested
String clearCart = request.getParameter("clear_cart");
if ("true".equals(clearCart)) {
    session.setAttribute("cart", new ArrayList<>());
}

// Get payment details
String paymentId = request.getParameter("payment_id");
String method = request.getParameter("method");
String amount = request.getParameter("amount");

// Fallback values if parameters are missing
if (paymentId == null || paymentId.isEmpty()) {
    paymentId = "PAY_DEMO_" + System.currentTimeMillis();
}
if (method == null || method.isEmpty()) {
    method = "demo";
}
if (amount == null || amount.isEmpty()) {
    amount = "0.00";
}

// Get user info
String username = (String) session.getAttribute("username");
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
if (isLoggedIn == null) isLoggedIn = false;

// Generate order ID and current date
String orderId = "ORD_" + System.currentTimeMillis();
SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
String currentDate = sdf.format(new Date());

// Payment method display names
Map<String, String> methodNames = new HashMap<>();
methodNames.put("card", "Credit/Debit Card");
methodNames.put("upi", "UPI Payment");
methodNames.put("netbanking", "Net Banking");
methodNames.put("wallet", "Digital Wallet");

String methodDisplay = methodNames.getOrDefault(method, "Online Payment");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful - ShopEasy</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .success-container {
            margin-top: 100px;
            background: #f8f9fa;
            min-height: 90vh;
            padding: 40px 0;
            display: flex;
            align-items: center;
        }
        
        .success-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .success-header {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 40px 30px;
            text-align: center;
            position: relative;
        }
        
        .success-icon {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            animation: successPulse 2s ease-in-out infinite;
        }
        
        .success-icon i {
            font-size: 40px;
        }
        
        @keyframes successPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        
        .success-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .success-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .success-content {
            padding: 40px 30px;
        }
        
        .order-details {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }
        
        .detail-row:last-child {
            border-bottom: none;
            font-weight: 600;
            font-size: 1.1rem;
        }
        
        .detail-label {
            color: #6c757d;
            font-weight: 500;
        }
        
        .detail-value {
            font-weight: 600;
            color: #2d3748;
        }
        
        .payment-status {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 15px 20px;
            background: rgba(40, 167, 69, 0.1);
            border-radius: 10px;
            color: #28a745;
            margin-bottom: 30px;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: 600;
            text-decoration: none;
            color: white;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            min-width: 150px;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
            color: white;
        }
        
        .btn-outline {
            border: 2px solid #667eea;
            background: transparent;
            color: #667eea;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            min-width: 150px;
        }
        
        .btn-outline:hover {
            background: #667eea;
            color: white;
        }
        
        .download-section {
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            margin-top: 20px;
        }
        
        .download-btn {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .download-btn:hover {
            background: #218838;
            transform: translateY(-1px);
        }
        
        .next-steps {
            background: #e7f3ff;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #007bff;
            margin-top: 20px;
        }
        
        .next-steps h6 {
            color: #007bff;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .next-steps ul {
            margin-bottom: 0;
            padding-left: 20px;
        }
        
        .next-steps li {
            margin-bottom: 5px;
            color: #495057;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .success-container {
                padding: 20px 10px;
                margin-top: 80px;
            }
            
            .success-content {
                padding: 30px 20px;
            }
            
            .success-header {
                padding: 30px 20px;
            }
            
            .success-title {
                font-size: 1.5rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-primary,
            .btn-outline {
                flex: none;
                width: 100%;
            }
        }
        
        @media (max-width: 576px) {
            .order-details {
                padding: 20px 15px;
            }
            
            .detail-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            
            .success-icon {
                width: 60px;
                height: 60px;
            }
            
            .success-icon i {
                font-size: 30px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="success-container">
        <div class="container">
            <div class="success-card">
                <div class="success-header">
                    <div class="success-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <h1 class="success-title">Payment Successful!</h1>
                    <p class="success-subtitle">Thank you for your purchase. Your order has been confirmed.</p>
                </div>
                
                <div class="success-content">
                    <div class="payment-status">
                        <i class="fas fa-check-circle"></i>
                        <span><strong>Payment Completed Successfully</strong></span>
                    </div>
                    
                    <div class="order-details">
                        <h5 class="mb-3"><i class="fas fa-receipt me-2"></i>Transaction Details</h5>
                        
                        <div class="detail-row">
                            <span class="detail-label">Order ID</span>
                            <span class="detail-value"><%=orderId%></span>
                        </div>
                        
                        <div class="detail-row">
                            <span class="detail-label">Payment ID</span>
                            <span class="detail-value"><%=paymentId%></span>
                        </div>
                        
                        <div class="detail-row">
                            <span class="detail-label">Payment Method</span>
                            <span class="detail-value"><%=methodDisplay%></span>
                        </div>
                        
                        <div class="detail-row">
                            <span class="detail-label">Date & Time</span>
                            <span class="detail-value"><%=currentDate%></span>
                        </div>
                        
                        <% if (isLoggedIn) { %>
                        <div class="detail-row">
                            <span class="detail-label">Customer</span>
                            <span class="detail-value"><%=username%></span>
                        </div>
                        <% } %>
                        
                        <div class="detail-row">
                            <span class="detail-label">Amount Paid</span>
                            <span class="detail-value" style="color: #28a745; font-size: 1.2rem;">₹<%=amount%></span>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <a href="index.jsp" class="btn-primary">
                            <i class="fas fa-home me-2"></i>Continue Shopping
                        </a>
                        <a href="category.jsp" class="btn-outline">
                            <i class="fas fa-th-large me-2"></i>Browse Categories
                        </a>
                    </div>
                    
                    <div class="download-section">
                        <h6><i class="fas fa-download me-2"></i>Download Receipt</h6>
                        <p class="text-muted mb-3">Get your payment receipt for records</p>
                        <button class="download-btn" onclick="downloadReceipt()">
                            <i class="fas fa-file-pdf me-2"></i>Download PDF
                        </button>
                    </div>
                    
                    <div class="next-steps">
                        <h6><i class="fas fa-info-circle me-2"></i>What's Next?</h6>
                        <ul>
                            <li>Order confirmation email will be sent to your registered email</li>
                            <li>SMS notification will be sent for order updates</li>
                            <li>Your order will be processed within 24 hours</li>
                            <li>Estimated delivery: 3-5 business days</li>
                            <li>Track your order using Order ID: <strong><%=orderId%></strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Auto redirect after 30 seconds (optional)
        setTimeout(() => {
            const redirect = confirm('Would you like to continue shopping?');
            if (redirect) {
                window.location.href = 'index.jsp';
            }
        }, 30000);
        
        function downloadReceipt() {
            // Create a simple receipt content
            const receiptContent = `
                SHOPEASY - PAYMENT RECEIPT
                ========================
                
                Order ID: <%=orderId%>
                Payment ID: <%=paymentId%>
                Date: <%=currentDate%>
                Payment Method: <%=methodDisplay%>
                Amount: ₹<%=amount%>
                Status: SUCCESSFUL
                
                Customer: <%=isLoggedIn ? username : "Guest"%>
                
                Thank you for shopping with ShopEasy!
                
                For support, contact: support@shopeasy.com
                Phone: +91 88490 58246
            `;
            
            // Create and download the receipt
            const element = document.createElement('a');
            const file = new Blob([receiptContent], {type: 'text/plain'});
            element.href = URL.createObjectURL(file);
            element.download = 'ShopEasy_Receipt_<%=paymentId%>.txt';
            document.body.appendChild(element);
            element.click();
            document.body.removeChild(element);
            
            // Show success message
            alert('Receipt downloaded successfully!');
        }
        
        // Add confetti effect (optional)
        function createConfetti() {
            const confetti = document.createElement('div');
            confetti.style.position = 'fixed';
            confetti.style.top = '0';
            confetti.style.left = '0';
            confetti.style.width = '100%';
            confetti.style.height = '100%';
            confetti.style.pointerEvents = 'none';
            confetti.style.zIndex = '9999';
            
            for (let i = 0; i < 50; i++) {
                const piece = document.createElement('div');
                piece.style.position = 'absolute';
                piece.style.width = '10px';
                piece.style.height = '10px';
                piece.style.background = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#96ceb4', '#ffa726'][Math.floor(Math.random() * 5)];
                piece.style.left = Math.random() * 100 + '%';
                piece.style.top = '-10px';
                piece.style.borderRadius = '50%';
                piece.style.animation = `fall ${Math.random() * 3 + 2}s linear infinite`;
                confetti.appendChild(piece);
            }
            
            document.body.appendChild(confetti);
            
            setTimeout(() => {
                document.body.removeChild(confetti);
            }, 5000);
        }
        
        // Add CSS for confetti animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fall {
                to {
                    transform: translateY(100vh) rotate(360deg);
                }
            }
        `;
        document.head.appendChild(style);
        
        // Trigger confetti on page load
        setTimeout(createConfetti, 500);
    </script>
</body>
</html>