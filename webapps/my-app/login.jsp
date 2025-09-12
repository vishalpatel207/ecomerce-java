<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ShopEasy</title>
    <link rel="stylesheet" href="css/style.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Critical CSS for login page */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body.login-page {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            min-height: 100vh !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            padding: 20px !important;
        }
        
        .form-container {
            background: white !important;
            padding: 2rem !important;
            border-radius: 15px !important;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1) !important;
            width: 100% !important;
            max-width: 400px !important;
            animation: fadeInUp 0.6s ease-out;
        }
        
        .header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .header h1 {
            color: #4a5568;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            font-weight: 300;
        }
        
        .header p {
            color: #718096;
            font-size: 1rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4a5568;
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f7fafc;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 14px;
            width: 100%;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        
        .link {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .message {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 1rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .message.error {
            background: #fed7d7;
            color: #742a2a;
            border: 1px solid #feb2b2;
        }
        
        .message.success {
            background: #f0fff4;
            color: #22543d;
            border: 1px solid #9ae6b4;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @media (max-width: 480px) {
            .form-container {
                padding: 1.5rem !important;
            }
            
            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body class="login-page">
    <div class="form-container">
        <div class="header">
            <h1><i class="fas fa-shopping-bag"></i> ShopEasy</h1>
            <p>Welcome back! Please sign in to your account</p>
        </div>
        
        <%
            String error = request.getParameter("error");
            String message = request.getParameter("message");
            
            if (error != null) {
        %>
        <div class="message error">
            <i class="fas fa-exclamation-triangle"></i> <%= error %>
        </div>
        <%
            }
            
            if (message != null) {
        %>
        <div class="message success">
            <i class="fas fa-check-circle"></i> <%= message %>
        </div>
        <%
            }
        %>
        
        <form action="login" method="post">
            <div class="form-group">
                <label for="username"><i class="fas fa-user"></i> Username</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Enter your username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
            </div>
            
            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i> Password</label>
                <input type="password" id="password" name="password" required 
                       placeholder="Enter your password">
            </div>
            
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i> Sign In
            </button>
        </form>
        
        <div style="margin-top: 20px; padding: 15px; background: #f8f9fa; border-radius: 8px; font-size: 14px;">
            <strong>Demo Credentials:</strong><br>
            Username: <code>admin</code> | Password: <code>password123</code><br>
            Username: <code>user</code> | Password: <code>user123</code><br>
            Username: <code>demo</code> | Password: <code>demo123</code>
        </div>
        
        <div class="link">
            <a href="index.jsp"><i class="fas fa-home"></i> Back to Home</a>
        </div>
        <div class="link">
            <a href="signup.jsp"><i class="fas fa-user-plus"></i> Don't have an account? Sign Up</a>
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

