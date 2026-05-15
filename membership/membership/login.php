<?php
session_start();
include "config.php";

if(isset($_POST['login'])){

    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users 
            WHERE email='$email' 
            AND password='$password'";

    $result = $conn->query($sql);

    if($result->num_rows > 0){

        $row = $result->fetch_assoc();

        $_SESSION['name'] = $row['name'];
        $_SESSION['membership'] = $row['membership_type'];

        header("Location: dashboard.php");
        exit();

    } else {
        $error = "Invalid Email or Password!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<h2>Login</h2>

<?php
if(isset($error)){
    echo "<p style='color:red;'>$error</p>";
}
?>

<form method="POST">

    Email:
    <input type="email" name="email" required>

    Password:
    <input type="password" name="password" required>

    <button type="submit" name="login">Login</button>

</form>

<br>
<a href="register.php">New User? Register Here</a>

</div>

</body>
</html>