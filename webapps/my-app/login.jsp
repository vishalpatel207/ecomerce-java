<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - My App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome Back</h1>
            <p>Please sign in to your account</p>
        </div>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Enter your username">
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required 
                       placeholder="Enter your password">
            </div>
            
            <button type="submit" class="btn">Sign In</button>
        </form>
        
        <div class="link">
            <a href="index.jsp">← Back to Home</a>
        </div>
        <div style="margin-top: 2rem; margin-left: 2.5rem;">
            <a href="signup.jsp" class="btn">Sign Up</a>
            <a href="logout.jsp" class="btn" style="background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);">Logout</a>
        </div>
    </div>
    
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            if (username.length < 3) {
                e.preventDefault();
                alert('Username must be at least 3 characters long');
                return;
            }
            
            if (password.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters long');
                return;
            }
            
            const btn = document.querySelector('.btn');
            btn.textContent = 'Signing In...';
            btn.disabled = true;
        });
    </script>
</body>
</html>

