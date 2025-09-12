<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World JSP - My App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="nav">
        <div class="nav-container">
            <a href="index.jsp" class="nav-brand">My App</a>
            <div class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="login.jsp">Login</a>
            </div>
        </div>
    </nav>
    
    <div class="welcome-container">
        <h1>Hello, World!</h1>
        <p>Welcome to your JSP application with beautiful CSS styling!</p>
        <p>This is a modern, responsive web application built with JSP and external CSS.</p>
        
        <a href="login.jsp" class="btn">Go to Login</a>
        <a href="examples/" class="btn" style="background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);">View Examples</a>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('.btn');
            
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px) scale(1.02)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
        });
    </script>
</body>
</html>