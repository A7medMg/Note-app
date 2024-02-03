<?php
include 'connect.php';
$stmt=$con->prepare("INSERT INTO `users`( `username`, `email`) VALUES ('mohamed','mohamed@gmail.com')");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
    echo'succsess';
}else{
    echo'error';
}
?>