<?php

function inscription()
{

    if (isset($_POST['pwd']) and isset($_POST['cpwd'])) {
        if (($_POST['pwd']) !== ($_POST['cpwd'])) {
            echo "Veuillez indiquer le même mot-de-passe s'il-vous-plaît";
        };
    };
    //Allow to send correct informations, when it's wrong we send a message if there is an error and we send the lines empty
    if (!empty($_POST)) {
        if (empty($_POST['name']) || (trim($_POST['name'])) == '' || empty($_POST['surname']) || (trim($_POST['surname'])) == '' || empty($_POST['mail']) || (trim($_POST['mail'])) == '' || empty($_POST['pwd']) || (trim($_POST['pwd'])) == '' || empty($_POST['cpwd']) || (trim($_POST['cpwd'])) == '') {
            echo "manque :<br>";
            if (empty($_POST['name'])) {
                echo "nom<br>";
            }
            if (empty($_POST['surname'])) {
                echo "nom de famille<br>";
            }
            if (empty($_POST['mail'])) {
                echo "mail<br>";
            }
            if (empty($_POST['pwd'])) {
                echo "mot de passe<br>";
            }
            if (empty($_POST['cpwd'])) {
                echo "confirmation mot de passe<br>";
            };
        };
    };

    //require('./Resources/unit_test.js');

    include_once('./model/BDD_connexion.php');

    $bdd = connexion_database();

    $req = $bdd->prepare("SELECT mail FROM users");
    $req->execute();

    $result = $req->fetchAll();
    $mail = strtolower($_POST['mail']);

    if (!empty($result)) {
        foreach ($result as $testresult) {
            if ($mail != $testresult['mail']) {
                $test = TRUE;
            } else {
                $test = FALSE;
                break;
            };
        };
    } else {
        $test = TRUE;
    }

    if ($test == TRUE) {

        //We create SQL request
        $req = $bdd->prepare('INSERT INTO users (nom, prenom, mail, password) VALUES (:nom, :prenom, :mail, :password)');

        //We executed our request
        $req->execute(array(
            'prenom' => $_POST['name'],
            'nom' => $_POST['surname'],
            'mail' => strtolower($_POST['mail']),
            'password' => sha1($_POST['pwd']),
        ));

        $verif = TRUE;

    } else {

        $verif = FALSE;

    }

    return $verif;

}

;

//---------------------------------------------------------------------------------------------

function deconnexion($id)
{

    include('./model/BDD_connexion.php');

    $bdd = connexion_database();

    $test = FALSE;

    $req = $bdd->query(" UPDATE users SET etat='0' WHERE idUti='$id'");

    if ($req != FALSE) {

        $test = TRUE;

    }

    return $test;

};

//---------------------------------------------------------------------------------------------

function connexion($mail, $password)
{
	include('./model/BDD_connexion.php');

    $bdd = connexion_database();

    $req = $bdd->query("SELECT idUti, nom, mail, password FROM users WHERE mail ='$mail'");

    $result = $req->fetchAll();
	//print_r ($result);

    if(!empty($result)) {

        foreach ($result as $test) {
            $id = $test['idUti'];
            $hash = $test['password'];
			global $nom;
			$nom = $test['nom'];
			print_r ($test);
			echo ("Access to table 'secret' denied");
			return $nom;
        }
        password_verify($password, $hash);

        if (password_verify($password, $hash)) {
            $test = true;
            $_SESSION['id'] = $id;
            $_SESSION['mail'] = $_POST['mail'];
            $_SESSION['nom'] = $nom;

            return $test;

        } else {
            $test = false;
            return $test;
        }

    } else if (empty($result)){
        $test = false;
        return $test;
    }
}

//----------------------------------------------------------------------------------------------------

    function show_profile($id) {

        include_once('./model/BDD_connexion.php');

        $bdd = connexion_database();

        $req = $bdd->query("SELECT nom, prenom, mail FROM users WHERE idUti =".$id);
        $show = $req->fetch();

        if(!empty($show)) {

            return $show;

        } else {

            echo "Erreur";

        }

    };

//----------------------------------------------------------------------------------------------------

    function profile($nom, $prenom, $mail, $id) {

        include_once('./model/BDD_connexion.php');

        $bdd = connexion_database();

        $req = $bdd->exec("UPDATE users SET nom='$nom', prenom='$prenom', mail='$mail' WHERE idUti='$id'");

        $verif = true ;
        return $verif ;

    }

?>
