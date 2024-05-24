<?php
    include_once "Adatbazis.php"
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>DolgozatSportA</title>
</head>
<body>
    <h1>AB dolgozat</h1>
    <?php
        $adatbazis=new Adatbazis();
        //$adatbazis->beszur(01, "Horvátország");
        //$adatbazis->beszur(02, "Szlovákia");
        $matrix=$adatbazis->adatLeker("orszagAzon", "nev", "orszag");
        $adatbazis->megjelenit($matrix);
        $adatbazis->torles("orszag", "nev", "Szlovákia");
        $adatbazis->kapcsolatBezár();
    ?>
</body>
</html>