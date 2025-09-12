<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Invalidate the session
    session.invalidate();
    
    // Redirect to home page with logout message
    response.sendRedirect("index.jsp?message=You have been successfully logged out. Thank you for shopping with ShopEasy!");
%>