package com.employee.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class DashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("signin.jsp");
            return;
        }
        
        String searchName = request.getParameter("searchName");
        String department = request.getParameter("department");
        String status = request.getParameter("status");

        List<Map<String, Object>> employees = new ArrayList<>();
        employees.add(createEmployee(101, "Aman Sharma", "aman.sharma@example.com", "IT", "Software Engineer", 75000, "Active"));
        employees.add(createEmployee(102, "Neha Verma", "neha.verma@example.com", "HR", "HR Manager", 68000, "Active"));
        employees.add(createEmployee(103, "Rahul Gupta", "rahul.gupta@example.com", "Finance", "Accountant", 62000, "Inactive"));
        employees.add(createEmployee(104, "Priya Singh", "priya.singh@example.com", "Marketing", "Marketing Executive", 59000, "Active"));
        employees.add(createEmployee(105, "Vikram Yadav", "vikram.yadav@example.com", "Operations", "Operations Lead", 71000, "Inactive"));
    
        List<Map<String, Object>> filtered = new ArrayList<>();
        for (Map<String, Object> emp : employees) {
            boolean match = true;

            if (searchName != null && !searchName.trim().isEmpty()) {
                String name = String.valueOf(emp.get("name"));
                match &= name.toLowerCase(Locale.ROOT).contains(searchName.trim().toLowerCase(Locale.ROOT));
            }

            if (department != null && !department.trim().isEmpty()) {
                String dep = String.valueOf(emp.get("department"));
                match &= dep.equalsIgnoreCase(department.trim());
            }

            if (status != null && !status.trim().isEmpty()) {
                String sts = String.valueOf(emp.get("status"));
                match &= sts.equalsIgnoreCase(status.trim());
            }

            if (match) {
                filtered.add(emp);
            }
        }

        boolean anyFilter = (searchName != null && !searchName.trim().isEmpty())
                || (department != null && !department.trim().isEmpty())
                || (status != null && !status.trim().isEmpty());

        List<Map<String, Object>> result = anyFilter ? filtered : employees;
        
        request.setAttribute("employees", result);
        
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    private Map<String, Object> createEmployee(int id, String name, String email,
                                               String department, String position,
                                               int salary, String status) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("email", email);
        map.put("department", department);
        map.put("position", position);
        map.put("salary", salary);
        map.put("status", status);
        return map;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
