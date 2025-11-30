<?php
require_once '../../config/cors.php';
require_once '../../config/utils.php';
require_once '../../db/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
    enviarResposta("erro", "Método inválido. Use DELETE.", null, 405);
}

$data = json_decode(file_get_contents("php://input"));

if(!isset($data->voluntario_id)) {
    enviarResposta("erro", "Informe o ID para excluir.", null, 400);
}

try {
    $stmt = $pdo->prepare("DELETE FROM voluntario WHERE voluntario_id = ?");
    
    if($stmt->execute([$data->voluntario_id])) {
        if ($stmt->rowCount() > 0) {
            enviarResposta("sucesso", "Voluntário excluído com sucesso!", [], 200);
        } else {
            // 404 = Não encontrado
            enviarResposta("erro", "Voluntário não encontrado.", null, 404);
        }
    } else {
        enviarResposta("erro", "Falha ao excluir.", null, 503);
    }

} catch (PDOException $e) {
    enviarResposta("erro", "Erro no banco: " . $e->getMessage(), null, 500);
}
?>