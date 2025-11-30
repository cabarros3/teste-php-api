<?php
require_once '../../config/cors.php';
require_once '../../config/utils.php';
require_once '../../db/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    enviarResposta("erro", "Método inválido. Use GET.", null, 405);
}

try {
    $stmt = $pdo->prepare("SELECT * FROM voluntario ORDER BY voluntario_id DESC");
    $stmt->execute();
    $voluntarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Retorna status 'sucesso' e os dados encontrados (mesmo que seja array vazio)
    enviarResposta("sucesso", "Lista carregada.", $voluntarios, 200);

} catch (PDOException $e) {
    enviarResposta("erro", "Erro no banco: " . $e->getMessage(), null, 500);
}
?>