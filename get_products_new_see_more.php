<?php
require "config.php";
$query="SELECT a.id_product, a.name_product, a.poto_product, a.price_product, a.product_material, a.product_dimensions, 
a.year_of_creation, a.product_description, a.note_products, b.name_catalog 
FROM products a JOIN products_catalog b ON a.id_catalog=b.id_catalog ORDER BY a.id_product DESC LIMIT 16";
$data=mysqli_query($conn,$query);
$mangSP= array();

class SanPham{
    function __construct($id_product,$name_product,$poto_product,$price_product,$product_material,
    $product_dimensions,$year_of_creation,$product_description,$note_products,$name_catalog)
{
  $this->id_product=$id_product;
  $this->name_product=$name_product;
  $this->poto_product=$poto_product;
  $this->price_product=$price_product;
  $this->product_material=$product_material;
  $this->product_dimensions=$product_dimensions;
  $this->year_of_creation=$year_of_creation;
  $this->product_description=$product_description;
  $this->note_products=$note_products;
  $this->name_catalog=$name_catalog;
}
}

while ($row=mysqli_fetch_assoc($data)){
   
  array_push($mangSP,new SanPham($row ['id_product'],$row ['name_product'],$row ['poto_product'],$row ['price_product'],
  $row ['product_material'],$row ['product_dimensions'],$row ['year_of_creation'],$row ['product_description'],
  $row ['note_products'],$row ['name_catalog']));

}
echo json_encode($mangSP);
?>