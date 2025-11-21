<?php
// include 'includes/connect.php';
// include 'includes/functions.php';

// $products = getProducts();

// echo '<h1>Products</h1>';
// echo '<ul>';
// foreach ($products as $product) {
//     echo '<li>' . $product['name'] . '</li>';
// }

// Determine the requested page
$page = isset($_GET['page']) ? $_GET['page'] : 'home';

// Load the appropriate page
switch ($page) {
    case 'home':
        include 'pages/home.php';
        break;
    case 'product':
        include 'pages/product.php';
        break;
    case 'checkout':
        include 'pages/checkout.php';
        break;
    default:
        include 'pages/home.php';
}