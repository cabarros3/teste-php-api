<?php
require_once '../../config/cors.php';
require_once '../../config/utils.php';
require_once '../../db/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    enviarResposta("erro", "Método inválido. Use POST.", null, 405);
}

$data = json_decode(file_get_contents("php://input"));

// Validação simples
if(!isset($data->nome_voluntario) || !isset($data->funcao)) {
    enviarResposta("erro", "Dados incompletos. Informe nome e função.", null, 400);
}

try {
    $stmt = $pdo->prepare("INSERT INTO voluntario (nome_voluntario, funcao) VALUES (?, ?)");
    
    if($stmt->execute([$data->nome_voluntario, $data->funcao])) {
        // Sucesso 201 (Created)
        enviarResposta("sucesso", "Voluntário cadastrado com sucesso!", [], 201);
    } else {
        enviarResposta("erro", "Falha ao cadastrar voluntário.", null, 503);
    }

} catch (PDOException $e) {
    enviarResposta("erro", "Erro no banco: " . $e->getMessage(), null, 500);
}
?>