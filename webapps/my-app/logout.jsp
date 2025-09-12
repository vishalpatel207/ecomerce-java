<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession != null) {
        userSession.invalidate();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out - My App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="welcome-container">
        <div class="message success">
            <h1>Successfully Logged Out! </h1>
            <p>You have been logged out of your account.</p>
        </div>
        
        <p>Thank you for using our application. We hope to see you again soon!</p>
        
        <div style="margin-top: 2rem;">
            <a href="index.jsp" class="btn">Go to Home</a>
            <a href="login.jsp" class="btn" style="background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);">Login Again</a>
        </div>
    </div>
    
    <script>
        setTimeout(function() {
            window.location.href = 'index.jsp';
        }, 3000);
    </script>
</body>
</html>

