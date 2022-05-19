<?php
require "config.php";

$query="SELECT customer.name_customer,customer.Phone,orders.* 
FROM orders JOIN customer ON orders.id_customer=customer.id_customer
ORDER BY id_order DESC";//sap xep ma don hang giam dan

$data=mysqli_query($conn,$query);
$result=array();

while($row=mysqli_fetch_assoc($data)){
    $result[]=($row);
}

    //lay thong tin sau dang nhap
    echo json_encode($result);
    mysqli_close($conn);

?>