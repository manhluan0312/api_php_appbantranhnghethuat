<?php
  include ('config.php');
  
  if($_SERVER['REQUEST_METHOD']=='POST'){
      $json=$_POST['chitiet'];
  }
      $data=json_decode($json,true);

      foreach ($data as $key => $value) {
        $id_order= $value['id_order']; 
        $id_product=$value['idsp']; 
        $Amount=$value['soluongsanpham']; 
        $Price=$value['giasanpham'];

        $query="INSERT INTO `order_details`(`id_order_detail`, `id_product`, `id_order`, `Amount`, `Price`)
        VALUES (null,'$id_product','$id_order','$Amount','$Price')";
        $data=mysqli_query($conn,$query);
      }
       // echo $query;
        if($data){
        echo "1";
    } else{
      echo "0";
    }
  ?>