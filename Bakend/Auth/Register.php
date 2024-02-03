<?php
include '../connect.php';
$name = FailterReguset('username');
$email = FailterReguset('email');
$password = FailterReguset('password');
$stmt = $con->prepare("INSERT INTO `users`( `username`, `email`, `password`) VALUES (?,?,?)");
$stmt->execute(
    array(
        $name, $email, $password
    )
);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'successful'));
} else {
    echo json_encode(array('status' => "fail"));
}
