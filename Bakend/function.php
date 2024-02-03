<?php
define('MB',1048576);
function FailterReguset($requst){
   return htmlspecialchars(strip_tags($_POST[$requst]));
}

function imageUpload($imageRequst)
{
    global $msgError;
   $imagename   = rand(1,100000). $_FILES[$imageRequst]['name'];
   $imagetmp    =  $_FILES[$imageRequst]['tmp_name'];
   $imagesize   =  $_FILES[$imageRequst]['size'];
   $allowExt    =  array("jpg","png","gif");
   $strToArray  =  explode(".",$imagename);
   $ext         =  end($strToArray);
   $ext         =  strtolower($ext);
   if(!empty($imagename ) && !in_array($ext,$allowExt)){
      $msgError[] =  "Ext" ;
   }
   if($imagesize > 2 * MB ){
      $msgError[] =  "Size" ;
   }
   if(empty($msgError)){
      move_uploaded_file($imagetmp ,"../upload/".$imagename);
      return $imagename;
   }else
    {
       return "fail";
    }
   }
  
function deletimage($dir ,$imagename){
   if(file_exists($dir ."/".$imagename)){
      unlink($dir ."/".$imagename);
   }
}
function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "ahmed" ||  $_SERVER['PHP_AUTH_PW'] != "ahmed12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 
}



?>