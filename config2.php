<?php

$port ="3307";
$host = "127.0.0.1";
$dbname ="arcadia_db";
$username = "john";
$password = "toto-php";


$dsn = "mysql:host=$host;dbname=$dbname;port=$port";

// $dsn = 'mysql:host=127.0.0.1;dbname=zoo_db';
// $username = 'john';
// $password = '';

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>
