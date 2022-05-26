<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id=$_POST['id']; 
    $photo=$_POST['photo'];
}
    $file_name="IMG_anh_admin".rand().".jpg";
    file_put_contents("upload/".$file_name,base64_decode($photo));

    $query="UPDATE admin SET poto_admin ='$file_name' WHERE id_admin='$id'";

    if(mysqli_query($conn,$query)){
    $result["success"]="1";
    $result["message"]="success";
    echo json_encode($result);
    mysqli_close($conn);
} else{
    $result["success"]="0";
    $result["message"]="error";
    echo json_encode($result);
    mysqli_close($conn);
}
    
?>
