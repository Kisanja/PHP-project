<!DOCTYPE html>
<html>

<head>
  <title>Product Page</title>
  <link rel="stylesheet" href="product.css">
</head>

<body>
  <?php
  include '../includes/connect.php';
  include '../includes/functions.php'; 
  

  $item_id = $_GET['item_id'];
  $item = getItem($item_id);
  $images = getItemImages($item_id);
  $colors = getColorImages();
  $sizes = ["XS", "S", "M", "L", "XL", "XXL", "XXXL"];

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $selectedSize = $_POST['selectedSize'];
    $selectedColor = $_POST['selectedColor'];

    $selectedColorId = null;

    foreach ($colors as $color) {
        if ($color['color'] === strtolower($selectedColor)) {
            $selectedColorId = $color['color_id'];
            break;
        }
    }

    if ($selectedColorId === null) {
        // Handle the case where the selected color is not found in the $colors array
        die('Selected color not found');
    }

    // Prepare the cart data
    $cart = [
      'selected_size' => $selectedSize,
      'quantity' => 1,
      'item_id' => $item_id,
      'username' => "testuser1", 
      'color_id' => $selectedColorId
    ];

    // Add the item to the cart
    $customer_cart_id = addCustomerCart($cart);

    // Redirect to checkout.php with the selected size and color as URL parameters
    header('Location: checkout.php?item_name=' . urlencode($item["item_name"]) . '&price=' . urlencode($item["price"]) . '&item_id=' . urlencode($item["item_id"]) . '&product_img=' . urlencode($item["product_img"]) . '&size=' . urlencode($selectedSize) . '&color=' . urlencode($selectedColor) . '&customer_cart_id=' . urlencode($customer_cart_id));
    exit;

  }

  ?>
  <div class="container">
    <section class="product-info">
      <div class="product-info-left">
        <h1><?php echo $item['item_name']; ?></h1>
        <p class="price">Rs. <?php echo $item['price']; ?>/=</p><br>
        <form method="POST" id="form1">
          <div class="size-chart">
            <h2>Size Chart</h2>
            <?php
            foreach ($sizes as $size) {
              echo '
                <input type="radio" class="sizeclass" name="selectedSize" id="'.$size.'" value="'.$size.'" checked>
                <label for="'.$size.'">'.$size.'</label>';
            }
            ?>
          </div>
          <br>
          <div class="color-chart">
            <h2>Color Chart</h2>
            <?php
            foreach ($colors as $color) {
              echo '
              <input type="radio" class="colorclass" name="selectedColor" id="'.ucwords($color['color']).'" value="'.ucwords($color['color']).'" checked>
              <label for="'.ucwords($color['color']).'">
                <img src="'.$color['color_img'].'" alt="'.ucwords($color['color']).'"/>
              </label>';
            }
            ?>
          </div>
            <br><br><br>
          <div>
            <button class="button1" type="submit">Add to Bag</button>
          </div>
        </form>

        <ul>
          <li>Free shipping island wide</li>
          <li>Cancel within 4 days</li>
        </ul>
      </div>

      <div class="product-info-right">
        <div>
          <div>
            <img id="preview" class="bigimage"
              src="<?php echo $images[0]['image_url']; ?>"
              alt="" />
          </div>
        </div>
        <br>
        <!-- thumbnails -->
        <div>
          <div class="div1">
            <?php
            foreach ($images as $image) {
              echo '
                <button type="button" class="thumbnail">
                  <img src="'.$image['image_url'].'" alt="" />
                </button>';
            }
            ?>
          </div>
        </div>
      </div>
    </section>
  </div>

  <script>
    document.querySelectorAll('.thumbnail').forEach(thumbnail => {
      thumbnail.addEventListener('click', () => {
        const imgSrc = thumbnail.querySelector('img').src;
        document.getElementById('preview').src = imgSrc;
      });
    });
  </script>
</body>

</html>
