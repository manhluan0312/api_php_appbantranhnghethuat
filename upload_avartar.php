<?php
require "config.php";
// if($_SERVER['REQUEST_METHOD']=='POST'){

    $id_customer=$_POST['id_customer']; 
    $photo=$_POST['photo'];

    $file_path = "upload/$id_customer.png";

    $query="UPDATE customer SET poto_customer='$photo=' WHERE id_customer='id_customer'";

    if(mysqli_query($conn,$query)){
    if(file_put_contents())
{
    $result["success"]="1";
    $result["message"]="success";
    echo json_encode($result);
    mysqli_close($conn);
} else
{
    $result["success"]="0";
    $result["message"]="error";
    echo json_encode($result);
    mysqli_close($conn);
}
    }
    
 }
?>
