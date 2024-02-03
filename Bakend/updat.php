<?php
include 'connect.php';
$stmt=$con->prepare("UPDATE `users` SET `username`='Ail',`email`='Ali@gmail.com' WHERE id=3");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
    echo'succsess';
}else{
    echo'error';
}
?>