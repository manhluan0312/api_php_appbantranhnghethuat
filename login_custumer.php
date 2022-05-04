<?php
 include ('config.php');
if($_SERVER['REQUEST_METHOD']=='POST'){
    $username= $_POST['username'];
    $Password_customer = $_POST['Password_customer'];
    
    $Sql_Query = "SELECT * FROM `customer` WHERE username='$username' AND Password_customer='$Password_customer'";
   
    $result=array();
    $check =(mysqli_query($conn,$Sql_Query));

  while($row=mysqli_fetch_assoc($check)){
      $result=$row;
  }
    if(!empty($result)){

        //lay thong tin sau dang nhap
        $result["success"]="1";
        $result["message"]="success";
        echo json_encode($result);
        mysqli_close($conn);
    }
    else 
    {
        $result["success"]="0";
        $result["message"]="error";
        echo json_encode($result);
        mysqli_close($conn);
    }

}
?>