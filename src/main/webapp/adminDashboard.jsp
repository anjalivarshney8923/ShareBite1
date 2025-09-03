<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.net.bean.UserBean" %>
<%@ page import="com.net.bean.FoodRequestBean" %>
<%@ page import="com.net.DAO.UserDAO" %>
<%@ page import="com.net.DAO.FoodRequestDAO" %>
<%@ page import="java.util.*" %>

<%
// Get pending NGO verifications
List<UserBean> pendingNgos = UserDAO.getUsersByType("ngo");
List<UserBean> pendingVerifications = new ArrayList<>();
if (pendingNgos != null) {
    for (UserBean user : pendingNgos) {
        if ("pending".equals(user.getVerificationStatus())) {
            pendingVerifications.add(user);
        }
    }
}

// Get pending food requests
List<FoodRequestBean> pendingRequests = FoodRequestDAO.getPendingRequests();

// Get system statistics
List<UserBean> allUsers = UserDAO.getAllUsers();
int totalUsers = allUsers != null ? allUsers.size() : 0;
int totalDonors = 0;
int totalNgos = 0;

if (allUsers != null) {
    for (UserBean user : allUsers) {
        if ("donor".equals(user.getUserType())) {
            totalDonors++;
        } else if ("ngo".equals(user.getUserType())) {
            totalNgos++;
        }
    }
}
// Removed NGO verification logic
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Sharebite</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
        }
        
        .navbar {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .sidebar {
            background: white;
            min-height: calc(100vh - 76px);
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            padding: 0;
        }
        
        .sidebar .nav-link {
            color: #6c757d;
            padding: 1rem 1.5rem;
            border-radius: 0;
            transition: all 0.3s ease;
        }
        
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
        }
        
        .sidebar .nav-link i {
            width: 20px;
            margin-right: 10px;
        }
        
        .main-content {
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            margin: 1rem;
        }
        
        .welcome-section {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
        }
        
        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }
        
        .user-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border-left: 4px solid #6c757d;
        }
        
        .request-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border-left: 4px solid #28a745;
        }
        
        .btn-verify {
            background: linear-gradient(45deg, #28a745, #20c997);
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-verify:hover {
            background: linear-gradient(45deg, #218838, #1ea085);
            transform: translateY(-2px);
            color: white;
        }
        
        .btn-reject {
            background: linear-gradient(45deg, #dc3545, #c82333);
            border: none;
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            color: white;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-reject:hover {
            background: linear-gradient(45deg, #c82333, #bd2130);
            transform: translateY(-2px);
            color: white;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-shield-alt me-2"></i>Sharebite Admin Portal
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user-shield me-2"></i>Administrator
                </span>
                <a class="nav-link" href="logout.jsp">
                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2">
                <div class="sidebar">
                    <nav class="nav flex-column">
                        <a class="nav-link active" href="#dashboard" onclick="showSection('dashboard')">
                            <i class="fas fa-tachometer-alt"></i>Dashboard
                        </a>
                        <a class="nav-link" href="#requests" onclick="showSection('requests')">
                            <i class="fas fa-list"></i>Food Requests
                        </a>
                        <a class="nav-link" href="#users" onclick="showSection('users')">
                            <i class="fas fa-users"></i>User Management
                        </a>
                        <a class="nav-link" href="#system" onclick="showSection('system')">
                            <i class="fas fa-cogs"></i>System Settings
                        </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <!-- Dashboard Section -->
                <div id="dashboard" class="main-content">
                    <div class="welcome-section">
                        <h2><i class="fas fa-shield-alt me-3"></i>Admin Dashboard</h2>
                        <p class="mb-0">Monitor and manage the Sharebite Food Rescue platform</p>
                    </div>

                    <!-- Statistics -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number"><%= totalUsers %></div>
                                <div>Total Users</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number"><%= totalDonors %></div>
                                <div>Food Donors</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number"><%= totalNgos %></div>
                                <div>NGOs</div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <i class="fas fa-user-check me-2"></i>NGO Verifications
                                    </h5>
                                    <p class="card-text">
                                    </p>
                                    <a href="#verifications" class="btn btn-primary" onclick="showSection('verifications')">
                                        <i class="fas fa-eye me-2"></i>Review Verifications
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <i class="fas fa-list me-2"></i>Food Requests
                                    </h5>
                                    <p class="card-text">
                                        <%= pendingRequests != null ? pendingRequests.size() : 0 %> food requests are pending approval.
                                    </p>
                                    <a href="#requests" class="btn btn-primary" onclick="showSection('requests')">
                                        <i class="fas fa-eye me-2"></i>Review Requests
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Food Requests Section -->
                <div id="requests" class="main-content" style="display: none;">
                    <h3 class="mb-4">
                        <i class="fas fa-list me-2"></i>Food Requests
                    </h3>
                    
                    <% if (pendingRequests != null && !pendingRequests.isEmpty()) { %>
                        <% for (FoodRequestBean request1 : pendingRequests) { %>
                            <div class="request-card">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <h5>Request #<%= request1.getId() %></h5>
                                        <p class="text-muted mb-2">
                                            <strong>NGO:</strong> <%= request1.getNgoId() %><br>
                                            <strong>Pickup Date:</strong> <%= request1.getPickupDate() %> at <%= request1.getPickupTime() %><br>
                                            <strong>Status:</strong> Pending
                                        </p>
                                        <% if (request1.getRequestMessage() != null && !request1.getRequestMessage().isEmpty()) { %>
                                            <p class="mb-2"><%= request1.getRequestMessage() %></p>
                                        <% } %>
                                    </div>
                                    <div class="col-md-4 text-end">
                                        <button class="btn btn-verify me-2" onclick="updateRequestStatus('<%= request1.getId() %>', 'approved')">
                                            <i class="fas fa-check me-2"></i>Approve
                                        </button>
                                        <button class="btn btn-reject" onclick="updateRequestStatus('<%= request1.getId() %>', 'rejected')">
                                            <i class="fas fa-times me-2"></i>Reject
                                        </button>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    <% } else { %>
                        <div class="text-center py-4">
                            <i class="fas fa-list fa-3x text-muted mb-3"></i>
                            <p class="text-muted">No pending food requests.</p>
                        </div>
                    <% } %>
                </div>

                <!-- User Management Section -->
                <div id="users" class="main-content" style="display: none;">
                    <h3 class="mb-4">
                        <i class="fas fa-users me-2"></i>User Management
                    </h3>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">User Statistics</h5>
                                    <ul class="list-unstyled">
                                        <li><strong>Total Users:</strong> <%= totalUsers %></li>
                                        <li><strong>Food Donors:</strong> <%= totalDonors %></li>
                                        <li><strong>NGOs:</strong> <%= totalNgos %></li>
                                        <li><strong>Verified NGOs:</strong> 0</li>
                                        <li><strong>Pending Verifications:</strong> <%= pendingVerifications.size() %></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Quick Actions</h5>
                                    <button class="btn btn-primary w-100 mb-2">
                                        <i class="fas fa-download me-2"></i>Export User Data
                                    </button>
                                    <button class="btn btn-info w-100 mb-2">
                                        <i class="fas fa-chart-bar me-2"></i>View Analytics
                                    </button>
                                    <button class="btn btn-warning w-100">
                                        <i class="fas fa-cog me-2"></i>User Settings
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- System Settings Section -->
                <div id="system" class="main-content" style="display: none;">
                    <h3 class="mb-4">
                        <i class="fas fa-cogs me-2"></i>System Settings
                    </h3>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Platform Settings</h5>
                                    <div class="mb-3">
                                        <label class="form-label">Auto-verify Donors</label>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="autoVerifyDonors" checked>
                                            <label class="form-check-label" for="autoVerifyDonors">Enabled</label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Require NGO Verification</label>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="requireNgoVerification" checked>
                                            <label class="form-check-label" for="requireNgoVerification">Enabled</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary">Save Settings</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">System Information</h5>
                                    <ul class="list-unstyled">
                                        <li><strong>Platform Version:</strong> 1.0.0</li>
                                        <li><strong>Database:</strong> MySQL 8.0</li>
                                        <li><strong>Server:</strong> Apache Tomcat 9.0</li>
                                        <li><strong>Last Backup:</strong> <%= new java.util.Date() %></li>
                                    </ul>
                                    <button class="btn btn-success w-100 mb-2">
                                        <i class="fas fa-database me-2"></i>Backup Database
                                    </button>
                                    <button class="btn btn-warning w-100">
                                        <i class="fas fa-tools me-2"></i>System Maintenance
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showSection(sectionName) {
            // Hide all sections
            document.querySelectorAll('.main-content').forEach(section => {
                section.style.display = 'none';
            });
            
            // Show selected section
            document.getElementById(sectionName).style.display = 'block';
            
            // Update active nav link
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });
            event.target.classList.add('active');
        }
        
        function verifyNgo(ngoId, status) {
            if (confirm('Are you sure you want to ' + status + ' this NGO?')) {
                // Here you would typically make an AJAX call to update the status
                // For now, we'll just show a message
                alert('NGO verification status updated to: ' + status);
                
                // Refresh the page to show updated verifications
                location.reload();
            }
        }
        
        function updateRequestStatus(requestId, status) {
            if (confirm('Are you sure you want to ' + status + ' this request?')) {
                // Here you would typically make an AJAX call to update the status
                // For now, we'll just show a message
                alert('Request status updated to: ' + status);
                
                // Refresh the page to show updated requests
                location.reload();
            }
        }
    </script>
</body>
</html>
