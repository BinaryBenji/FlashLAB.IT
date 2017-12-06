<?php 
session_start();

//Connexion a la base de donnée, Check connection

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "flashlab";

$query = '';

$query = (isset($_GET['page'])) ? $_GET['page'] : '';

switch ($query) {
    case '':
        include ("controler/access.php");
        break;
	case 'inscription':
        include ("controler/inscription.php");
        break;
	case 'connexion':
        include ("controler/connexion.php");
        break;
	case 'registration':
        include ("controler/registration.php");
        break;
	case 'identify':
        include ("controler/identify.php");
        break;
	case 'deconnexion':
        include ("controler/deconnexion.php");
        break;
	case 'infoP':
        include ("controler/infoP.php");
        break;
    default:
        echo '<h1>Cette page est inexistante</h1>';
        break;
}
?>