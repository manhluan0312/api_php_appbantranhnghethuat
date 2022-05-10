<?php
  include ('config.php');
  
  if($_SERVER['REQUEST_METHOD']=='POST'){
      $json=$_POST['json']
      $data=json_decode($json,true);
      foreach ($data as $value){
        $id_order= $value['id_order']; 
        $id_product=$value['id_product']; 
        $Amount=$value['Amount']; 
        $Price=$value['Price']; 
      }
      $query="INSERT INTO `order details`(`id_order_detail`, `id_product`, `id_order`, `Amount`, `Price`)
       VALUES (null,'$id_order',' $id_product','$Amount','$Price')";
        $data=mysqli_query($conn,$query);
        if(data){
           echo "1";
        }
        else{
           echo"0";
        }
  }
  ?>