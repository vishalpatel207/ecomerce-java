<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("loggedIn") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) userSession.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - My App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="nav">
        <div class="nav-container">
            <a href="index.jsp" class="nav-brand">My App</a>
            <div class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="welcome.jsp">Dashboard</a>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="welcome-container">
        <div class="message success">
            <h1>Welcome, <%= username %>! 🎉</h1>
            <p>You have successfully logged in to your account.</p>
        </div>
        
        <h2>Dashboard</h2>
        <p>This is your personal dashboard. You can access various features from here.</p>
        
        <div style="margin-top: 2rem;">
            <a href="index.jsp" class="btn">Go to Home</a>
            <a href="logout.jsp" class="btn" style="background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);">Logout</a>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const message = document.querySelector('.message.success');
            message.style.animation = 'fadeInUp 0.8s ease-out';
        });
    </script>
</body>
</html>

