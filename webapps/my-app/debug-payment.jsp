<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Debug payment parameters
String paymentId = request.getParameter("payment_id");
String method = request.getParameter("method");
String amount = request.getParameter("amount");
String clearCart = request.getParameter("clear_cart");

out.println("<h3>Payment Debug Info:</h3>");
out.println("<p>Payment ID: " + paymentId + "</p>");
out.println("<p>Method: " + method + "</p>");
out.println("<p>Amount: " + amount + "</p>");
out.println("<p>Clear Cart: " + clearCart + "</p>");

// Session info
String username = (String) session.getAttribute("username");
Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
out.println("<p>Username: " + username + "</p>");
out.println("<p>Is Logged In: " + isLoggedIn + "</p>");

// Cart info
Object cart = session.getAttribute("cart");
out.println("<p>Cart: " + cart + "</p>");
%>
<a href="payment-success.jsp?payment_id=TEST123&method=card&amount=1000.00&clear_cart=true">Test Success Page</a>