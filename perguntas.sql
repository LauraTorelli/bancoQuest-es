5- const mysql2 = require('mysql2');

// Configurações de conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'Carrinhos'
});

// Conectar ao banco de dados
connection.connect();

// Exemplo 1: Consultar locações para o carro código 3
connection.query('CALL ConsultarLocacoesCarro(3, NULL, NULL)', (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado do Exemplo 1:', results);
});

// Exemplo 2: Consultar locações para carros à Gasolina e Etanol
connection.query('CALL ConsultarLocacoesCarro(NULL, "Gasolina", NULL)', (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado do Exemplo 2:', results);
});

// Exemplo 3: Consultar carros disponíveis
connection.query('CALL ConsultarLocacoesCarro(NULL, NULL, "SIM")', (error, results, fields) => {
  if (error) throw error;
  console.log('Resultado do Exemplo 3:', results);
});

// Fechar a conexão com o banco de dados após todas as consultas
connection.end();

6- const mysql2 = require('mysql2');

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'phpmyadmin',
  password: 'aluno',
  database: 'Carrinhos'
});

// Conexão com o banco de dados
connection.connect((err) => {
  if (err) throw err;
  console.log('Conectado ao banco de dados MySQL.');
});

// Definição da stored procedure para a questão 2
const createStoredProcedure = `
DELIMITER //

CREATE PROCEDURE ConsultaLocacoesPorCarro(
  IN p_codigo INT
)
BEGIN
  SELECT * FROM LOCAÇÕES WHERE CODCARRO = p_codigo;
END //

DELIMITER ;
`;

// Execução da stored procedure
connection.query(createStoredProcedure, (err, result) => {
  if (err) throw err;
  console.log('Stored procedure criada com sucesso.');
});

// Encerramento da conexão com o banco de dados
connection.end();
