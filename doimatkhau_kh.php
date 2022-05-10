<?php
require "config.php";
if($_SERVER['REQUEST_METHOD'] =='POST'){
    $Password_old=$_POST['Passwor_old'];
    $Password_new=$_POST['Password_new'];
    $id=$_POST['id'];

   $query="SELECT * FROM `customer` WHERE `Password_customer`='$Password_old' AND id_customer='$id'";
   $row=mysqli_query($conn,$query);
   $count=mysqli_num_rows($row);
 
   if($count>0)//mat khau dung
   {
    $query_update="UPDATE `customer` SET Password_customer='$Password_new' WHERE id_customer='$id'";
    

    if(mysqli_query($conn,$query_update)){
        $result["success"]="1";
        $result["message"]="success";
        echo json_encode($result);
        mysqli_close($conn);
  // echo 1;
    }
    else{
        //echo 0;
        $result["success"]="0";
        $result["message"]="error";
        echo json_encode($result);
        mysqli_close($conn); 
    }
}
   else//sai mk cu 
   {
    //echo 3;
    $result["success"]="3";
    $result["message"]="error_ten mat khau cu ko dung";
    echo json_encode($result);
    mysqli_close($conn);
   }
}

?> 