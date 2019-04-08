<?php

//Definimos las variables
$host = "localhost";
$user = "id889704_kiwimate";
$pass = "Klio1234";
$dbname = "id889704_kiwimate";

//Abre la conexion
$mysqli = new mysqli($host, $user, $pass, $dbname);
if ($mysqli->connect_error) {
    echo "Falló la conexión con MySQL: (" . $mysqli->connect_error . ") " . $mysqli->connect_error;
}

?>