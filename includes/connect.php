<?php
// Include the config file
require_once 'config.php';

try {
    // Create a new PDO connection
    $conn = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Handle the connection error
    echo "Connection failed: " . $e->getMessage();
    exit();


    //$con=new mysqli("localhost","root","","customer");
}