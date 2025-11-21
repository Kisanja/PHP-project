-- this
CREATE TABLE item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(255),
    item_description TEXT,
    price DECIMAL(10, 2),
    product_img VARCHAR(255),
    weight DECIMAL(10, 2)
);

-- this
CREATE TABLE color_img (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(255),
    color_img VARCHAR(255)
);

-- this
CREATE TABLE customer (
    username VARCHAR(255) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    password VARCHAR(255),
    password_hint VARCHAR(255),
    email VARCHAR(255)
);

-- this
CREATE TABLE item_category (
    item_category_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    color_id INT,
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (color_id) REFERENCES color_img(color_id)
);

-- this
CREATE TABLE customer_cart (
    customer_cart_id INT AUTO_INCREMENT PRIMARY KEY,
    selected_size VARCHAR(255),
    quantity INT,
    item_id INT,
    username VARCHAR(255),
    color_id INT,
    FOREIGN KEY (item_id) REFERENCES item(item_id),
    FOREIGN KEY (username) REFERENCES customer(username),
    FOREIGN KEY (color_id) REFERENCES color_img(color_id)
);

-- this
CREATE TABLE total (
    tot_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    item_id INT,
    shipping_total DECIMAL(10, 2),
    total DECIMAL(10, 2),
    sub_total DECIMAL(10, 2),
    FOREIGN KEY (username) REFERENCES customer(username),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- this
CREATE TABLE item_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

-- this
CREATE TABLE orders (
    order_Id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zipcode VARCHAR(255),
    phone_number VARCHAR(255),
    order_notes VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);
