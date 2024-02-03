<?php
include '../connect.php';
$noteid = FailterReguset('id');
$imagename= FailterReguset("imagename");

$stmt = $con->prepare("DELETE FROM `notes` WHERE notes_id=?");
$stmt->execute(
    array(
       $noteid
    )
);
$count = $stmt->rowCount();
if ($count > 0) {
    deletimage("../upload",$imagename);
    echo json_encode(array('status' => 'successful'));
} else {
    echo json_encode(array('status' => "fail"));
}