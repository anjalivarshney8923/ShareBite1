<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Donor Dashboard - Sharebite</title>
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
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .sidebar {
            background: #ffffff;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            min-height: calc(100vh - 76px);
        }
        
        .sidebar .nav-link {
            color: #6c757d;
            padding: 1rem 1.5rem;
            border-left: 3px solid transparent;
            transition: all 0.3s ease;
        }
        
        .sidebar .nav-link:hover,
        .sidebar .nav-link.active {
            background: #f8f9fa;
            color: #28a745;
            border-left-color: #28a745;
        }
        
        .main-content {
            padding: 2rem;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin: 1rem;
        }
        
        .stats-card {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 20px rgba(40, 167, 69, 0.3);
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .food-card {
            background: #ffffff;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid #e9ecef;
            transition: transform 0.3s ease;
        }
        
        .food-card:hover {
            transform: translateY(-5px);
        }
        
        .welcome-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-heart me-2"></i>Sharebite
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user me-2"></i>Welcome, Donor
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
            <div class="col-md-3 col-lg-2 sidebar">
                <div class="d-flex flex-column flex-shrink-0 p-3">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="#dashboard" class="nav-link active">
                                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#my-listings" class="nav-link">
                                <i class="fas fa-utensils me-2"></i>My Food Listings
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#requests" class="nav-link">
                                <i class="fas fa-handshake me-2"></i>NGO Requests
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" onclick="showAddFoodForm()" class="nav-link">
                                <i class="fas fa-plus-circle me-2"></i>Add Food Listing
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#profile" class="nav-link">
                                <i class="fas fa-user-cog me-2"></i>Profile
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <!-- Dashboard Section -->
                <div id="dashboard">
                    <div class="welcome-section">
                        <h2>Welcome to Your Donor Dashboard</h2>
                        <p>Manage your food donations and help reduce food waste</p>
                        <div class="mt-3">
                            <button onclick="showAddFoodForm()" class="btn btn-light me-2">
                                <i class="fas fa-plus me-2"></i>Add New Food
                            </button>
                            <a href="#my-listings" class="btn btn-outline-light">
                                <i class="fas fa-eye me-2"></i>View Listings
                            </a>
                        </div>
                    </div>

                    <!-- Statistics -->
                    <div class="row">
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">12</div>
                                <div>Active Listings</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">8</div>
                                <div>Pending Requests</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">45</div>
                                <div>Total Donations</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="stats-card">
                                <div class="stats-number">150+</div>
                                <div>Lives Impacted</div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activity -->
                    <div class="main-content">
                        <h4 class="mb-4">
                            <i class="fas fa-clock me-2"></i>Recent Activity
                        </h4>
                        
                        <div class="food-card">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h5>Fresh Vegetables and Fruits</h5>
                                    <p class="text-muted">
                                        <i class="fas fa-map-marker-alt me-2"></i>Downtown Area, City Center
                                    </p>
                                    <span class="badge bg-success me-2">Available</span>
                                    <small class="text-muted">
                                        <i class="fas fa-calendar me-1"></i>Expires: Tomorrow
                                    </small>
                                </div>
                                <div class="col-md-4 text-end">
                                    <div class="mb-2"><strong>Quantity:</strong> 5 kg</div>
                                    <button class="btn btn-outline-primary btn-sm">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="food-card">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                <h5>Bread and Pastries</h5>
                                    <p class="text-muted">
                                        <i class="fas fa-map-marker-alt me-2"></i>Bakery District, West Side
                                    </p>
                                    <span class="badge bg-warning me-2">Reserved</span>
                                    <small class="text-muted">
                                        <i class="fas fa-calendar me-1"></i>Expires: Today
                                    </small>
                                </div>
                                <div class="col-md-4 text-end">
                                    <div class="mb-2"><strong>Quantity:</strong> 20 pieces</div>
                                    <button class="btn btn-outline-success btn-sm">
                                        <i class="fas fa-edit me-1"></i>Edit
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Food Form Section -->
                <div id="add-food-section" style="display: none;">
                    <div class="main-content">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4>
                                <i class="fas fa-plus-circle me-2"></i>Add New Food Listing
                            </h4>
                            <button onclick="hideAddFoodForm()" class="btn btn-outline-secondary">
                                <i class="fas fa-times me-2"></i>Cancel
                            </button>
                        </div>
                        
                        <form action="addFoodListingProcess.jsp" method="post" enctype="multipart/form-data" id="foodListingForm">
                            <!-- Basic Food Information -->
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <h5 class="mb-0">
                                        <i class="fas fa-utensils me-2"></i>Food Information
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="foodName" class="form-label">Food Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="foodName" name="foodName" 
                                                   placeholder="e.g., Fresh Vegetables, Bread, Canned Goods" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="foodType" class="form-label">Food Type <span class="text-danger">*</span></label>
                                            <select class="form-select" id="foodType" name="foodType" required>
                                                <option value="">Select Food Type</option>
                                                <option value="fresh">Fresh</option>
                                                <option value="canned">Canned</option>
                                                <option value="baked">Baked</option>
                                                <option value="dairy">Dairy</option>
                                                <option value="frozen">Frozen</option>
                                                <option value="packaged">Packaged</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" id="description" name="description" rows="3" 
                                                  placeholder="Describe the food items, ingredients, condition, etc."></textarea>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Quantity and Expiry -->
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <h5 class="mb-0">
                                        <i class="fas fa-weight me-2"></i>Quantity and Expiry
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="quantity" class="form-label">Quantity <span class="text-danger">*</span></label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" 
                                                   min="1" placeholder="Enter quantity" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="quantityUnit" class="form-label">Unit <span class="text-danger">*</span></label>
                                            <select class="form-select" id="quantityUnit" name="quantityUnit" required>
                                                <option value="">Select Unit</option>
                                                <option value="kg">Kilograms (kg)</option>
                                                <option value="lbs">Pounds (lbs)</option>
                                                <option value="pieces">Pieces</option>
                                                <option value="boxes">Boxes</option>
                                                <option value="bags">Bags</option>
                                                <option value="cans">Cans</option>
                                                <option value="liters">Liters</option>
                                                <option value="gallons">Gallons</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="expiryDate" class="form-label">Expiry Date <span class="text-danger">*</span></label>
                                        <input type="date" class="form-control" id="expiryDate" name="expiryDate" required>
                                        <small class="form-text text-muted">Please ensure the expiry date is accurate for food safety</small>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Pickup Information -->
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <h5 class="mb-0">
                                        <i class="fas fa-map-marker-alt me-2"></i>Pickup Information
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="pickupAddress" class="form-label">Pickup Address <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="pickupAddress" name="pickupAddress" 
                                                   placeholder="Street address" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="pickupCity" class="form-label">City <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="pickupCity" name="pickupCity" 
                                                   placeholder="City name" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="pickupState" class="form-label">State <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="pickupState" name="pickupState" 
                                                   placeholder="State name" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="pickupZipCode" class="form-label">ZIP Code <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="pickupZipCode" name="pickupZipCode" 
                                                   placeholder="ZIP code" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pickupInstructions" class="form-label">Pickup Instructions</label>
                                        <textarea class="form-control" id="pickupInstructions" name="pickupInstructions" rows="2" 
                                                  placeholder="Any special instructions for pickup (e.g., call before arrival, specific entrance, etc.)"></textarea>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Image Upload -->
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <h5 class="mb-0">
                                        <i class="fas fa-image me-2"></i>Food Image (Optional)
                                    </h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <input type="file" class="form-control" id="foodImage" name="foodImage" 
                                               accept="image/*" onchange="previewImage(this)">
                                    </div>
                                    <div class="image-preview border rounded p-3 text-center" id="imagePreview" style="min-height: 150px; background-color: #f8f9fa;">
                                        <i class="fas fa-cloud-upload-alt fa-3x text-muted mb-3"></i>
                                        <p class="text-muted">Upload an image to help NGOs better understand the food items</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-success btn-lg px-5">
                                    <i class="fas fa-plus me-2"></i>Add Food Listing
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Show Add Food Form
        function showAddFoodForm() {
            document.getElementById('dashboard').style.display = 'none';
            document.getElementById('add-food-section').style.display = 'block';
            
            // Set minimum date to today
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('expiryDate').min = today;
        }
        
        // Hide Add Food Form
        function hideAddFoodForm() {
            document.getElementById('add-food-section').style.display = 'none';
            document.getElementById('dashboard').style.display = 'block';
            
            // Reset form
            document.getElementById('foodListingForm').reset();
            document.getElementById('imagePreview').innerHTML = `
                <i class="fas fa-cloud-upload-alt fa-3x text-muted mb-3"></i>
                <p class="text-muted">Upload an image to help NGOs better understand the food items</p>
            `;
        }
        
        // Image preview functionality
        function previewImage(input) {
            const preview = document.getElementById('imagePreview');
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    preview.innerHTML = `
                        <img src="${e.target.result}" alt="Food Preview" class="mb-2" style="max-width: 100%; max-height: 200px; border-radius: 8px;">
                        <p class="text-muted">Image preview</p>
                    `;
                };
                
                reader.readAsDataURL(input.files[0]);
            } else {
                preview.innerHTML = `
                    <i class="fas fa-cloud-upload-alt fa-3x text-muted mb-3"></i>
                    <p class="text-muted">Upload an image to help NGOs better understand the food items</p>
                `;
            }
        }
        
        // Form validation
        document.getElementById('foodListingForm').addEventListener('submit', function(e) {
            const expiryDate = document.getElementById('expiryDate').value;
            const today = new Date();
            const selectedDate = new Date(expiryDate);
            
            if (selectedDate <= today) {
                e.preventDefault();
                alert('Please select a future expiry date.');
                return false;
            }
            
            return true;
        });
        
        // Handle success/error messages from URL parameters
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const success = urlParams.get('success');
            const error = urlParams.get('error');
            
            if (success === 'listing_created') {
                alert('Food listing created successfully!');
                // Clean URL
                window.history.replaceState({}, document.title, window.location.pathname);
            } else if (error) {
                let errorMessage = 'An error occurred. Please try again.';
                switch(error) {
                    case 'missing_fields':
                        errorMessage = 'Please fill in all required fields.';
                        break;
                    case 'invalid_expiry':
                        errorMessage = 'Please select a valid future expiry date.';
                        break;
                    case 'creation_failed':
                        errorMessage = 'Failed to create food listing. Please try again.';
                        break;
                }
                alert(errorMessage);
                // Clean URL
                window.history.replaceState({}, document.title, window.location.pathname);
            }
        });
    </script>
</body>
</html>
