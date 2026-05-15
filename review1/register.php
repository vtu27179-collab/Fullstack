<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include "config.php";

$success = "";

if(isset($_POST['submit'])){

    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $membership = $_POST['membership_type'];

    $sql = "INSERT INTO users (name,email,password,membership_type)
            VALUES ('$name','$email','$password','$membership')";

    if($conn->query($sql) === TRUE){
        $success = "Registered Successfully!";
    } else {
        $success = "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<h2>Register</h2>

<?php
if($success != ""){
    echo "<p style='color:green;'>$success</p>";
    echo "<br>";
    echo "<a href='login.php'><button>Go to Login</button></a>";
}
?>

<form method="POST">

    Name:
    <input type="text" name="mamitha" required>

    Email:
    <input type="email" name="vtu25796@veltech.edu.in" required>

    Password:
    <input type="password" name="12345" required>

    Select Plan:
    <select name="membership_type">
        <option value="Basic">Basic</option>
        <option value="Premium">Premium</option>
        <option value="Gold">Gold</option>
    </select>

    <button type="submit" name="submit">Register</button>

</form>

<br>
<a href="login.php">Already have an account? Login</a>

</div>

</body>
</html>
