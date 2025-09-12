<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 2.5em;
        }
        .btn {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            transition: transform 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .btn-secondary {
            background: linear-gradient(45deg, #f093fb, #f5576c);
        }
        .welcome-message {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏢 Employee Management</h1>
        <p class="welcome-message">Welcome to our Employee Management System</p>
        
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <p>Welcome back, <c:out value="${sessionScope.user.username}"/>!</p>
                <a href="dashboard" class="btn">Go to Dashboard</a>
                <a href="logout" class="btn btn-secondary">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="signup.jsp" class="btn">Sign Up</a>
                <a href="signin.jsp" class="btn btn-secondary">Sign In</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
