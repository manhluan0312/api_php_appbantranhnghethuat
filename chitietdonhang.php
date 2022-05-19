<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $madonhang= $_POST['madonhang'];
}
$query="SELECT products.poto_product, products.name_product,order_details.Price,order_details.Amount 
      FROM order_details  INNER JOIN products ON products.id_product=order_details.id_product 
     WHERE order_details.id_order='$madonhang'";

$data=mysqli_query($conn,$query);
$result=array();

while($row=mysqli_fetch_assoc($data)){
    $result[]=($row);
}

    //lay thong tin sau dang nhap
    echo json_encode($result);
    mysqli_close($conn);
?>