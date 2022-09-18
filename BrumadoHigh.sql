DROP DATABASE IF EXISTS BrumadoHigh;
CREATE DATABASE IF NOT EXISTS BrumadoHigh;
USE BrumadoHigh;

CREATE TABLE IF NOT EXISTS Docente (
	id					 INT 		 NOT NULL AUTO_INCREMENT,
    nome				 VARCHAR(30) NOT NULL,
    sobrenome			 VARCHAR(30) NOT NULL,
    cpf					 VARCHAR(11) NOT NULL,
    rg					 VARCHAR(13) NOT NULL,
    data_de_nascimento	 DATE 		 NOT NULL,
    matricula			 VARCHAR(11) NOT NULL,
    telefone_principal	 VARCHAR(11) NOT NULL,
    telefone_secundario  VARCHAR(11) NULL,
    email_institucional	 VARCHAR(11) NOT NULL,
    email_principal		 VARCHAR(99) NOT NULL,
    email_secundario	 VARCHAR(99) NULL,    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Estudante (
	id					 INT 		 NOT NULL AUTO_INCREMENT,
    nome				 VARCHAR(30) NOT NULL,
    sobrenome			 VARCHAR(30) NOT NULL,
    cpf					 VARCHAR(11) NOT NULL,
    rg					 VARCHAR(13) NOT NULL,
    data_de_nascimento	 DATE 		 NOT NULL,
    matricula			 VARCHAR(11) NOT NULL,
    telefone_principal	 VARCHAR(11) NOT NULL,
    telefone_secundario  VARCHAR(11) NULL,
    email_principal		 VARCHAR(99) NOT NULL,
    email_secundario	 VARCHAR(99) NULL,    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Responsavel (
	id					 INT 		 NOT NULL AUTO_INCREMENT,
    nome				 VARCHAR(30) NOT NULL,
    sobrenome			 VARCHAR(30) NOT NULL,
    cpf					 VARCHAR(11) NOT NULL,
    rg					 VARCHAR(13) NOT NULL,
    data_de_nascimento	 DATE		 NOT NULL,
	telefone_principal	 VARCHAR(11) NOT NULL,
    telefone_secundario  VARCHAR(11) NULL,
	email_principal		 VARCHAR(99) NOT NULL,
    email_secundario	 VARCHAR(99) NULL,    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Turma (
	id					 INT 		 NOT NULL AUTO_INCREMENT,
    nome				 VARCHAR(30) NOT NULL,
    codigo				 VARCHAR(15) NOT NULL,
    serie				 TINYINT	 NOT NULL, -- a série em que a turma se encontra
    ano					 SMALLINT	 NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Disciplina (
	id					 INT 		 NOT NULL AUTO_INCREMENT,
    nome				 VARCHAR(30) NOT NULL,
    codigo				 VARCHAR(15) NOT NULL,
    serie				 TINYINT	 NOT NULL, -- a série da disciplina na matriz curricular
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Turma_Disciplina (
	id_Turma			 INT 		 NOT NULL,
    id_Disciplina		 INT 		 NOT NULL,
    FOREIGN KEY (id_Turma) REFERENCES Turma(id),
    FOREIGN KEY (id_Disciplina) REFERENCES Disciplina(id)
);

CREATE TABLE IF NOT EXISTS Estudante_Turma (
    id_Estudante		 		INT 		 NOT NULL,
	id_Turma			 		INT 		 NOT NULL,
    FOREIGN KEY (id_Estudante)	REFERENCES Estudante(id),
    FOREIGN KEY (id_Turma)		REFERENCES Turma(id)
);

CREATE TABLE IF NOT EXISTS Docente_Disciplina (
    id_Docente		 			INT 		 NOT NULL,
	id_Disciplina				INT 		 NOT NULL,
    ano							YEAR		 NOT NULL,
    FOREIGN KEY (id_Docente)	REFERENCES Docente(id),
    FOREIGN KEY (id_Disciplina)	REFERENCES Disciplina(id)
);

ALTER TABLE Estudante ADD id_Responsavel_1 INT NOT NULL;
ALTER TABLE Estudante ADD id_Responsavel_2 INT NOT NULL;
ALTER TABLE Estudante ADD FOREIGN KEY (id_Responsavel_1) REFERENCES Responsavel(id);
ALTER TABLE Estudante ADD FOREIGN KEY (id_Responsavel_2) REFERENCES Responsavel(id);

ALTER TABLE Docente MODIFY  email_institucional VARCHAR(99);

INSERT INTO Docente(id, nome,sobrenome,cpf,rg,data_de_nascimento,telefone_principal,telefone_secundario,email_principal,email_secundario,matricula, email_institucional)
VALUES
	(2000, "Anderson","de Souza Álvares","51125636940","56130641990","1976-08-01","10912345678",NULL,"Anderson@brumail.com",NULL,"509254367", "anderson@bruhigh.com"),
	(DEFAULT, "Alanderson","de Souza Álvares","51225636940","53130641990","1976-08-01","10822345678",NULL,"Alanderson@brumail.com",NULL,"0409254367", "alanderson@bruhigh.com"),
	(DEFAULT, "Christianne","Bastos Araújo","60410062713","65415067763","1996-02-15","21912121993",NULL,"Christianne@brumail.com",NULL,"60298625", "christianne@bruhigh.com"),
	(DEFAULT, "Carina","Mata Araújo","35088492731","40093497781","1963-01-29","32912111993",NULL,"Carina@brumail.com",NULL,"348882925", "carinamata@bruhigh.com");

INSERT INTO Responsavel(id, nome,sobrenome,cpf,rg,data_de_nascimento,telefone_principal,telefone_secundario,email_principal,email_secundario)
VALUES
	(1000, "Cristiane","Mello Araújo","34413289724","39418294774","1974-04-26","18912151994",NULL,"Cristiane@brumail.com",NULL),
	(DEFAULT, "Cornélio","Siqueira Araújo","79394254660","843992596110","1984-07-02","75999121998",NULL,"Cornélio@brumail.com",NULL),
	(DEFAULT, "Armindo","Sirqueira Araújo","73994381912","78999386962","1957-08-14","77999161998",NULL,"Armindo@brumail.com",NULL),
	(DEFAULT, "Janice","Aguiar Bastos","74443575571","794485805121","1968-08-13","13999161999",NULL,"Janice@brumail.com",NULL),
	(DEFAULT, "Gilda","de Jesus Bastos","48920444198","539254491148","1977-05-28","71999161997",NULL,"Gilda@brumail.com",NULL),
	(DEFAULT, "Helena","Gomes Bastos","64322637537","69327642587","1996-12-11","10989901991",NULL,"Helena@brumail.com",NULL),
	(DEFAULT, "Gertrudes","Lima Bastos","63877958910","68882963960","1963-11-25","21999191998",NULL,"Gertrudes@brumail.com",NULL);

INSERT INTO Estudante(id, nome,sobrenome,cpf,rg,data_de_nascimento,telefone_principal,telefone_secundario,email_principal,email_secundario, matricula, id_Responsavel_1, id_Responsavel_2)
VALUES
	(3000, "Finneas","Meira Bastos","79210010019","84215015069","1975-02-20","32999171999",NULL,"Finneas@brumail.com",NULL,"7909898", 1000, 1001),
	(DEFAULT, "Giselly","Melo Bastos","11110064810","16115069860","1985-04-28","18999181995",NULL,"Giselly@brumail.com",NULL,"10998646", 1000, 1002),
	(DEFAULT, "Fernanda","Pedreira Bastos","76877972041","81882977091","1958-06-10","75989941992",NULL,"Fernanda@brumail.com",NULL,"766777718", 1000, 1001),
	(DEFAULT, "Gabrielly","Sarmento Bastos","67443321955","724483269105","1969-06-09","77999202000",NULL,"Gabrielly@brumail.com",NULL,"672431217", 1000, 1001);

INSERT INTO Turma
VALUES
	(9000, 	  '3º Ano A Vespertino', '2022VES3A', 3, 2022), 
	(default, '3º Ano A Matutino',   '2022MAT3A', 3, 2022), 
	(default, '1º Ano A Vespertino', '2022VES1A', 1, 2022), 
	(default, '2º Ano A Vespertino', '2022VES2A', 2, 2022);

INSERT INTO Disciplina
VALUES
	(7000, 'Matemática', 'MAT3EM', 3),
	(default, 'Matemática', 'MAT2EM', 2),
	(default, 'Matemática', 'MAT1EM', 1),
	(default, 'Geografia', 'GEO3EM', 3),
	(default, 'Biologia', 'BIO3EM', 3),
	(default, 'História', 'HIS2EM', 2);

INSERT INTO Docente_Disciplina (id_Docente, id_Disciplina,ano)
VALUES
	(2000,7000,2011),
	(2000,7000,2012),
	(2000,7000,2013),
	(2000,7000,2017),
	(2001,7004,2017),
	(2001,7004,2016),
	(2001,7004,2012),
	(2001,7004,2014),
	(2001,7004,2013);

INSERT INTO Estudante_Turma 
VALUES
	(3000, 9000), 
	(3001, 9000), 
	(3002, 9000), 
	(3003, 9000);
    
INSERT INTO Turma_Disciplina
VALUES
	(9000, 7000),
    (9001, 7000),
    (9002, 7001),
    (9001, 7003),
    (9002, 7005),
    (9000, 7003);

SELECT count(d.id) FROM Disciplina d;

SELECT  * FROM Disciplina d WHERE nome = 'Matemática';

SELECT * FROM Estudante e
WHERE data_de_nascimento
BETWEEN '1960-01-01' AND '1985-12-31'
ORDER BY data_de_nascimento; -- Padrão = ASC

SELECT max(data_de_nascimento)
FROM estudante e;

USE BrumadoHigh;

SELECT concat(nome, " ", sobrenome) AS 'Estudante' FROM Estudante;