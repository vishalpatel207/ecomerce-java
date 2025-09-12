<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> // jsp java code compile
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Dashboard - Employee Management</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background: #fafafa;
                }

                .header {
                    background: #3f51b5;
                    color: #fff;
                    padding: 16px;
                }

                .header-content {
                    max-width: 1000px;
                    margin: 0 auto;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .header h1 {
                    margin: 0;
                    font-size: 20px;
                }

                .logout-btn {
                    color: #fff;
                    text-decoration: none;
                    border: 1px solid rgba(255, 255, 255, .6);
                    padding: 6px 10px;
                    border-radius: 4px;
                }

                .container {
                    max-width: 1000px;
                    margin: 20px auto;
                    padding: 0 12px;
                }

                .filter-section {
                    background: #fff;
                    padding: 12px;
                    border: 1px solid #e5e5e5;
                    border-radius: 6px;
                    margin-bottom: 16px;
                }

                .filter-form {
                    display: flex;
                    gap: 10px;
                    flex-wrap: wrap;
                    align-items: flex-end;
                }

                .form-group {
                    min-width: 200px;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 4px;
                    color: #444;
                }

                .form-group input,
                .form-group select {
                    width: 100%;
                    padding: 8px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                }

                .btn {
                    background: #3f51b5;
                    color: #fff;
                    border: 0;
                    padding: 8px 14px;
                    border-radius: 4px;
                    cursor: pointer;
                }

                .btn-secondary {
                    background: #607d8b;
                }

                .table-container {
                    background: #fff;
                    border: 1px solid #e5e5e5;
                    border-radius: 6px;
                    overflow: hidden;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th,
                td {
                    padding: 10px;
                    border-bottom: 1px solid #eee;
                    text-align: left;
                }

                th {
                    background: #f1f1f1;
                }

                .status-badge {
                    padding: 2px 8px;
                    border-radius: 10px;
                    font-size: 12px;
                }

                .status-active {
                    background: #d4edda;
                    color: #155724;
                }

                .status-inactive {
                    background: #f8d7da;
                    color: #721c24;
                }
                

                .no-data {
                    text-align: center;
                    padding: 24px;
                    color: #666;
                    font-style: italic;
                }

                .stats {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                    gap: 12px;
                    margin-bottom: 16px;
                }

                .stat-card {
                    background: #fff;
                    padding: 12px;
                    border: 1px solid #e5e5e5;
                    border-radius: 6px;
                    text-align: center;
                }

                .stat-number {
                    font-size: 22px;
                    font-weight: bold;
                    color: #3f51b5;
                }

                .stat-label {
                    color: #666;
                    margin-top: 4px;
                }
            </style>
        </head>

        <body>


            <div class="header">
                <div class="header-content">
                    <h1> Employee Dashboard</h1>
                    <div class="user-info">
                        <a href="logout" class="logout-btn">Logout</a>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="stats">
                    <div class="stat-card">
                        <div class="stat-number">
                            <c:choose>
                                <c:when test="${not empty requestScope.employees}">
                                    <c:set var="totalEmployees" value="${requestScope.employees.size()}" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="totalEmployees" value="0" />
                                </c:otherwise>
                            </c:choose>
                            <c:out value="${totalEmployees}" />
                        </div>
                        <div class="stat-label">Total Employees</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">
                            <c:set var="activeCount" value="0" />
                            <c:forEach var="emp" items="${requestScope.employees}">
                                <c:if test="${emp.status == 'Active'}">
                                    <c:set var="activeCount" value="${activeCount + 1}" />
                                </c:if>
                            </c:forEach>
                            <c:out value="${activeCount}" />
                        </div>
                        <div class="stat-label">Active Employees</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">
                            <c:set var="inactiveCount" value="0" />
                            <c:forEach var="emp" items="${requestScope.employees}">
                                <c:if test="${emp.status == 'Inactive'}">
                                    <c:set var="inactiveCount" value="${inactiveCount + 1}" />
                                </c:if>
                            </c:forEach>
                            <c:out value="${inactiveCount}" />
                        </div>
                        <div class="stat-label">Inactive Employees</div>
                    </div>
                </div>

                <div class="filter-section">
                    <h3> Filter Employees</h3>
                    <form action="dashboard" method="get" class="filter-form">
                        <div class="form-group">
                            <label for="searchName">Search by Name:</label>
                            <input type="text" id="searchName" name="searchName"
                                value="<c:out value='${param.searchName}'/>" placeholder="Enter employee name">
                        </div>
                        <div class="form-group">
                            <label for="department">Department:</label>
                            <select id="department" name="department">
                                <option value="">All Departments</option>
                             // request parmeter hold  <option value="IT" <c:if test="${param.department == 'IT'}">selected</c:if>>IT
                                </option>
                                <option value="HR" <c:if test="${param.department == 'HR'}">selected</c:if>>HR
                                </option>
                                <option value="Finance" <c:if test="${param.department == 'Finance'}">selected
                                    </c:if>>Finance</option>
                                <option value="Marketing" <c:if test="${param.department == 'Marketing'}">selected
                                    </c:if>>Marketing</option>
                                <option value="Operations" <c:if test="${param.department == 'Operations'}">selected
                                    </c:if>>Operations</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="status">Status:</label>
                            <select id="status" name="status">
                                <option value="">All Status</option>
                                <option value="Active" <c:if test="${param.status == 'Active'}">selected</c:if>
                                    >Active</option>
                                <option value="Inactive" <c:if test="${param.status == 'Inactive'}">selected</c:if>
                                    >Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn">Filter</button>
                            <a href="dashboard" class="btn btn-secondary">Clear</a>
                        </div>
                    </form>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>S.No.</th>
                                <th>Employee ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th>Position</th>
                                <th>Salary</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty requestScope.employees}">
                                    <c:set var="serialNumber" value="1" />
                                    <c:forEach var="employee" items="${requestScope.employees}" varStatus="status">
                                        <c:set var="serialNumber" value="${status.index + 1}" />
                                        <tr>
                                            <td>
                                                <c:out value="${serialNumber}" />
                                            </td>
                                            <td>
                                                <c:out value="${employee.id}" />
                                            </td>
                                            <td>
                                                <c:out value="${employee.name}" />
                                            </td>
                                            <td>
                                                <c:out value="${employee.email}" />
                                            </td>
                                            <td>
                                                <c:out value="${employee.department}" />
                                            </td>
                                            <td>
                                                <c:out value="${employee.position}" />
                                            </td>
                                            <td>$
                                                <c:out value="${employee.salary}" />
                                            </td>
                                            <td>
                                                <span class="status-badge 
                                            <c:choose>
                                                <c:when test=" ${employee.status=='Active' }">status-active
                                </c:when>
                                <c:otherwise>status-inactive</c:otherwise>
                            </c:choose>">
                            <c:out value="${employee.status}" />
                            </span>
                            </td>
                            </tr>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="8" class="no-data">
                                        <c:choose>
                                            <c:when
                                                test="${not empty param.searchName or not empty param.department or not empty param.status}">
                                                No employees found matching your filter criteria.
                                            </c:when>
                                            <c:otherwise>
                                                No employees found. Please add some employees to get started.
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>


            </div>
        </body>

        </html>