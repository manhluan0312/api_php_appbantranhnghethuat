<?php
if($_SERVER['REQUEST_METHOD'] =='POST'){
    $name_product=$_POST['name_product'];
    $poto_product=$_POST['poto_product'];
    $price_product=$_POST['price_product'];
    $product_material=$_POST['product_material'];
    $product_dimensions=$_POST['product_dimensions'];
    $year_of_creation=$_POST['year_of_creation'];
    $product_description=$_POST['product_description'];
    $note_products=$_POST['note_products'];
    $id_catalog=$_POST['id_catalog'];
    $id_sp=$_POST['id_product'];
}

    require_once'config.php';

    $sqli= "UPDATE `products` SET `name_product`='$name_product',`poto_product`='$poto_product',
    `price_product`='$price_product',`product_material`= '$product_material',`product_dimensions`='$product_dimensions',
    `year_of_creation`='$year_of_creation',`product_description`='$product_description',`note_products`='$note_products',
    `id_catalog`='$id_catalog' WHERE `id_product`='$id_sp'";
    // echo($sqli);

    if(mysqli_query($conn,$sqli))
    {
        $result["success"]="1";
        $result["message"]="success";
        echo json_encode($result);
        mysqli_close($conn);
    } 
    else
    {
        $result["success"]="0";
        $result["message"]="error";
        echo json_encode($result);
        mysqli_close($conn);
    }
?>