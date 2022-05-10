<?php

if($_SERVER['REQUEST_METHOD']=='POST'){
    $id=$_POST['id']; 
    $username=$_POST['username'];
    $name_customer=$_POST['name_customer'];
    $Phone=$_POST['Phone'];
    $Address_customer=$_POST['Address_customer'];
    $email=$_POST['email'];
}
    require "config.php";

    $query="UPDATE customer SET username ='$username',name_customer='$name_customer',
    email='$email',Phone='$Phone',Address_customer='$Address_customer' WHERE id_customer='$id'";
   //$result=array();
    
if(mysqli_query($conn,$query)){
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
?>
