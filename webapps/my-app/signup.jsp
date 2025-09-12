<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - My App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Your Account</h1>
            <p>Please fill in the details to sign up</p>
        </div>
        
        <form action="signup" method="post">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required 
                       placeholder="Enter your full name">
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required 
                       placeholder="Enter your email">
            </div>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Choose a username">
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required 
                       placeholder="Choose a password">
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required 
                       placeholder="Confirm your password">
            </div>
            
            <button type="submit" class="btn">Sign Up</button>
        </form>
        
        <div class="link">
            <a href="login.jsp">Already have an account? Sign In</a>
        </div>
    </div>
    
    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const fullName = document.getElementById('fullName').value;
            const email = document.getElementById('email').value;
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (fullName.length < 3) {
                e.preventDefault();
                alert('Full Name must be at least 3 characters long');
                return;
            }

            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address');
                return;
            }

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

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match');
                return;
            }

            const btn = document.querySelector('.btn');
            btn.textContent = 'Signing Up...';
            btn.disabled = true;
        });
    </script>
</body>
</html>
