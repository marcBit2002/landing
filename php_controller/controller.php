<?php
if (!isset($_SESSION)) {
    session_start();
}
include('../php_librarys/bd.php');
if (isset($_POST['registration'])) {
    $regex_pattern = '/^[^@\s]+@[^@\s]+\.[^@\s]+$/';
    $email = $_POST['useremail'];
    if (!preg_match($regex_pattern, $email)) {
        $_SESSION['incorrectRegister'] = "Introducir formato de correo correcto.";
    } else if ($_POST['pssw'] != $_POST['psswrepe']) {
        $_SESSION['incorrectRegister'] = "La contraseñas deben coincidir.";
    } else {
        $id = NouRegistre($_POST['username'], $_POST['useremail'], $_POST['pssw']);
        if ($id != null) {
            $_SESSION['loggeduser'] = selectUserById($id);
        }
    }
    header('Location: ../index.php');
    exit();
} else if (isset($_GET['login'])) {
    $row = selectUser($_GET['useremail']);
    $hashed_password = $row['contrasenia'];

    if (password_verify($_GET['pssw'], $hashed_password)) {
        $_SESSION['loggeduser'] = $row;
        if ($_SESSION['loggeduser']['idTipo'] == 1 || $_SESSION['loggeduser']['idTipo'] == 2) {
            $_SESSION['loggedadmin'] = $_SESSION["loggeduser"];
            header('Location: ../UI/admins.php');
            exit();
        } else {
            $_SESSION['loggeduser'] = $row;
        }
    } else {
        $_SESSION['incorrectLogin'] = "Correo o contraseña incorrecta.";
    }
    header('Location: ../index.php');
    exit();
} else if (isset($_GET['logout'])) {
    unset($_SESSION['loggeduser']);
    if (isset($_SESSION['loggedadmin'])) {
        unset($_SESSION['loggedadmin']);
    }
    header('Location: ../index.php');
    exit();
} else if (isset($_POST['admin_createuser'])) {
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $regex_pattern = '/^[^@\s]+@[^@\s]+\.[^@\s]+$/';
    $contrasenia = $_POST['passwd'];
    $tipo = $_POST['tipoUsuario'];
    if (preg_match($regex_pattern, $email)) {
        $user = NouRegistreAdministracio($nombre, $email, $contrasenia, $tipo);
        if (!$user) {
            $_SESSION['incorrect'] = "Usuario ya registrado";
            header('Location: ../UI/create_user.php');
            exit();
        }
    } else {
        $_SESSION['incorrect'] = "Formato de correo incorrecto";
        header('Location: ../UI/create_user.php');
        exit();
    }
    header('Location: ../UI/admins.php');
    exit();
} else if (isset($_POST['borrarusuario'])) {
    $id = $_POST['id'];
    EsborrarUsuari($id);
    header('Location: ../UI/admins.php');
    exit();
} else if (isset($_GET['submit'])) {
    $nombre = $_GET['nombre'];
    $email = $_GET['email'];
    $contrasenia = $_GET['passwd'];
    NouRegistre($nombre, $email, $contrasenia);
    header('Location: ../UI/admins.php');
    exit();
} else if (isset($_POST['edituser'])) {
    $id = $_POST['edituser'];
    $nombre = $_POST['nombre'];
    $correo = $_POST['email'];
    $contrasenia = $_POST['passwd'];
    $tipo = $_POST['tipoUsuario'];
    ModificarUsuarios($id, $nombre, $correo, $contrasenia, $tipo);
    header('Location: ../UI/admins.php');
    exit();
}
