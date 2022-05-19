<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_donhang=$_POST['id'];
    $tinhtrang=$_POST['tinhtrang'];
    $query="UPDATE orders SET Delivery_status='$tinhtrang' WHERE id_order='$id_donhang'";

    if(mysqli_query($conn,$query))
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
?>