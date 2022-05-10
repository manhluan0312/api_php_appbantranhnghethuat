<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id=$_POST['id']; 
}
$query="SELECT * FROM orders WHERE id_customer='".$id."'AND `Delivery_status`='Đang xử lý' ORDER BY id_order DESC";//sap xep ma don hang giam dan

$data=mysqli_query($conn,$query);
$result=array();

while($row=mysqli_fetch_assoc($data))//chay tung dong du lieu
{
    $chitietdonhang="SELECT products.poto_product, products.name_product,order_details.Price,order_details.Amount 
     FROM order_details  INNER JOIN products ON products.id_product=order_details.id_product 
    WHERE order_details.id_order='".$row['id_order']."'";//phai co id don hang phia tren 
  $data1=mysqli_query($conn,$chitietdonhang);
 // echo  $chitietdonhang;
    $chitiet=array();
    while($row1=mysqli_fetch_assoc($data1)){
        $chitiet[]=$row1;
    }
$row['chitiet']=$chitiet;
$result[]=($row);
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
?>