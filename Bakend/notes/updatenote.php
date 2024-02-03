<?php
include '../connect.php';
$noteid = FailterReguset('id');
$title = FailterReguset('title');
$content = FailterReguset('content');
$imagename = FailterReguset('imagename');
if(isset($_FILES['file'])){
    deletimage("../upload",$imagename);
    $imagename=imageUpload('file');
    
}
$stmt = $con->prepare("UPDATE `notes` SET`notes_title`=?,`notes_content`=?,`notes_image`=?   WHERE `notes_id`=?");

$stmt->execute(
    array(
       $title, $content, $imagename ,$noteid
    )
);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'successful'));
} else {
    echo json_encode(array('status' => "fail"));
}