<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_customer=$_POST['id_customer']; 
    $photo=$_POST['photo'];
}
    $file_name="IMG".rand().".jpg";
    file_put_contents("upload/".$file_name,base64_decode($photo));//sẽ ghi nội dung vào file truyền vào

    $query="UPDATE customer SET poto_customer='$file_name' WHERE id_customer='$id_customer'";

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
