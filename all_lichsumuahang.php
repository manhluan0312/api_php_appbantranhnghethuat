<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id=$_POST['id']; 
}
$query="SELECT * FROM orders WHERE id_customer='".$id."' ORDER BY id_order DESC";//sap xep ma don hang giam dan

$data=mysqli_query($conn,$query);
$result=array();

while($row=mysqli_fetch_assoc($data)){
    $result[]=($row);
}

    echo json_encode($result);
    mysqli_close($conn);
?>