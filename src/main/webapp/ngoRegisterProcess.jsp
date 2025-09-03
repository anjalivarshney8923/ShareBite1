<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.net.bean.UserBean" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="java.util.*" %>

<%
// Get form parameters
String organizationName = request.getParameter("organizationName");
String organizationType = request.getParameter("organizationType");
String registrationNumber = request.getParameter("registrationNumber");
String mission = request.getParameter("mission");
String contactPerson = request.getParameter("contactPerson");
String contactTitle = request.getParameter("contactTitle");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String website = request.getParameter("website");
String password = request.getParameter("password");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zipCode = request.getParameter("zipCode");
String serviceArea = request.getParameter("serviceArea");

// Validate required fields
if (organizationName == null || organizationType == null || contactPerson == null || 
    email == null || phone == null || password == null || 
    address == null || city == null || state == null || zipCode == null) {
    response.sendRedirect("ngoRegister.jsp?error=missing_fields");
    return;
}

// Check if email already exists
if (UserDAO.isEmailExists(email.trim())) {
    response.sendRedirect("ngoRegister.jsp?error=email_exists");
    return;
}

// Create UserBean
UserBean userBean = new UserBean();
userBean.setPassword(password.trim());
userBean.setName(contactPerson.trim());
userBean.setEmail(email.trim());
userBean.setPhone(phone.trim());
userBean.setAddress(address.trim());
userBean.setCity(city.trim());
userBean.setState(state.trim());
userBean.setZipCode(zipCode.trim());
userBean.setUserType("ngo");
userBean.setOrganizationName(organizationName.trim());
userBean.setVerificationStatus("pending"); // NGOs require admin verification
userBean.setActive(true);

// Attempt registration
int registrationStatus = UserDAO.register(userBean);

if (registrationStatus > 0) {
    // Registration successful
    response.sendRedirect("ngoLogin.jsp?success=registration_pending");
} else {
    // Registration failed
    response.sendRedirect("ngoRegister.jsp?error=registration_failed");
}
%>
