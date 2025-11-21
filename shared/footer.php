<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* Footer Links */
        .footer-link {
            text-decoration: none;
            font-size: 1rem;
            color: #374151; /* Gray */
            transition: color 0.3s ease;
        }
        .footer-link:hover {
            color: #1d4ed8; /* Blue on hover */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            footer div {
                flex-direction: column;
                text-align: center;
                gap: 1.5rem;
            }
            footer ul {
                justify-content: center;
            }
        }
    </style>

</head>
<body>
    <footer style="background-color: #f9fafb; padding: 2rem 1rem; margin-top: 2rem; border-top: 1px solid #e5e7eb;">
        <div style="max-width: 1200px; margin: 0 auto; display: flex; flex-direction: column; gap: 2rem;">
            <!-- Top Section -->
            <div style="display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center;">
                <!-- Logo and Title -->
                <div style="display: flex; align-items: center; gap: 1rem;">
                    <img src="../assets/images/logo.png" style="height: 40px;" alt="ShopCart Logo" />
                    <span style="font-size: 1.5rem; font-weight: bold; color: #1f2937;">ShopCart</span>
                </div>

                <!-- Navigation Links -->
                <ul style="list-style: none; display: flex; gap: 1.5rem; margin: 0; padding: 0; flex-wrap: wrap;">
                    <li><a href="#" class="footer-link">About</a></li>
                    <li><a href="#" class="footer-link">Privacy Policy</a></li>
                    <li><a href="#" class="footer-link">Licensing</a></li>
                    <li><a href="#" class="footer-link">Contact</a></li>
                </ul>
            </div>

            <!-- Divider -->
            <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

            <!-- Bottom Section -->
            <div style="text-align: center;">
                <p style="font-size: 0.9rem; color: #6b7280;">
                    © 2024 <a href="home.php" style="color: #1d4ed8; text-decoration: none;">ShopCart™</a>. All Rights Reserved.
                </p>
            </div>
        </div>
    </footer>

</body>
</html>