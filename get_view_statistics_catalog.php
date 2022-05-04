<?php
  include ('config.php');
$query = "SELECT a.name_catalog as 'Tên danh mục',
COUNT(b.id_product) as'Số lượng sản phẩm',
MAX(b.price_product) as'Giá cao nhất', 
MIN(b.price_product) as 'Giá thấp nhất', 
AVG(b.price_product) as 'Giá trung bình' 
FROM products_catalog a 
JOIN products b ON a.id_catalog=b.id_catalog
GROUP BY a.name_catalog";
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