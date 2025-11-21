<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* Navigation Links */
        .nav-link {
            text-decoration: none;
            font-size: 1rem;
            color: #374151; /* Dark gray */
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: #1d4ed8; /* Blue hover */
        }
        .active-link {
            font-weight: bold;
            color: #1d4ed8; /* Active blue */
        }

        /* Buttons */
        .button-link {
            text-decoration: none;
            font-size: 0.9rem;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .login-button {
            color: #374151;
            border: 1px solid #d1d5db;
            background-color: #f9fafb;
        }
        .login-button:hover {
            background-color: #e5e7eb;
            color: #1f2937;
        }
        .primary-button {
            color: white;
            background-color: #1d4ed8; /* Blue */
        }
        .primary-button:hover {
            background-color: #2563eb; /* Darker blue */
        }

        /* Mobile Menu Toggle */
        #mobile-menu-toggle {
            display: none;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            #mobile-menu-toggle {
                display: block;
            }
            nav > div {
                display: none;
            }
            #mobile-menu {
                display: flex;
            }
        }
</style>


</head>
<body>
<header style="margin-bottom: 1.5rem; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); background-color: #ffffff;">
    <nav style="padding: 1rem 2rem; max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
        <!-- Logo Section -->
        <a href="home.php" style="display: flex; align-items: center; text-decoration: none;">
            <img src="../assets/images/logo.png" style="height: 40px; margin-right: 1rem;" alt="ShopCart Logo" />
            <span style="font-size: 1.5rem; font-weight: bold; color: #1f2937;">ShopCart</span>
        </a>

        <!-- Navigation Links -->
        <div style="display: flex; align-items: center; gap: 1.5rem;">
            <ul style="list-style: none; margin: 0; padding: 0; display: flex; gap: 1rem; align-items: center;">
                <li><a href="home.php" class="nav-link active-link">Home</a></li>
                <li><a href="#" class="nav-link">Categories</a></li>
                <li><a href="#" class="nav-link">Deals</a></li>
                <li><a href="#" class="nav-link">About</a></li>
                <li><a href="#" class="nav-link">Contact</a></li>
            </ul>

            <!-- Buttons -->
            <div style="display: flex; gap: 1rem;">
                <a href="#" class="button-link login-button">Log in</a>
                <a href="#" class="button-link primary-button">Get started</a>
            </div>
        </div>

        <!-- Mobile Menu Button -->
        <button id="mobile-menu-toggle" style="display: none; background: none; border: none; cursor: pointer;">
            <svg style="width: 24px; height: 24px;" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path d="M3 6h14M3 10h14M3 14h14"></path>
            </svg>
        </button>
    </nav>

    <!-- Mobile Navigation (Hidden by Default) -->
    <div id="mobile-menu" style="display: none; padding: 1rem 2rem; background-color: #f9fafb;">
        <ul style="list-style: none; margin: 0; padding: 0; display: flex; flex-direction: column; gap: 1rem;">
            <li><a href="home.php" class="nav-link active-link">Home</a></li>
            <li><a href="#" class="nav-link">Categories</a></li>
            <li><a href="#" class="nav-link">Deals</a></li>
            <li><a href="#" class="nav-link">About</a></li>
            <li><a href="#" class="nav-link">Contact</a></li>
        </ul>
    </div>
</header>


</body>
</html>