package com.myapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Basic validation
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=Username and password are required");
            return;
        }
        
        if (isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("fullName", getFullName(username));
            
            // Redirect to home page with success message
            response.sendRedirect("index.jsp?message=Welcome back, " + username + "!");
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password. Please try again.");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect("login.jsp");
    }
    
    private boolean isValidUser(String username, String password) {
        // In a real application, you would check against a database
        // For demo purposes, we'll use some sample credentials
        return ("admin".equals(username) && "password123".equals(password)) ||
               ("user".equals(username) && "user123".equals(password)) ||
               ("demo".equals(username) && "demo123".equals(password)) ||
               ("test".equals(username) && "test123".equals(password));
    }
    
    private String getFullName(String username) {
        // In a real application, you would get this from a database
        switch (username) {
            case "admin":
                return "Administrator";
            case "user":
                return "Regular User";
            case "demo":
                return "Demo User";
            case "test":
                return "Test User";
            default:
                return username;
        }
    }
}

