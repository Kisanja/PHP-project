<?php
    // Include the connect.php file
    require_once 'connect.php';

    // Function to retrieve all items from the database
    function getItems() {
        global $conn;
        $query = "SELECT * FROM item";
        $result = $conn->query($query);
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    // Function to retrieve a single item from the database
    function getItem($item_id) {
        global $conn;
        $query = "SELECT * FROM item WHERE item_id = :item_id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':item_id', $item_id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Function to retrieve all images for a single item from the database
    function getItemImages($item_id) {
        global $conn;
        $query = "SELECT * FROM item_images WHERE item_id = :item_id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':item_id', $item_id);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Function to retrieve all color images from the database
    function getColorImages() {
        global $conn;
        $query = "SELECT * FROM color_img";
        $result = $conn->query($query);
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    // Create a new order
    function createOrder($order) {
        global $conn;
        $query = "INSERT INTO orders (item_id, first_name, last_name, email, address, city, state, zipcode, phone_number, order_notes) VALUES (:item_id, :first_name, :last_name, :email, :address, :city, :state, :zipcode, :phone_number, :order_notes)";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':item_id', $order['item_id']);
        $stmt->bindParam(':first_name', $order['first_name']);
        $stmt->bindParam(':last_name', $order['last_name']);
        $stmt->bindParam(':email', $order['email']);
        $stmt->bindParam(':address', $order['address']);
        $stmt->bindParam(':city', $order['city']);
        $stmt->bindParam(':state', $order['state']);
        $stmt->bindParam(':zipcode', $order['zipcode']);
        $stmt->bindParam(':phone_number', $order['phone_number']);
        $stmt->bindParam(':order_notes', $order['order_notes']);
        $stmt->execute();
    }

    // add to cart
    function addCustomerCart($cart) {
        global $conn;
        $query = "INSERT INTO customer_cart (selected_size, quantity, item_id, username, color_id) VALUES (:selected_size, :quantity, :item_id, :username, :color_id)";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':selected_size', $cart['selected_size']);
        $stmt->bindParam(':quantity', $cart['quantity']);
        $stmt->bindParam(':item_id', $cart['item_id']);
        $stmt->bindParam(':username', $cart['username']);
        $stmt->bindParam(':color_id', $cart['color_id']);
        $stmt->execute();

        // Return the ID of the last inserted row
        return $conn->lastInsertId('customer_cart_id');
    }

    // update cart
    function updateCustomerCart($cart, $customer_cart_id) {
        global $conn;
        $query = "UPDATE customer_cart SET selected_size = :selected_size, quantity = :quantity, item_id = :item_id, username = :username, color_id = :color_id WHERE customer_cart_id = :customer_cart_id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':selected_size', $cart['selected_size']);
        $stmt->bindParam(':quantity', $cart['quantity']);
        $stmt->bindParam(':item_id', $cart['item_id']);
        $stmt->bindParam(':username', $cart['username']);
        $stmt->bindParam(':color_id', $cart['color_id']);
        $stmt->bindParam(':customer_cart_id', $customer_cart_id);
        $stmt->execute();
    }

    // delete cart item by id
    function deleteCustomerCart($customer_cart_id) {
        global $conn;
        $query = "DELETE FROM customer_cart WHERE customer_cart_id = :customer_cart_id";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':customer_cart_id', $customer_cart_id);
        $stmt->execute();
    }
?>