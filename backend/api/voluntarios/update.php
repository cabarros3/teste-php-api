<?php
require_once '../../config/cors.php';
require_once '../../config/utils.php';
require_once '../../db/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
    enviarResposta("erro", "Método inválido. Use PUT.", null, 405);
}

$data = json_decode(file_get_contents("php://input"));

if(!isset($data->voluntario_id) || !isset($data->nome_voluntario) || !isset($data->funcao)) {
    enviarResposta("erro", "Dados incompletos. Informe ID, nome e função.", null, 400);
}

try {
    $stmt = $pdo->prepare("UPDATE voluntario SET nome_voluntario = ?, funcao = ? WHERE voluntario_id = ?");
    
    if($stmt->execute([$data->nome_voluntario, $data->funcao, $data->voluntario_id])) {
        if ($stmt->rowCount() > 0) {
            enviarResposta("sucesso", "Voluntário atualizado com sucesso!", [], 200);
        } else {
            // Código 200 ainda, pois não houve erro técnico, apenas não houve mudança
            enviarResposta("sucesso", "Nenhum dado foi alterado (ID não existe ou dados iguais).", [], 200);
        }
    } else {
        enviarResposta("erro", "Falha ao atualizar.", null, 503);
    }

} catch (PDOException $e) {
    enviarResposta("erro", "Erro no banco: " . $e->getMessage(), null, 500);
}
?>