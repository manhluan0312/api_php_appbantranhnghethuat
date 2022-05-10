<?php

if($_SERVER['REQUEST_METHOD']=='POST'){
    $id=$_POST['id']; 
    $username=$_POST['username'];
    $name=$_POST['name'];
    $Phone=$_POST['Phone'];
    $Address=$_POST['Address'];
    $email=$_POST['email'];
}
    require "config.php";

    $query="UPDATE admin  SET username ='$username',name_admin='$name',
    email='$email',Phone='$Phone',Address='$Address' WHERE id_admin='$id'";
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