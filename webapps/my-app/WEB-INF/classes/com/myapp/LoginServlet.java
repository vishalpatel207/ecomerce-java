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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("loggedIn", true);
            
            response.sendRedirect("welcome.jsp");
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<title>Login Error</title>");
            out.println("<link rel='stylesheet' href='css/style.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<div class='message error'>");
            out.println("Invalid username or password. Please try again.");
            out.println("</div>");
            out.println("<div class='header'>");
            out.println("<h1>Login Failed</h1>");
            out.println("<p>Please check your credentials and try again.</p>");
            out.println("</div>");
            out.println("<a href='login.jsp' class='btn'>Try Again</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    private boolean isValidUser(String username, String password) {
        return "admin".equals(username) && "password123".equals(password) ||
               "user".equals(username) && "user123".equals(password);
    }
}

