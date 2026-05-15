<?php
session_start();
include "config.php";

if(!isset($_SESSION['membership'])){
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

<h2>Welcome <?php echo $_SESSION['name']; ?></h2>

<p>Current Plan: <b><?php echo $_SESSION['membership']; ?></b></p>

<hr>

<?php
$membership = $_SESSION['membership'];

if($membership == "Basic"){
    echo "<p>Basic Content Only</p>";
}
elseif($membership == "Premium"){
    echo "<p>Basic + Premium Content</p>";
}
else{
    echo "<p>All Content Access (Gold)</p>";
}
?>

<br><br>

<!-- ✅ ADD LINKS HERE (BOTTOM OF CONTAINER) -->

<a href="logout.php">Logout</a>

</div>

</body>
</html>
