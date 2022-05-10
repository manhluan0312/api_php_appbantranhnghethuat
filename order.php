<?php
  include ('config.php');
  
  if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_customer= $_POST['id_customer'];
    $Payments = $_POST['Payments'];
    $Note= $_POST['Note'];//thuoc tinh ko can bat buoc
    $Delivery_address = $_POST['Delivery_address'];
    $Total_money = $_POST['Total_money'];
    $chitiet =$_POST['chitiet'];
  }
    $queryOrder ="INSERT INTO `orders`(`id_order`, `id_customer`, `Payments`, `Order_date`, `Delivery_address`, `Note`, `Total_money`, `Delivery_status`) 
    VALUES (null,'$id_customer','$Payments',NOW(),'$Delivery_address','$Note',' $Total_money','Đang chờ xử lý')";
    
    $data=mysqli_query($conn,$queryOrder);
  
    if($data){
      $queryOrderID="SELECT id_orders as iddonhang FROM `orders`WHERE id_customer ='$id_customer' ORDER BY id_order DESC LIMIT 1";
      
    //lay id don hang moi nhat
      $data=mysqli_query($conn,$queryOrderID);

      while($row=mysqli_fetch_assoc($data)){
        $iddonhang =$row;
      }
        if(!empty($result)){
          //co don hang
          $chitiet=json_decode($chitiet,true);
          
          foreach ($chitiet as $key => $value){
            $truyvan ="INSERT INTO `order details`(`id_order_detail`, `id_product`, `id_order`, `Amount`, `Price`) 
            VALUES (null,'".$value['idsp']."','". $iddonhang['iddonhang']."','".$value['soluongsanpham']."','".$value['giasanpham']."')";
            echo $truyvan;
            $data=mysqli_query($conn,$truyvan);   
        }

        if($data){
          $data["success"]="1";
          $data["message"]="succes";
          mysqli_close($conn);
        }
        else{
          $data["success"]="0";
          $data["message"]="error";
          mysqli_close($conn);
        }
        }
      }else{
        $data["success"]="0";
        $data["message"]="error";
        mysqli_close($conn);
        ?>