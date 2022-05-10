<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_catalog=$_POST['id_catalog'];
    $name_catalog=$_POST['name_catalog'];
    $query="UPDATE products_catalog SET name_catalog='$name_catalog' WHERE id_catalog='$id_catalog'";

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