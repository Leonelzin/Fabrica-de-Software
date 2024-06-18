CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE Dependente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Video (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL
);

CREATE TABLE Ator (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeReal VARCHAR(255) NOT NULL,
    bibliografia TEXT,
    dataNascimento DATE
);

CREATE TABLE Historico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT,
    idVideo INT,
    dataAssistida DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    FOREIGN KEY (idVideo) REFERENCES Video(id)
);

CREATE TABLE Video_Ator (
    idVideo INT,
    idAtor INT,
    FOREIGN KEY (idVideo) REFERENCES Video(id),
    FOREIGN KEY (idAtor) REFERENCES Ator(id),
    PRIMARY KEY (idVideo, idAtor)
);
