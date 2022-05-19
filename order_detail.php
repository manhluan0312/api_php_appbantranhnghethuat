<?php
  include ('config.php');
  
  if($_SERVER['REQUEST_METHOD']=='POST'){
      $json='[{"giasanpham":7000000.0,"hinhanhsanpham":"khucsongque.jpg","idsp":5,"soluongsanpham":1,"tensanpham":"Khúc sông quê"},
      {"giasanpham":1.0E7,"hinhanhsanpham":"nanghoian.jpeg","idsp":58,"soluongsanpham":2,"tensanpham":"Nắng Hội An"}]';
      $data=json_decode($json,true);
     
      foreach ($data as $value){
        $id_order= $value['id_order']; 
        $id_product=$value['id_product']; 
        $Amount=$value['Amount']; 
        $Price=$value['Price']; 
      }

      $query="INSERT INTO `order_details`(`id_order_detail`, `id_product`, `id_order`, `Amount`, `Price`)
       VALUES (null,'$id_product','52','$Amount','$Price')";
        $data=mysqli_query($conn,$query);
        if($data){
           echo "1";
        }
        else{
           echo"0";
        }
  }
  ?>