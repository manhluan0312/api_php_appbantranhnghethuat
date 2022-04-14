<?php
require "config.php";
if($_SERVER['REQUEST_METHOD']=='POST'){
    $name_catalog = $_POST['name_catalog'];
$query="SELECT * FROM products_catalog WHERE name_catalog LIKE '%$name_catalog%'";
$data=mysqli_query($conn,$query);
$mangDMSP= array();
}

Class DanhMucSanPham{
    function __construct($id_catalog ,$name_catalog)
{
  $this->id_catalog=$id_catalog;
  $this->name_catalog=$name_catalog;
}
}

while ($row=mysqli_fetch_assoc($data)){
   
  array_push($mangDMSP,new DanhMucSanPham($row['id_catalog'],$row ['name_catalog']));

}
echo json_encode($mangDMSP);

?>