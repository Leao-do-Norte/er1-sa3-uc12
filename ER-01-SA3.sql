-- cria��o do banco de dados
CREATE DATABASE TesteSegurancaFST13;

-- colocando o BD em uso
USE TesteSegurancaFST13;

-- criando uma tabela no BD
CREATE TABLE Usuarios
(
	Id INT PRIMARY KEY IDENTITY,
	-- o campo Id � incremental, n�o precisa ser declarado
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
);

-- inserir dados no BD
INSERT INTO Usuarios VALUES ('alpha@email.com',1234);
INSERT INTO Usuarios VALUES ('bravo@email.com',4321);
INSERT INTO Usuarios VALUES ('charlie@email.com',1122);

-- consultar (no terminal) os usu�rios existentes no BD
SELECT * FROM Usuarios;

SELECT Email, Senha FROM Usuarios; -- a execu��o deste comando oculta a Id, pois n�o foi selecionado tal informa��o

-- aplicando hash nos campos do BD:
SELECT Email, HASHBYTES('MD2',Senha) FROM Usuarios; -- MD2 � o algoritmo de 'hasheamento'

-- outros algoritmos: MD4, MD5, SHA, SHA1, SHA2_256, SHA2_512

SELECT Id, Email, HASHBYTES('MD2', Senha) AS 'Senha Hash' FROM Usuarios WHERE Id = 1; -- modo de 'customizar' os t�tulos da tabela

SELECT Id, Email, HASHBYTES('SHA2_256',Senha) AS 'Senha Hash' FROM Usuarios WHERE Id < 4;

SELECT Id, HASHBYTES('MD5',Email) AS 'Email Hash', HASHBYTES('MD5',Senha) AS 'Senha Hash' FROM Usuarios;