<?php
require "config.php";
$query="SELECT * FROM products_catalog";
$data=mysqli_query($conn,$query);
$rowcount=mysqli_num_rows($data);//dem so dong trong cau lenh sql trong php
echo $rowcount;
?>