<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $name_catalog=$_POST['name_catalog'];
    $query="INSERT INTO products_catalog(`id_catalog`, `name_catalog`) VALUES (null,'$name_catalog')";

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