# 🌿 API Horta Comunitária (PHP Native)

Sistema de gerenciamento para Horta Comunitária, desenvolvido com **PHP puro (sem frameworks)**, estruturado como uma **REST API**. O projeto separa as responsabilidades entre Backend (Regras de negócio/Banco) e Frontend (HTML/JS).

## 🚀 Tecnologias Utilizadas

- **PHP 8+** (Backend e API)
- **MySQL** (Banco de Dados)
- **PDO** (Conexão segura com o banco)
- **HTML5 / CSS3 / Javascript (Fetch API)** (Frontend)
- **Insomnia / Postman** (Para testes de rotas)

---

## 📂 Estrutura de Pastas

O projeto segue uma arquitetura organizada para facilitar a manutenção:

```text
teste-php-api/
├── backend/
│   ├── api/
│   │   └── voluntarios/    # CRUD de Voluntários (create, read, update, delete)
│   ├── config/
│   │   ├── cors.php        # Configuração de permissões (CORS)
│   │   └── utils.php       # Funções úteis (padronização de respostas JSON)
│   ├── db/
│   │   └── db.php          # Conexão com o banco (PDO)
│   └── config.php          # (CRIAR MANUALMENTE) Credenciais do banco
├── frontend/               # Telas e interfaces do usuário
└── README.md

```

## ⚙️ Configuração Inicial (Passo a Passo)

Como estamos escondendo as senhas por segurança, você precisa configurar seu ambiente local.

1. Banco de Dados
   Certifique-se de ter o MySQL rodando e crie o banco de dados:

```SQL

CREATE DATABASE horta_comunitaria;

```

(Importe as tabelas do script SQL do projeto para criar a tabela voluntario e outras).

2. Configurar Credenciais (Importante! ⚠️)
   O arquivo de senhas não é enviado para o GitHub. Você precisa criá-lo manualmente.

Vá na pasta backend/.

Crie um arquivo chamado config.php.

Cole o seguinte código e coloque sua senha do MySQL:

```php
<?php
define('DB_HOST', 'localhost:3306');
define('DB_NAME', 'horta_comunitaria');
define('DB_USER', 'root');
define('DB_PASS', 'sua_senha_aqui'); // <-- Coloque sua senha
?>
```

## ⚡ Como Rodar o Projeto

A maneira mais fácil de rodar sem configurar Apache/XAMPP complexos é usando o servidor embutido do PHP.

Abra o terminal na pasta raiz do projeto (teste-php-api).

Execute o comando:

```bash
php -S localhost:8000
```

O servidor estará rodando!

API: http://localhost:8000/backend/api/...

Frontend: http://localhost:8000/frontend/

## 🔌 Endpoints da API

Abaixo estão as rotas disponíveis no sistema. Lembre-se que todas as respostas são em JSON.

### 🧑‍🌾 Voluntários

| Método     | URL (Endpoint)                        | Descrição                  | Exemplo de JSON (Body)                                                   |
| :--------- | :------------------------------------ | :------------------------- | :----------------------------------------------------------------------- |
| **GET**    | `/backend/api/voluntarios/`           | Lista todos os voluntários | _(Vazio)_                                                                |
| **POST**   | `/backend/api/voluntarios/create.php` | Cadastra novo voluntário   | `{"nome_voluntario": "Ana", "funcao": "Regar"}`                          |
| **PUT**    | `/backend/api/voluntarios/update.php` | Atualiza dados             | `{"voluntario_id": 1, "nome_voluntario": "Ana B.", "funcao": "Plantio"}` |
| **DELETE** | `/backend/api/voluntarios/delete.php` | Remove um voluntário       | `{"voluntario_id": 1}`                                                   |

### 🌱 Canteiros

| Método     | URL (Endpoint)                      | Descrição                | Exemplo de JSON (Body)                                                                   |
| :--------- | :---------------------------------- | :----------------------- | :--------------------------------------------------------------------------------------- |
| **GET**    | `/backend/api/canteiros/`           | Lista todos os canteiros | _(Vazio)_                                                                                |
| **POST**   | `/backend/api/canteiros/create.php` | Cria canteiro            | `{"nome_canteiro": "Canteiro A", "localizacao": "Norte", "tamanho": 10.5}`               |
| **PUT**    | `/backend/api/canteiros/update.php` | Atualiza canteiro        | `{"canteiro_id": 2, "nome_canteiro": "Canteiro B", "localizacao": "Sul", "tamanho": 12}` |
| **DELETE** | `/backend/api/canteiros/delete.php` | Remove canteiro          | `{"canteiro_id": 2}`                                                                     |

### 🌿 Plantas

| Método     | URL (Endpoint)                    | Descrição              | Exemplo de JSON (Body)                                                       |
| :--------- | :-------------------------------- | :--------------------- | :--------------------------------------------------------------------------- |
| **GET**    | `/backend/api/plantas/`           | Lista todas as plantas | _(Vazio)_                                                                    |
| **POST**   | `/backend/api/plantas/create.php` | Cadastra planta        | `{"nome_planta": "Alface", "tempo_cultivo": "45 dias"}`                      |
| **PUT**    | `/backend/api/plantas/update.php` | Atualiza planta        | `{"planta_id": 5, "nome_planta": "Alface Roxa", "tempo_cultivo": "50 dias"}` |
| **DELETE** | `/backend/api/plantas/delete.php` | Remove planta          | `{"planta_id": 5}`                                                           |

### 🚜 Cultivos

| Método     | URL (Endpoint)                     | Descrição        | Exemplo de JSON (Body)                                                                                   |
| :--------- | :--------------------------------- | :--------------- | :------------------------------------------------------------------------------------------------------- |
| **GET**    | `/backend/api/cultivos/`           | Lista cultivos   | _(Vazio)_                                                                                                |
| **POST**   | `/backend/api/cultivos/create.php` | Inicia cultivo   | `{"data_cultivo": "2025-11-20", "voluntario_id": 1, "canteiro_id": 2, "planta_id": 5}`                   |
| **PUT**    | `/backend/api/cultivos/update.php` | Atualiza cultivo | `{"cultivo_id": 10, "data_cultivo": "2025-11-21", "voluntario_id": 1, "canteiro_id": 2, "planta_id": 5}` |
| **DELETE** | `/backend/api/cultivos/delete.php` | Remove cultivo   | `{"cultivo_id": 10}`                                                                                     |

## 🛡️ Padrões de Resposta

A API sempre retorna JSON seguindo este padrão para facilitar o Frontend:

Sucesso

```json
{
  "status": "sucesso",
  "mensagem": "Operação realizada!",
  "dados": [ ... ]
}
```

Erro:

```json
{
  "status": "erro",
  "mensagem": "Descrição do erro",
  "dados": null
}
```

## 🤝 Contribuição

Garanta que o arquivo backend/config.php esteja no seu .gitignore.

Mantenha a padronização das respostas JSON usando a função enviarResposta().
