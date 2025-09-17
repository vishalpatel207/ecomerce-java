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
    <%@ include file="includes/head.jsp" %>
    <style>
        .custom-top{
            margin-top: 110px;
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
            }
            
            .total-section {
                padding: 20px;
                margin-top: 20px;
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
            }
            
            .btn {
                padding: 5px 10px;
                font-size: 11px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="container custom-top">
        <h1 class="section-title">Your Shopping Cart</h1>
        
        <% if(cart.isEmpty()) { %>
            <div class="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p class="text-muted">Add some products to get started!</p>
                <a href="category.jsp" class="btn btn-primary mt-3">Start Shopping</a>
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
                                    <button type="submit" class="btn btn-danger btn-sm" 
                                            onclick="return confirm('Remove this item from cart?')">
                                        <i class="fas fa-trash"></i>
                                    </button>
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
                        <div class="d-flex justify-content-between mb-3">
                            <span>GST (18%):</span>
                            <span>₹<%=String.format("%.2f", total * 0.18)%></span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <h5>Total:</h5>
                            <h5 class="text-black">₹<%=String.format("%.2f", total + (total * 0.18))%></h5>
                        </div>
                        <a href="payment.jsp" class="btn btn-primary w-100 mb-3">
                            <i class="fas fa-credit-card me-2"></i>Proceed to Payment
                        </a>
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