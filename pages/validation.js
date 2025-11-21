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