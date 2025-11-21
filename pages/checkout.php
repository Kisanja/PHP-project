<?php
  include '../includes/functions.php';

  $item_id = $_GET['item_id'];
  $item_name = $_GET['item_name'];
  $item_price = $_GET['price'];
  $product_img = $_GET['product_img'];
  $color_param = $_GET['color'];
  $size_param = $_GET['size'];
  $customer_cart_id = $_GET['customer_cart_id'];

  $colors = getColorImages();
  $sizes = ["XS", "S", "M", "L", "XL", "XXL", "XXXL"];

  if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['form_id'] == 'form1') {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $city = $_POST["city"];
    $state = $_POST["state"];
    $zipcode = $_POST["zipcode"];
    $phone_number = $_POST["phone_number"];
    $order_note = $_POST["order_note"];
    $card_holder_name = $_POST["card_holder_name"];
    $card_number = $_POST["card_number"];
    $expiry_date = $_POST["expiry_date"];
    $cvv = $_POST["cvv"];
    
    $order = [
      'first_name' => $first_name,
      'last_name' => $last_name,
      'email' => $email,
      'address' => $address,
      'city' => $city,
      'state' => $state,
      'zipcode' => $zipcode,
      'phone_number' => $phone_number,
      'order_notes' => $order_note,
      'card_holder_name' => $card_holder_name,
      'card_number' => $card_number,
      'expiry_date' => $expiry_date,
      'cvv' => $cvv,
      'item_id' => $item_id
    ];

    createOrder($order);

    echo "<script>window.location.href = 'home.php';</script>";
    exit;
  }

  if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['form_id'] == 'form2') {
    if (isset($_POST['update'])) {
      $selectedSize = $_POST['type'];
      $selectedColor = $_POST['color'];

      $selectedColorId = null;

      foreach ($colors as $color) {
        if (strtolower($color['color']) === strtolower($selectedColor)) {
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

      // Update the customer cart
      updateCustomerCart($cart, $customer_cart_id);

      header("Location: checkout.php?item_id=$item_id&item_name=$item_name&price=$item_price&product_img=$product_img&color=$selectedColor&size=$selectedSize&customer_cart_id=$customer_cart_id");
      exit;

    } elseif (isset($_POST['delete'])) {
      deleteCustomerCart($customer_cart_id);
      header("Location: product.php?item_id=$item_id");
    }
  }

?>

<!DOCTYPE html>
<html>

<head>
  <title>Checkout Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="new.css">
</head>

<body>
  <div class="div1">
    <div class="div2">
      <div class="div3">
        <div class="div4">
          <div class="div5">
            <h2 class="h2-1">My BAG</h2>
          </div>
          <form class="form1" method="POST" id="form1" onsubmit="return validateForm()">
            <input type="hidden" name="form_id" value="form1">
            <div>
              <h2 class="h2-2">Billing Details</h2>
              <div class="div6">
                <input type="text" name="first_name" placeholder="First Name" id="first_name" required
                  class="input1" />
                <input type="text" name="last_name" placeholder="Last Name" id="last_name" required
                  class="input1" />
                <input type="email" name="email" placeholder="Email address" id="email" required
                  class="input1" />
                <input type="text" name="address" placeholder="Street address" id="address" required
                  class="input1" />
                <input type="text" name="city" placeholder="City" id="city" required 
                  class="input1" />
                <input type="text" name="state" name="state" placeholder="State" id="state" required
                  class="input1" />
                <input type="number" placeholder="Zip Code" name="zipcode" id="zipcode" required
                  class="input1" />
                <input type="number" name="phone_number" placeholder="Phone Number" id="phone_number" required
                  class="input1" />
              </div>
              <textarea name="order_note" placeholder="Order Notes"
                class="textarea"></textarea>
            </div>

            <script>
              function validateForm() {
                  var firstName = document.getElementById('first_name').value;
                  var lastName = document.getElementById('last_name').value;
                  var email = document.getElementById('email').value;
                  var address = document.getElementById('address').value;
                  var city = document.getElementById('city').value;
                  var state = document.getElementById('state').value;
                  var zipcode = document.getElementById('zipcode').value;
                  var phoneNumber = document.getElementById('phone_number').value;

                  var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                  if (firstName == "" || lastName == "" || email == "" || address == "" || city == "" || state == "" || zipcode == "" || phoneNumber == "") {
                    alert("All fields must be filled out");
                    return false;
                  } else if (!emailPattern.test(email)) {
                    alert("Invalid email address");
                    return false;
                  } else if (isNaN(zipcode) || zipcode.length !== 5) {
                    alert("Invalid zip code");
                    return false;
                  } else if (isNaN(phoneNumber) || phoneNumber.length !== 10) {
                    alert("Invalid phone number");
                    return false;
                  }
                  return true;
                }
                
            </script>

            <div class="div7">
              <h2 class="h2-3">Payment method</h2>
              <div class="div8">
                <div class="div9">
                  <input type="radio" name="payment" class="input2" id="card" checked />
                  <label for="card" class="label1">
                    <img src="https://readymadeui.com/images/visa.webp" class="img1" alt="card1" />
                    <img src="https://readymadeui.com/images/american-express.webp" class="img1" alt="card2" />
                    <img src="https://readymadeui.com/images/master.webp" class="img1" alt="card3" />
                  </label>
                </div>
                <div class="div9">
                  <input type="radio" name="payment" class="input2" id="paypal" />
                  <label for="paypal" class="label1">
                    <img src="https://readymadeui.com/images/paypal.webp" class="img2" alt="paypalCard" />
                  </label>
                </div>
              </div>
              <div class="div10">
                <input type="text" name="card_holder_name" placeholder="Cardholder's Name" required
                  class="input3" />
                <div class="div11">
                  <svg xmlns="http://www.w3.org/2000/svg" class="svg1" viewBox="0 0 291.764 291.764">
                    <path fill="#2394bc"
                      d="m119.259 100.23-14.643 91.122h23.405l14.634-91.122h-23.396zm70.598 37.118c-8.179-4.039-13.193-6.765-13.193-10.896.1-3.756 4.24-7.604 13.485-7.604 7.604-.191 13.193 1.596 17.433 3.374l2.124.948 3.182-19.065c-4.623-1.787-11.953-3.756-21.007-3.756-23.113 0-39.388 12.017-39.489 29.204-.191 12.683 11.652 19.721 20.515 23.943 9.054 4.331 12.136 7.139 12.136 10.987-.1 5.908-7.321 8.634-14.059 8.634-9.336 0-14.351-1.404-21.964-4.696l-3.082-1.404-3.273 19.813c5.498 2.444 15.609 4.595 26.104 4.705 24.563 0 40.546-11.835 40.747-30.152.08-10.048-6.165-17.744-19.659-24.035zm83.034-36.836h-18.108c-5.58 0-9.82 1.605-12.236 7.331l-34.766 83.509h24.563l6.765-18.08h27.481l3.51 18.153h21.664l-18.873-90.913zm-26.97 54.514c.474.046 9.428-29.514 9.428-29.514l7.13 29.514h-16.558zM85.059 100.23l-22.931 61.909-2.498-12.209c-4.24-14.087-17.533-29.395-32.368-36.999l20.998 78.33h24.764l36.799-91.021H85.059v-.01z"
                      data-original="#2394bc" />
                    <path fill="#efc75e"
                      d="M51.916 111.982c-1.787-6.948-7.486-11.634-15.226-11.734H.374L0 101.934c28.329 6.984 52.107 28.474 59.821 48.688l-7.905-38.64z"
                      data-original="#efc75e" />
                  </svg>
                  <input type="number" name="card_number" placeholder="Card Number" required
                    class="input4" />
                </div>
                <div class="div12">
                  <input type="number" name="expiry_date" placeholder="EXP." required
                    class="input5" />
                  <input type="number" name="cvv" placeholder="CVV"
                    class="input5" />
                </div>
                <div class="div13">
                  <input id="remember-me" name="remember-me" type="checkbox" required
                    class="input6" />
                  <label for="remember-me" class="label2">
                    I accept the <a href="javascript:void(0);"
                      class="a1">Terms and
                      Conditions</a>
                  </label>
                </div>
              </div>
            </div>
            <div class="div14">
              <button type="button" onclick="window.history.back();"
                class="button1">Back</button>
              <button type="submit"
                class="button2" onsubmit="return validateForm()">Confirm Rs. <?php echo $item_price; ?></button>
            </div>
          </form>
        </div>
        <div class="div15">
          <div class="div16">
            <div class="div17">
              <h2 class="h2-4">Order Summary</h2>
              <div class="div18">
                <div class="div19">
                  <div class="div20">
                    <div class="div21">
                      <img src='<?php echo $product_img; ?>' class="img3" />
                    </div>
                  </div>
                  <div>
                    <h3 class="h3-1"><?php echo $item_name; ?></h3>
                    <form class="" method="POST" action="" id="form2">
                      <input type="hidden" name="form_id" value="form2">
                      <ul class="ul-1">
                        <li class="li1">Size <span class="span1">
                            <?php
                              foreach ($sizes as $size) {
                                $isChecked = ($size_param == $size) ? 'checked' : '';
                                echo '
                                  <label class="label3">
                                    <input type="radio" name="type" value="'.$size.'" class="peer" '.$isChecked.' />
                                    <p
                                      class="peer-checked:bg-black peer-checked:text-white rounded-lg border border-black px-2 py-1 font-bold">
                                      '.$size.'</p>
                                  </label>';
                              }
                            ?>
                          </span>
                        </li>
                        <li class="li1">Quantity <span class="span2">1</span>
                        </li>
                        <li class="li1">Color
                          <span class="span3">
                            <?php
                              echo '<select name="color" class="name1">';

                              foreach ($colors as $color) {
                                $isSelected = (strtolower($color_param) == $color["color"]) ? 'selected' : '';
                                echo '
                                <option value="'.$color["color"].'" '.$isSelected.' title="'.ucwords($color['color']).'" data-color="'.ucwords($color['color']).'">
                                  '.ucwords($color['color']).'
                                </option>';
                              }

                              echo '</select>';
                            ?>
                          </span>
                        </li>
                        <li class="li1">Price <span class="span2">Rs. <?php echo $item_price; ?></span></li>
                      </ul>
                      <div class="div22">
                        <button name="update" class="update">Update</button>
                        <button name="delete" class="delete">Delete</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="div23">
              <h4 class="h4-1">Price <span
                  class="span5">Rs. <?php echo $item_price; ?></span></h4>
              <h4 class="h4-1">Discount <span
                  class="span5">Rs.0.00</span></h4>
              <h4 class="h4-1">Shipping <span
                  class="span5">Rs.0.00</span></h4>
              <hr class="hr1">
              <h4 class="h4-1">Total <span
                  class="span5">Rs. <?php echo $item_price; ?></span></h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    
  </script>
</body>

</html>