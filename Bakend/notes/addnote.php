<?php
include '../connect.php';
$userid = FailterReguset('id');
$title = FailterReguset('title');
$content = FailterReguset('content');
$imagename= imageUpload("file");
if($imagename !="fail"){
    $stmt = $con->prepare("INSERT INTO `notes`( `notes_title`, `notes_content`, `notes_image`,`notes_users`) VALUES (?,?,?,?)");
$stmt->execute(
    array(
       $title, $content, $imagename ,$userid
    )
);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'successful'));
} else {
    echo json_encode(array('status' => "fail"));
}
}else{
    echo json_encode(array('status' => "fail"));
}
