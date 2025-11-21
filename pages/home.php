<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="home.css">
</head>

<body>

  <div class="container">
    <!-- filters -->
    <div class="filter-container">
      <select class="filter-select">
        <option value="" disabled selected>Gender</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="unisex">Unisex</option>
        <option value="kids">Kids</option>
      </select>
      <select class="filter-select">
        <option value="" disabled selected>Brands</option>
        <option value="nike">Nike</option>
        <option value="polo">Polo</option>
        <option value="adidas">Adidas</option>
        <option value="vogue">Vogue</option>
        <option value="prada">Prada</option>
        <option value="other">Other</option>
      </select>
      <select class="filter-select">
        <option value="" disabled selected>Fit</option>
        <option value="loose">Loose</option>
        <option value="oversized">Oversized</option>
        <option value="slim">Slim</option>
        <option value="standard">Standard</option>
        <option value="tight">Tight</option>
      </select>
      <select class="filter-select">
        <option value="" disabled selected>All Filter</option>
        <option value="Low_High">Low to High</option>
        <option value="High_Low">High to Low</option>
      </select>
    </div>
    <!-- items -->
    <div class="product-container">
      <?php
      include '../includes/connect.php';
      include '../includes/functions.php';

      $items = getItems();

      foreach ($items as $item) {
        echo '<div class="product">
                <a class="link1" href="product.php?item_id=' . $item['item_id'] . '">
                  <div class="product-image">
                    <img src="' . $item['product_img'] . '" alt="product" />
                  </div>
                  <div class="product-details">
                    <h2 class="product-name">' . $item['item_name'] . '</h2>
                    <p class="product-price">Rs.' . $item['price'] . '/=</p>
                    <p class="product-sold">500+ bought in past month</p>
                    <div class="product-rating">
                      <svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                        <path d="M5.643.722a.737.737 0 0 1 1.214.275l1.605 3.292a.737.737 0 0 0 .663.397l3.57.45c.417.052.584.572.273.854l-2.586 2.524a.737.737 0 0 0-.214.738l.61 3.546c.143.831-.768 1.457-1.523 1.038l-3.187-1.675a.737.737 0 0 0-.724 0l-3.187 1.675c-.755.397-1.666-.207-1.523-1.038l.61-3.546a.737.737 0 0 0-.214-.738L.844 5.49a.737.737 0 0 0 .273-.854l3.57-.45a.737.737 0 0 0 .663-.397L5.643.997a.737.737 0 0 1 1.214-.275z" />
                      </svg>
                      <svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                        <path d="M5.643.722a.737.737 0 0 1 1.214.275l1.605 3.292a.737.737 0 0 0 .663.397l3.57.45c.417.052.584.572.273.854l-2.586 2.524a.737.737 0 0 0-.214.738l.61 3.546c.143.831-.768 1.457-1.523 1.038l-3.187-1.675a.737.737 0 0 0-.724 0l-3.187 1.675c-.755.397-1.666-.207-1.523-1.038l.61-3.546a.737.737 0 0 0-.214-.738L.844 5.49a.737.737 0 0 0 .273-.854l3.57-.45a.737.737 0 0 0 .663-.397L5.643.997a.737.737 0 0 1 1.214-.275z" />
                      </svg>
                      <svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                        <path d="M5.643.722a.737.737 0 0 1 1.214.275l1.605 3.292a.737.737 0 0 0 .663.397l3.57.45c.417.052.584.572.273.854l-2.586 2.524a.737.737 0 0 0-.214.738l.61 3.546c.143.831-.768 1.457-1.523 1.038l-3.187-1.675a.737.737 0 0 0-.724 0l-3.187 1.675c-.755.397-1.666-.207-1.523-1.038l.61-3.546a.737.737 0 0 0-.214-.738L.844 5.49a.737.737 0 0 0 .273-.854l3.57-.45a.737.737 0 0 0 .663-.397L5.643.997a.737.737 0 0 1 1.214-.275z" />
                      </svg>
                      <svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                        <path d="M5.643.722a.737.737 0 0 1 1.214.275l1.605 3.292a.737.737 0 0 0 .663.397l3.57.45c.417.052.584.572.273.854l-2.586 2.524a.737.737 0 0 0-.214.738l.61 3.546c.143.831-.768 1.457-1.523 1.038l-3.187-1.675a.737.737 0 0 0-.724 0l-3.187 1.675c-.755.397-1.666-.207-1.523-1.038l.61-3.546a.737.737 0 0 0-.214-.738L.844 5.49a.737.737 0 0 0 .273-.854l3.57-.45a.737.737 0 0 0 .663-.397L5.643.997a.737.737 0 0 1 1.214-.275z" />
                      </svg>
                    </div>
                    <p class="product-delivery">Delivery, Mon May 02</p>
                  </div>
                </a>
              </div>';
      }
      ?>
    </div>
  </div>

</body>

</html>
