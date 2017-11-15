<?php

if (strlen($_POST['name']) < 2 || strlen($_POST['surname']) < 2 || strlen($_POST['mail']) < 2 || strlen($_POST['pwd']) < 2) {
    include("./view/inscription.html");
    echo "Vous avez moins de 2 caractères dans l'un des champs, veuillez en rajouter";

} else if (!preg_match("/^[a-zA-Z ]*$/",$_POST['name'] )) {
    include("./view/inscription.html");
    echo "<center>Vous ne devez ecrire que des lettres dans les champs #NOM et #PRENOM</center>";

} else if (!preg_match("/^[a-zA-Z ]*$/",$_POST['surname'] )) {
    include("./view/inscription.html");
    echo "<center>Vous ne devez ecrire que des lettres dans les champs #NOM et #PRENOM</center>";

} else if (($_POST['pwd']) !== ($_POST['cpwd'])) {
    include("./view/inscription.html");
	echo "Veuillez mettre le meme mot de passe";

} else {

	include("./model/BDD_connexion.php");
    $connexion_database = connexion_database();
    include("./model/users.php");
    $inscription = inscription();

    if ($inscription == TRUE) {
        include("./view/connexion.html");
		echo "<center><b>Vous etes bien inscrit. Vous pouvez vous connecter.</b></center>";
    } else {
		include("./view/connexion.html");
		echo "<center><b>Vous etes deja inscrit.</b></center>";
    };

};

?>