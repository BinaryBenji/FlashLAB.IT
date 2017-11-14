<?php

if (strlen($_POST['mail']) < 2 || strlen($_POST['pwd']) < 2) {
    include("./view/connexion.html");
    echo "Vous avez moins de 2 caractères dans l'un des champs, veuillez en rajouter";
} else {
	$mail = $_POST['mail'];
	$password = $_POST['pwd'];

    include("./model/users.php");

    $connexion = connexion($mail, $password);

    if ($connexion == TRUE) {
        include("./view/home_page.html");

    } else {
		include('./view/connexion.html');
        echo "<html><p><div class='alert span1 alert-danger'><strong>Mot de passe ou mail incorrect</strong></div></p></html>";
        #echo "<html><br></html>";
    };

};

?>