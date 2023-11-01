<?php
$servername = "localhost";
$dbUsername = "pepito";
$dbPassword = "";
$dbName = "BDActividades"; // Nombre de base de datos

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbName);

// Verificar la conexión
if ($conn->connect_error) {
    die("La conexión a la base de datos ha fallado: " . $conn->connect_error);
}

// Recibir datos del formulario
$newUsername = $_POST['newUsername'];
$newEmail = $_POST['newEmail'];
$newPassword = password_hash($_POST['newPassword'], PASSWORD_BCRYPT); // Hashear la contraseña antes de almacenarla en la base de datos

// Insertar datos en la base de datos
$sql = "INSERT INTO usuarios (username, email, password) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $newUsername, $newEmail, $newPassword);

if ($stmt->execute()) {
    echo "Registro exitoso. ¡Bienvenido, $newUsername!";
} else {
    echo "Error al registrar: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>