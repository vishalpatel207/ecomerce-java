package com.employee.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

public class SignupServlet extends HttpServlet {
    private static final Set<String> registeredUsers = new HashSet<>();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validation
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "Username is required");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Password is required");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (password.length() < 6) {
            request.setAttribute("error", "Password must be at least 6 characters long");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        if (registeredUsers.contains(username)) {
            request.setAttribute("error", "Username already exists. Please choose a different username.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        // Register user (in-memory)
        registeredUsers.add(username);

        HttpSession session = request.getSession();
        Map<String, Object> user = new HashMap<>();
        user.put("username", username);
        user.put("email", email);
        session.setAttribute("user", user);

        response.sendRedirect("dashboard");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }
}
