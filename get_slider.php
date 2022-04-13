<?php
require "config.php";
$query="SELECT * FROM slider";
$data=mysqli_query($conn,$query);
$mangSlider= array();

class Slider{
    function __construct($id_slider ,$titile_sider,$image_slider)
{
  $this->id_slider=$id_slider;
  $this->titile_sider=$titile_sider;
  $this->image_slider=$image_slider;
}
}
while ($row=mysqli_fetch_assoc($data)){
   
  array_push($mangSlider,new Slider($row ['id_slider'],$row ['titile_sider'],$row ['image_slider']));

}
echo json_encode($mangSlider);
?>