package com.employee.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class SigninServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validation
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "Username is required");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
        }
        
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Password is required");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
        }
        
        // Simple demo auth: accept any non-empty credentials
        HttpSession session = request.getSession();
        Map<String, Object> user = new HashMap<>();
        user.put("username", username);
        user.put("email", username + "@example.com");
        session.setAttribute("user", user);

        // Redirect to dashboard
        response.sendRedirect("dashboard");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to signin.jsp
        response.sendRedirect("signin.jsp");
    }
}
