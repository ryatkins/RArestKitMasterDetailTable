<?php
header('Content-Type: application/json; charset=utf8');
header('Access-Control-Allow-Origin: http://www.ionreality.com/');
header('Access-Control-Max-Age: 3628800');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');

//$model[0] = array('id' => 1, 'title' => 'Airplane', 'image' => 'Airplane.png');
//$model[1] = array('id' => 2, 'title' => 'Egg', 'image' => 'Egg.png');

$model[0] = array('id' => 1, 'title' => 'Airplane', 'image' => 'Airplane.png');
$model[1] = array('id' => 2, 'title' => 'American Road Bike', 'image' => 'American Road Bike.png');
$model[2] = array('id' => 3, 'title' => 'Army Hummer', 'image' => 'Army Hummer.png');
$model[3] = array('id' => 4, 'title' => 'Astro Boy', 'image' => 'Astro Boy.png');
$model[4] = array('id' => 5, 'title' => 'Blue American Road Bike', 'image' => 'Blue American Road Bike.png');
$model[5] = array('id' => 6, 'title' => 'Cowboy', 'image' => 'Cowboy.png');
$model[6] = array('id' => 7, 'title' => 'Dog', 'image' => 'Dog.png');
$model[7] = array('id' => 8, 'title' => 'Egg', 'image' => 'Egg.png');
$model[8] = array('id' => 9, 'title' => 'F1 race car', 'image' => 'F1 race car.png');
$model[9] = array('id' => 10, 'title' => 'Fire truck', 'image' => 'Fire truck.png');
$model[10] = array('id' => 11, 'title' => 'Fireman', 'image' => 'Fireman.png');
$model[11] = array('id' => 12, 'title' => 'German sports car', 'image' => 'German sports car.png');
$model[12] = array('id' => 13, 'title' => 'Green Sport Bike', 'image' => 'Green Sport Bike.png');
$model[13] = array('id' => 14, 'title' => 'Huey USAFAM', 'image' => 'Huey USAFAM.png');
$model[14] = array('id' => 15, 'title' => 'Lizard', 'image' => 'Lizard.png');
$model[15] = array('id' => 16, 'title' => 'Mad max police car', 'image' => 'Mad max police car.png');
$model[16] = array('id' => 17, 'title' => 'Police car', 'image' => 'Police car.png');
$model[17] = array('id' => 18, 'title' => 'Sniper 50 cal', 'image' => 'Sniper 50 cal.png');
$model[18] = array('id' => 19, 'title' => 'Squirrel', 'image' => 'Squirrel.png');
$model[19] = array('id' => 20, 'title' => 'Swat team', 'image' => 'Swat team.png');
$model[20] = array('id' => 21, 'title' => 'Woman in brown jacket', 'image' => 'Woman in brown jacket.png');
$model[21] = array('id' => 22, 'title' => 'Woman in dress', 'image' => 'Woman in dress.png');

$model2[0] = array('id' => 23, 'title' => 'Cowboy', 'image' => 'Cowboy.png');
$model2[1] = array('id' => 24, 'title' => 'Lizard', 'image' => 'Lizard.png');

$category[0] = array('id' => 1, 'title' => 'My Models', 'models' => $model);
$category[1] = array('id' => 2, 'title' => 'Your Models', 'models' => $model2);

$categories[0] = array('category' => $category[0]);
$categories[1] = array('category' => $category[1]);

echo json_encode($categories);
?>