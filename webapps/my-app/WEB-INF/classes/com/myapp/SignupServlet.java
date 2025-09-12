package com.myapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Basic validation
        if (fullName == null || fullName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            
            response.sendRedirect("signup.jsp?error=All fields are required");
            return;
        }
        
        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=Passwords do not match");
            return;
        }
        
        // Check password length
        if (password.length() < 6) {
            response.sendRedirect("signup.jsp?error=Password must be at least 6 characters long");
            return;
        }
        
        // Basic email validation
        if (!email.contains("@") || !email.contains(".")) {
            response.sendRedirect("signup.jsp?error=Please enter a valid email address");
            return;
        }
        
        // In a real application, you would save this to a database
        // For now, we'll redirect to login page with success message
        
        // Redirect to login page with success message
        response.sendRedirect("login.jsp?message=Account created successfully! Please login to continue.");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to signup page
        response.sendRedirect("signup.jsp");
    }
}
