<?php
require "config.php";
$query="SELECT * FROM products_catalog ORDER BY id_catalog DESC";
$data=mysqli_query($conn,$query);
$mangDMSP= array();

class DanhMucSanPham{
    function __construct($id_catalog ,$name_catalog)
{
  $this->id_catalog=$id_catalog;
  $this->name_catalog=$name_catalog;
}
}

while ($row=mysqli_fetch_assoc($data)){
   
  array_push($mangDMSP,new DanhMucSanPham($row ['id_catalog'],$row ['name_catalog']));

}
echo json_encode($mangDMSP);
?>