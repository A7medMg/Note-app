<?php
include 'connect.php';

$email = FailterReguset('email');
$password = FailterReguset('password');
$stmt = $con->prepare("SELECT * from users WHERE  `password`= ? AND email= ? ");
$stmt->execute(
    array(
       $password,  $email
    )
);
$data=$stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'successful','data'=>$data));
} else {
    echo json_encode(array('status' => "fail"));
}
