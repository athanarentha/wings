<?php
include('./_libFunc.php');


$api = file_get_contents('https://dummyjson.com/products');
$json = json_decode($api, true);

foreach ($json['products'] as $key => $value) {
    $title = htmlspecialchars($value['title']);
    $price = htmlspecialchars($value['price']);
    $description = htmlspecialchars($value['description']);
    $category = htmlspecialchars($value['category']);
    $discount = htmlspecialchars($value['discountPercentage']);
    $brand = htmlspecialchars($value['brand']);
    $stock = htmlspecialchars($value['stock']);
    $image = htmlspecialchars(implode(',',$value['images']));
    $dimension = rand(0,99).'cm x '.rand(0,99).' cm';
    
    $uuid = guidv4();

    $pCode = htmlspecialchars(strtoupper(substr($title, 0,3)));

    query("INSERT INTO product (uuid,product_code,product_name,price,currency,discount,dimension,unit,stock,brand,description,images) VALUES('$uuid','$pCode','$title','$price','USD','$discount','$dimension','pcs','$stock','$brand','$description','$image')");
}

$userVal = "'".guidv4()."','admin','".md5('admin')."'";
query("INSERT INTO login (uuid,user,password) VALUES ($userVal)");
$userVal = "'".guidv4()."','user','".md5('user')."'";
query("INSERT INTO login (uuid,user,password) VALUES ($userVal)");
