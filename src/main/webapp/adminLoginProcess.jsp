<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.net.bean.UserBean" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="java.util.*" %>

<%
// Get form parameters
String email = request.getParameter("email");
String password = request.getParameter("password");

// Validate input
if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
    response.sendRedirect("adminLogin.jsp?error=empty_fields");
    return;
}

// Hardcoded admin login
if ("admin@1".equals(email.trim()) && "123".equals(password.trim())) {
    // Set session and redirect to admin dashboard
    session.setAttribute("userType", "admin");
    session.setAttribute("email", email.trim());
    response.sendRedirect("adminDashboard.jsp");
    return;
}

// If not hardcoded admin, show error
response.sendRedirect("adminLogin.jsp?error=invalid");
return;
%>