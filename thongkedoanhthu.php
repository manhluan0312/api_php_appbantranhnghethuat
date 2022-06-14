<?php
  include ('config.php');
$query = "SELECT COUNT(id_order) AS 'Số đơn hàng',SUM(Total_money) AS 'Tổng doanh thu' FROM `orders`";
$data =(mysqli_query($conn,$query));
$result=array();
while($row=mysqli_fetch_assoc($data))//lay du lieu tung dong
{
    $result[]=($row);
}
if(!empty($result)){
echo json_encode($result);
}
?>