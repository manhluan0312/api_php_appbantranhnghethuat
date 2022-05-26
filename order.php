<?php
  include ('config.php');
  
  if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_customer= $_POST['id_customer'];
    $Payments = $_POST['Payments'];
    $Note= $_POST['Note'];//thuoc tinh ko can bat buoc
    $Delivery_address = $_POST['Delivery_address'];
    $Total_money = $_POST['Total_money'];
  }
$queryOrder ="INSERT INTO orders(`id_order`, `id_customer`, `Payments`, `Order_date`, `Delivery_address`, `Note`, `Total_money`, `Delivery_status`) 
VALUES (null,'".$id_customer."','$Payments',NOW(),'$Delivery_address','$Note','$Total_money','Đang chờ xử lý')";
 

 if(mysqli_query($conn,$queryOrder)){
   $iddonhanglast =$conn->insert_id;//lay id vua insert
   echo $iddonhanglast;
 }
        ?>