DROP DATABASE Clinica;

# 1 - Criaçao do banco de dados e tabelas
CREATE DATABASE Clinica;

USE Clinica;

CREATE TABLE Paciente (
CPF CHAR(11) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(255),
telefone CHAR(11),
dt_nascimento DATE NOT NULL
);

CREATE TABLE Exame (
cod_exame INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(50),
valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Convenio (
cod_convenio INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
taxa DECIMAL(3,2) NOT NULL
);

CREATE TABLE Especialidade (
cod_especialidade INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL
);

CREATE TABLE Medico (
CRM CHAR(11) PRIMARY KEY,
email VARCHAR(255),
nome VARCHAR(100) NOT NULL,
telefone CHAR(11)
);

CREATE TABLE Pedido (
cod_pedido INTEGER PRIMARY KEY AUTO_INCREMENT,
CPF CHAR(11) NOT NULL,
CRM CHAR(11) NOT NULL,
cod_exame INTEGER NOT NULL,
data_hora DATETIME NOT NULL,
cod_convenio INTEGER,
FOREIGN KEY(CPF) REFERENCES Paciente (CPF),
FOREIGN KEY(CRM) REFERENCES Medico (CRM),
FOREIGN KEY(cod_exame) REFERENCES Exame (cod_exame),
FOREIGN KEY(cod_convenio) REFERENCES Convenio (cod_convenio)
);

CREATE TABLE Medico_Especialidade (
CRM CHAR(11),
cod_especialidade INTEGER NOT NULL,
FOREIGN KEY (cod_especialidade) REFERENCES Especialidade (cod_especialidade),
FOREIGN KEY (CRM) REFERENCES Medico (CRM),
PRIMARY KEY (CRM, cod_especialidade)
);

CREATE TABLE Paciente_Convenio (
CPF CHAR(11) NOT NULL,
cod_convenio INTEGER NOT NULL,
FOREIGN KEY(CPF) REFERENCES Paciente (CPF),
FOREIGN KEY(cod_convenio) REFERENCES Convenio (cod_convenio)
);

# Triggers
DELIMITER $$
CREATE TRIGGER verifica_convenio BEFORE INSERT ON Pedido FOR EACH ROW
BEGIN
	DECLARE convenio_existe INTEGER;
    
    SELECT COUNT(*) INTO convenio_existe
    FROM Paciente_Convenio
    WHERE CPF = new.CPF AND cod_convenio = new.cod_convenio;
    
    IF convenio_existe = 0 AND NEW.cod_convenio != NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O paciente não possui este convenio.';
	END IF;
END;
$$ DELIMITER ; 

# Populando a base de dados
## Pacientes
INSERT INTO Paciente (CPF, nome, email, telefone, dt_nascimento) VALUES 
('02458963321', 'Ana Oliveira', 'ana.oliveira@example.com', '987654321', '1985-09-12'),
('03147852214', 'Mariana Santos', 'mariana.santos@example.com', '912345678', '1990-07-28'),
('04789632145', 'Pedro Souza', 'pedro.souza@example.com', '987654321', '1979-03-15'),
('05231547896', 'Julia Rodrigues', 'julia.rodrigues@example.com', '912345678', '2000-11-03'),
('06547896321', 'Luciana Silva', 'luciana.silva@example.com', '987654321', '1995-02-18'),
('07125896321', 'Carlos Ferreira', 'carlos.ferreira@example.com', '912345678', '1988-06-21'),
('08475239684', 'André Almeida', 'andre.almeida@example.com', '987654321', '1976-09-29'),
('09321478536', 'Fernanda Costa', 'fernanda.costa@example.com', '912345678', '1992-04-06'),
('10253647895', 'Roberto Castro', 'roberto.castro@example.com', '987654321', '1983-12-17'),
('11547896325', 'Paulo Nunes', 'paulo.nunes@example.com', '912345678', '1997-08-08'),
('12253647896', 'Camila Cunha', 'camila.cunha@example.com', '987654321', '2001-01-24'),
('13987456321', 'Isabella Martins', 'isabella.martins@example.com', '912345678', '1982-05-10'),
('14253647895', 'Ricardo Santos', 'ricardo.santos@example.com', '987654321', '1993-10-02'),
('15896324785', 'Larissa Oliveira', 'larissa.oliveira@example.com', '912345678', '1989-07-14'),
('16253647896', 'Gustavo Rodrigues', 'gustavo.rodrigues@example.com', '987654321', '1998-04-09');

##Exames
INSERT INTO Exame (nome, descricao, valor) VALUES 
('Ecocardiograma', 'Exame para avaliar o funcionamento do coração', 150.00),
('Colonoscopia', 'Exame para avaliar o intestino grosso', 200.00),
('Ultrassonografia', 'Exame de imagem por ultrassom', 80.00),
('Ressonância Magnética', 'Exame de imagem por ressonância magnética', 300.00),
('Endoscopia', 'Exame para visualizar o trato gastrointestinal', 120.00),
('Tomografia Computadorizada', 'Exame de imagem por tomografia', 250.00),
('Eletrocardiograma', 'Exame para avaliar a atividade elétrica do coração', 70.00),
('Mamografia', 'Exame de imagem para avaliar a mama', 100.00),
('Eletroencefalograma', 'Exame para avaliar a atividade elétrica do cérebro', 90.00),
('Densitometria Óssea', 'Exame para avaliar a densidade dos ossos', 110.00),
('Teste de Esforço', 'Exame para avaliar a capacidade física', 80.00),
('Histerossalpingografia', 'Exame para avaliar o útero e as trompas de falópio', 180.00),
('Holter', 'Exame para monitorar o ritmo cardíaco', 120.00),
('Teste Ergométrico', 'Exame para avaliar o desempenho cardiovascular', 90.00),
('Mapa', 'Exame para monitorar a pressão arterial', 70.00);

##Especialidade
INSERT INTO Especialidade (nome) VALUES
('Dermatologia'),
('Ginecologia'),
('Neurologia'),
('Pediatria'),
('Psiquiatria'),
('Oftalmologia'),
('Urologia'),
('Gastroenterologia'),
('Endocrinologia'),
('Nefrologia'),
('Oncologia'),
('Radiologia');

##Médicos
INSERT INTO Medico (CRM, email, nome, telefone) VALUES
('25896314785', 'bernardo.maia@example.com', 'Bernardo Maia', '987654321'),
('36547821475', 'guilherme.pimentel@example.com', 'Guilherme Pimentel', '912345678'),
('47896512358', 'ana.silva@example.com', 'Ana Silva', '987654321'),
('58214789635', 'carolina.santos@example.com', 'Carolina Santos', '912345678'),
('69852314785', 'rodrigo.rocha@example.com', 'Rodrigo Rocha', '987654321'),
('74589632145', 'lucia.menezes@example.com', 'Lúcia Menezes', '912345678'),
('85236974125', 'pedro.fernandes@example.com', 'Pedro Fernandes', '987654321'),
('96321478536', 'maria.santos@example.com', 'Maria Santos', '912345678'),
('14785236974', 'roberto.rodrigues@example.com', 'Roberto Rodrigues', '987654321'),
('36974125896', 'gabriela.pereira@example.com', 'Gabriela Pereira', '912345678'),
('45896321475', 'juliana.rocha@example.com', 'Juliana Rocha', '987654321'),
('56974125896', 'rafael.melo@example.com', 'Rafael Melo', '912345678');

##Médico_Especialidade
INSERT INTO Medico_Especialidade (CRM, cod_especialidade) VALUES
('25896314785', 1),
('36547821475', 2),
('47896512358', 2),
('58214789635', 3),
('69852314785', 1),
('74589632145', 3),
('85236974125', 2),
('96321478536', 3),
('14785236974', 1),
('36974125896', 2),
('45896321475', 1),
('56974125896', 3),
('85236974125', 1),
('74589632145', 2),
('25896314785', 2);

##Convenio
INSERT INTO Convenio (nome, taxa) VALUES
('Unimed', 0.35),
('SulAmérica', 0.25),
('Bradesco Saúde', 0.3),
('Golden Cross', 0.4),
('NotreDame Intermédica', 0.3),
('Amil Dental', 0.2),
('Porto Seguro', 0.35),
('Hapvida', 0.25),
('Santander Odonto', 0.15),
('Sompo Seguros', 0.35);

##Paciente_Convenio
INSERT INTO Paciente_Convenio (CPF, cod_convenio) VALUES
('02458963321', 1),
('03147852214', 1),
('04789632145', 2),
('05231547896', 2),
('06547896321', 3),
('07125896321', 3),
('08475239684', 4),
('09321478536', 4),
('10253647895', 5),
('11547896325', 5);

##Pedidos
INSERT INTO Pedido (CPF, CRM, cod_convenio, cod_exame, data_hora) VALUES
('02458963321', '25896314785', NULL, 2, '2023-06-19 10:30:00'),
('03147852214', '36547821475', 1, 5, '2023-06-19 14:45:00'),
('04789632145', '47896512358', NULL, 1, '2023-06-19 16:20:00'),
('05231547896', '58214789635', 2, 3, '2023-06-19 11:15:00'),
('06547896321', '69852314785', 1, 6, '2023-06-19 09:00:00'),
('07125896321', '74589632145', NULL, 4, '2023-06-19 13:10:00'),
('08475239684', '85236974125', 1, 8, '2023-06-19 15:30:00'),
('09321478536', '96321478536', NULL, 7, '2023-06-19 17:40:00'),
('10253647895', '14785236974', 2, 10, '2023-06-19 12:30:00'),
('11547896325', '36974125896', 1, 1, '2023-06-19 08:45:00'),
('12253647896', '45896321475', NULL, 9, '2023-06-19 19:15:00'),
('13987456321', '56974125896', 2, 12, '2023-06-19 16:55:00'),
('14253647895', '25896314785', NULL, 11, '2023-06-19 18:25:00'),
('15896324785', '36547821475', 1, 13, '2023-06-19 10:00:00'),
('16253647896', '47896512358', 2, 14, '2023-06-19 14:15:00');


##Querrys

SELECT * FROM Paciente;

SELECT * FROM Exame;

SELECT * FROM Convenio;

SELECT * FROM Especialidade;

SELECT * FROM Medico;

SELECT * FROM Pedido;

SELECT * FROM Medico_Especialidade;

SELECT * FROM Paciente_Convenio;

SELECT Medico.nome AS nome_medico, Especialidade.nome AS nome_especialidade
FROM Medico
JOIN Medico_Especialidade ON Medico.CRM = Medico_Especialidade.CRM
JOIN Especialidade ON Medico_Especialidade.cod_especialidade = Especialidade.cod_especialidade;

SELECT Paciente.CPF, Paciente.nome, IFNULL(Paciente_Convenio.cod_convenio, "Não tem convenio") AS tem_convenio
FROM Paciente
LEFT JOIN Paciente_Convenio ON Paciente.CPF = Paciente_Convenio.CPF;