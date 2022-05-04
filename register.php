<?php

if($_SERVER['REQUEST_METHOD'] =='POST'){
    $username=$_POST['username'];
    $name_customer=$_POST['name_customer'];
    $Password_customer=$_POST['Password_customer'];
    $Phone=$_POST['Phone'];
    $Address_customer=$_POST['Address_customer'];


    require_once'config.php';

    $sqli="INSERT INTO customer(id_customer, username, name_customer, poto_customer, email, Password_customer, Phone, Address_customer) 
    VALUES (null,'$username','$name_customer',null,null,'$Password_customer','$Phone','$Address_customer')";

    if(mysqli_query($conn,$sqli))
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