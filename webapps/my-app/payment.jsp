<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
// Get cart from session
List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
if (cart == null) {
    cart = new ArrayList<>();
}

// Calculate total
double total = 0;
for (Map<String, String> item : cart) {
    String priceStr = item.get("price").replace("₹", "").replace(",", "");
    double price = Double.parseDouble(priceStr);
    int quantity = Integer.parseInt(item.get("quantity"));
    total += price * quantity;
}

// Get user info
String username = (String) session.getAttribute("username");
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
if (isLoggedIn == null) isLoggedIn = false;

// For demo purposes, allow guest checkout
if (!isLoggedIn) {
    username = "Guest User";
}

// Redirect to cart if empty
if (cart.isEmpty()) {
    response.sendRedirect("cart.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Payment - ShopEasy</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        .payment-container {
            margin-top: 100px;
            background: #f8f9fa;
            min-height: 90vh;
            padding: 40px 0;
        }
        
        .payment-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .payment-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .payment-header h2 {
            margin: 0;
            font-weight: 700;
        }
        
        .payment-header .secure-badge {
            background: rgba(255, 255, 255, 0.2);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 14px;
            margin-top: 10px;
            display: inline-block;
        }
        
        .payment-methods {
            padding: 30px;
        }
        
        .method-tabs {
            display: flex;
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        
        .method-tab {
            flex: 1;
            padding: 15px 20px;
            text-align: center;
            cursor: pointer;
            border: none;
            background: none;
            transition: all 0.3s ease;
            min-width: 120px;
        }
        
        .method-tab.active {
            border-bottom: 3px solid #667eea;
            color: #667eea;
            font-weight: 600;
        }
        
        .method-tab:hover {
            background: #f8f9fa;
        }
        
        .payment-content {
            display: none;
        }
        
        .payment-content.active {
            display: block;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 8px;
            display: block;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            outline: none;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-col {
            flex: 1;
        }
        
        .card-icons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        
        .card-icon {
            width: 40px;
            height: 25px;
            background: #f8f9fa;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 600;
            color: #667eea;
        }
        
        .upi-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }
        
        .upi-option {
            padding: 15px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .upi-option:hover,
        .upi-option.selected {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
        }
        
        .upi-option img {
            width: 40px;
            height: 40px;
            margin-bottom: 8px;
        }
        
        .bank-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }
        
        .bank-option {
            padding: 15px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .bank-option:hover,
        .bank-option.selected {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
        }
        
        .order-summary {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .summary-total {
            border-top: 2px solid #e2e8f0;
            padding-top: 15px;
            margin-top: 15px;
            font-weight: 700;
            font-size: 1.2rem;
        }
        
        .pay-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .pay-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        
        .security-features {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 20px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        
        .security-item {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #28a745;
            font-size: 14px;
        }
        
        .loading-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }
        
        .loading-content {
            background: white;
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            max-width: 400px;
        }
        
        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #667eea;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .payment-container {
                padding: 20px 0;
                margin-top: 80px;
            }
            
            .method-tabs {
                flex-direction: column;
            }
            
            .method-tab {
                flex: none;
                margin-bottom: 5px;
            }
            
            .form-row {
                flex-direction: column;
                gap: 20px;
            }
            
            .upi-options {
                grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            }
            
            .bank-grid {
                grid-template-columns: 1fr;
            }
            
            .security-features {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
        }
        
        @media (max-width: 576px) {
            .payment-methods {
                padding: 20px 15px;
            }
            
            .payment-header {
                padding: 20px 15px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="payment-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="payment-card">
                        <div class="payment-header">
                            <h2><i class="fas fa-shield-alt me-2"></i>Secure Payment</h2>
                            <div class="secure-badge">
                                <i class="fas fa-lock me-1"></i>256-bit SSL Encrypted
                            </div>
                        </div>
                        
                        <div class="payment-methods">
                            <!-- Order Summary -->
                            <div class="order-summary">
                                <h5 class="mb-3"><i class="fas fa-receipt me-2"></i>Order Summary</h5>
                                <% for(Map<String, String> item : cart) { %>
                                    <div class="summary-row">
                                        <span><%=item.get("name")%> × <%=item.get("quantity")%></span>
                                        <span>₹<%=String.format("%.2f", Double.parseDouble(item.get("price").replace("₹", "").replace(",", "")) * Integer.parseInt(item.get("quantity")))%></span>
                                    </div>
                                <% } %>
                                <div class="summary-row">
                                    <span>Shipping</span>
                                    <span class="text-success">Free</span>
                                </div>
                                <div class="summary-row">
                                    <span>GST (18%)</span>
                                    <span>₹<%=String.format("%.2f", total * 0.18)%></span>
                                </div>
                                <div class="summary-row summary-total">
                                    <span>Total Amount</span>
                                    <span>₹<%=String.format("%.2f", total + (total * 0.18))%></span>
                                </div>
                            </div>
                            
                            <!-- Payment Method Tabs -->
                            <div class="method-tabs">
                                <button class="method-tab active" onclick="showPaymentMethod('card')">
                                    <i class="fas fa-credit-card mb-1"></i><br>Credit/Debit Card
                                </button>
                                <button class="method-tab" onclick="showPaymentMethod('upi')">
                                    <i class="fas fa-mobile-alt mb-1"></i><br>UPI
                                </button>
                                <button class="method-tab" onclick="showPaymentMethod('netbanking')">
                                    <i class="fas fa-university mb-1"></i><br>Net Banking
                                </button>
                                <button class="method-tab" onclick="showPaymentMethod('wallet')">
                                    <i class="fas fa-wallet mb-1"></i><br>Wallet
                                </button>
                            </div>
                            
                            <!-- Credit/Debit Card -->
                            <div id="card" class="payment-content active">
                                <form id="cardForm" onsubmit="processPayment(event, 'card')">
                                    <div class="form-group">
                                        <label class="form-label">Card Number</label>
                                        <input type="text" class="form-control" placeholder="1234 5678 9012 3456" 
                                               maxlength="19" oninput="formatCardNumber(this)" required>
                                        <div class="card-icons">
                                            <div class="card-icon">VISA</div>
                                            <div class="card-icon">MC</div>
                                            <div class="card-icon">AMEX</div>
                                            <div class="card-icon">RUPAY</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Cardholder Name</label>
                                        <input type="text" class="form-control" placeholder="John Doe" required>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-col">
                                            <label class="form-label">Expiry Date</label>
                                            <input type="text" class="form-control" placeholder="MM/YY" 
                                                   maxlength="5" oninput="formatExpiry(this)" required>
                                        </div>
                                        <div class="form-col">
                                            <label class="form-label">CVV</label>
                                            <input type="password" class="form-control" placeholder="123" 
                                                   maxlength="4" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="pay-button">
                                        <i class="fas fa-lock me-2"></i>Pay ₹<%=String.format("%.2f", total + (total * 0.18))%>
                                    </button>
                                </form>
                            </div>
                            
                            <!-- UPI -->
                            <div id="upi" class="payment-content">
                                <form id="upiForm" onsubmit="processPayment(event, 'upi')">
                                    <div class="form-group">
                                        <label class="form-label">UPI ID</label>
                                        <input type="text" class="form-control" placeholder="yourname@paytm" required>
                                    </div>
                                    <div class="upi-options">
                                        <div class="upi-option" onclick="selectUpiApp('googlepay')">
                                            <div style="width:40px; height:40px; background:#4285f4; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">G</div>
                                            <div>Google Pay</div>
                                        </div>
                                        <div class="upi-option" onclick="selectUpiApp('phonepe')">
                                            <div style="width:40px; height:40px; background:#5f259f; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">P</div>
                                            <div>PhonePe</div>
                                        </div>
                                        <div class="upi-option" onclick="selectUpiApp('paytm')">
                                            <div style="width:40px; height:40px; background:#00baf2; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">P</div>
                                            <div>Paytm</div>
                                        </div>
                                        <div class="upi-option" onclick="selectUpiApp('bhim')">
                                            <div style="width:40px; height:40px; background:#ff6600; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">B</div>
                                            <div>BHIM UPI</div>
                                        </div>
                                    </div>
                                    <button type="submit" class="pay-button">
                                        <i class="fas fa-mobile-alt me-2"></i>Pay with UPI
                                    </button>
                                </form>
                            </div>
                            
                            <!-- Net Banking -->
                            <div id="netbanking" class="payment-content">
                                <form id="netbankingForm" onsubmit="processPayment(event, 'netbanking')">
                                    <div class="form-group">
                                        <label class="form-label">Select Your Bank</label>
                                        <select class="form-control" required>
                                            <option value="">Choose your bank</option>
                                            <option value="sbi">State Bank of India</option>
                                            <option value="hdfc">HDFC Bank</option>
                                            <option value="icici">ICICI Bank</option>
                                            <option value="axis">Axis Bank</option>
                                            <option value="kotak">Kotak Mahindra Bank</option>
                                            <option value="pnb">Punjab National Bank</option>
                                        </select>
                                    </div>
                                    <div class="bank-grid">
                                        <div class="bank-option" onclick="selectBank('sbi')">
                                            <strong>SBI</strong><br>
                                            <small>State Bank of India</small>
                                        </div>
                                        <div class="bank-option" onclick="selectBank('hdfc')">
                                            <strong>HDFC</strong><br>
                                            <small>HDFC Bank</small>
                                        </div>
                                        <div class="bank-option" onclick="selectBank('icici')">
                                            <strong>ICICI</strong><br>
                                            <small>ICICI Bank</small>
                                        </div>
                                        <div class="bank-option" onclick="selectBank('axis')">
                                            <strong>AXIS</strong><br>
                                            <small>Axis Bank</small>
                                        </div>
                                    </div>
                                    <button type="submit" class="pay-button">
                                        <i class="fas fa-university me-2"></i>Pay with Net Banking
                                    </button>
                                </form>
                            </div>
                            
                            <!-- Wallet -->
                            <div id="wallet" class="payment-content">
                                <form id="walletForm" onsubmit="processPayment(event, 'wallet')">
                                    <div class="form-group">
                                        <label class="form-label">Select Wallet</label>
                                        <div class="upi-options">
                                            <div class="upi-option" onclick="selectWallet('paytm')">
                                                <div style="width:40px; height:40px; background:#00baf2; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">P</div>
                                                <div>Paytm Wallet</div>
                                            </div>
                                            <div class="upi-option" onclick="selectWallet('freecharge')">
                                                <div style="width:40px; height:40px; background:#00c853; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">F</div>
                                                <div>FreeCharge</div>
                                            </div>
                                            <div class="upi-option" onclick="selectWallet('mobikwik')">
                                                <div style="width:40px; height:40px; background:#e91e63; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">M</div>
                                                <div>MobiKwik</div>
                                            </div>
                                            <div class="upi-option" onclick="selectWallet('amazon')">
                                                <div style="width:40px; height:40px; background:#ff9900; border-radius:50%; margin:0 auto 8px; display:flex; align-items:center; justify-content:center; color:white; font-weight:bold;">A</div>
                                                <div>Amazon Pay</div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="pay-button">
                                        <i class="fas fa-wallet me-2"></i>Pay with Wallet
                                    </button>
                                </form>
                            </div>
                            
                            <!-- Security Features -->
                            <div class="security-features">
                                <div class="security-item">
                                    <i class="fas fa-shield-alt"></i>
                                    <span>SSL Secure</span>
                                </div>
                                <div class="security-item">
                                    <i class="fas fa-lock"></i>
                                    <span>Bank Level Security</span>
                                </div>
                                <div class="security-item">
                                    <i class="fas fa-check-circle"></i>
                                    <span>PCI DSS Compliant</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Loading Overlay -->
    <div id="loadingOverlay" class="loading-overlay">
        <div class="loading-content">
            <div class="spinner"></div>
            <h4>Processing Payment...</h4>
            <p>Please do not refresh or close this window</p>
        </div>
    </div>
    
    <script>
        function showPaymentMethod(method) {
            // Hide all content
            document.querySelectorAll('.payment-content').forEach(content => {
                content.classList.remove('active');
            });
            
            // Remove active class from all tabs
            document.querySelectorAll('.method-tab').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show selected content and activate tab
            document.getElementById(method).classList.add('active');
            
            // Find and activate the clicked tab
            const clickedTab = event ? event.target.closest('.method-tab') : document.querySelector('.method-tab');
            if (clickedTab) {
                clickedTab.classList.add('active');
            }
        }
        
        function formatCardNumber(input) {
            let value = input.value.replace(/\s/g, '').replace(/[^0-9]/gi, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            input.value = formattedValue;
        }
        
        function formatExpiry(input) {
            let value = input.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0,2) + '/' + value.substring(2,4);
            }
            input.value = value;
        }
        
        function selectUpiApp(app) {
            document.querySelectorAll('.upi-option').forEach(option => {
                option.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
        }
        
        function selectBank(bank) {
            document.querySelectorAll('.bank-option').forEach(option => {
                option.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
            
            // Update select dropdown
            document.querySelector('#netbanking select').value = bank;
        }
        
        function selectWallet(wallet) {
            document.querySelectorAll('#wallet .upi-option').forEach(option => {
                option.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
        }
        
        function processPayment(event, method) {
            event.preventDefault();
            console.log('Processing payment with method:', method);
            
            // Show loading overlay
            document.getElementById('loadingOverlay').style.display = 'flex';
            
            // Simulate payment processing
            setTimeout(() => {
                // Generate random payment ID
                const paymentId = 'PAY_' + Math.random().toString(36).substring(2, 15).toUpperCase();
                const totalAmount = '<%=String.format("%.2f", total + (total * 0.18))%>';
                
                console.log('Redirecting to success page with:', {
                    paymentId: paymentId,
                    method: method,
                    amount: totalAmount
                });
                
                // Redirect to success page with clear cart parameter
                const successUrl = 'payment-success.jsp?payment_id=' + paymentId + '&method=' + method + '&amount=' + totalAmount + '&clear_cart=true';
                console.log('Success URL:', successUrl);
                window.location.href = successUrl;
            }, 3000);
        }
    </script>
</body>
</html>