CREATE DATABASE Equipo2_final;

USE Equipo2_final;

CREATE TABLE Paciente (
idPaciente INT NOT NULL,
FName VARCHAR(32),
LName VARCHAR(32),
sexo CHAR,
email VARCHAR(32),
Fechanacimiento DATE,
PRIMARY KEY(idPaciente)
);

CREATE TABLE Doctor (
idDoctor INT NOT NULL,
cedula INT NOT NULL,
FName VARCHAR(32),
LName VARCHAR(32),
PRIMARY KEY(idDoctor)
);

CREATE TABLE Consulta (
idConsulta INT NOT NULL,
idPaciente INT NOT NULL,
idDoctor INT NOT NULL,
fecha DATE NOT NULL,
costo INT NOT NULL,
peea VARCHAR(200) NOT NULL,
PRIMARY KEY (idConsulta),
FOREIGN KEY(idPaciente) REFERENCES PACIENTE (idPaciente),
FOREIGN KEY(idDoctor) REFERENCES doctor (idDoctor)
);


CREATE TABLE Prueba (
idPrueba INT NOT NULL,
nombre VARCHAR(32) NOT NULL,
PRIMARY KEY (idPrueba)
);

CREATE TABLE Pregunta (
idPregunta INT NOT NULL,
texto VARCHAR(2000),
idPrueba INT NOT NULL,
PRIMARY KEY (idPregunta),
FOREIGN KEY(idPrueba) REFERENCES Prueba(idPrueba)
);

CREATE TABLE Instancia_Prueba(
idInstancia_Prueba INT NOT NULL,
idConsulta INT NOT NULL,
idPrueba INT NOT NULL,
PRIMARY KEY(idInstancia_Prueba),
FOREIGN KEY(idConsulta) REFERENCES Consulta(idConsulta),
FOREIGN KEY (idPrueba) REFERENCES Prueba(idPrueba)
);

CREATE TABLE Respuesta (
idRespuesta INT NOT NULL,
idInstancia_Prueba INT NOT NULL,
idPregunta INT NOT NULL,
valor INT NOT NULL,
PRIMARY KEY(idRespuesta),
FOREIGN KEY(idPregunta) REFERENCES Pregunta(idPregunta),
FOREIGN KEY(idInstancia_Prueba) REFERENCES Instancia_Prueba(idInstancia_Prueba)
);


CREATE TABLE Diagnostico (
idDiagnostico INT not null,
DiagnosticoFrecuente INT,
ICD9CM VARCHAR(23),
ICD10CM VARCHAR(23),
DSM5 VARCHAR(269),
primary key (idDiagnostico)
);

CREATE TABLE Diagnostico_consulta(
idConsulta INT NOT NULL,
idDiagnostico INT NOT NULL,

PRIMARY KEY(idConsulta, idDiagnostico),
FOREIGN KEY(idConsulta) REFERENCES Consulta(idConsulta),
FOREIGN KEY(idDiagnostico) REFERENCES Diagnostico(idDiagnostico)
);


CREATE TABLE Medicamento (
IDMedicamento INT NOT NULL,
Nombre VARCHAR(13),
Presentacion VARCHAR(14),
miligramos VARCHAR(14),
numero VARCHAR(6),
SustanciaActiva VARCHAR(97),
uso VARCHAR(108),
PRIMARY KEY (idmedicamento)
);

    
CREATE TABLE Receta (
idReceta int not null,
idConsulta INT not null,
idMedicamento INT not null,
primary key (idReceta),
foreign key(idMedicamento) references Medicamento(idMedicamento),
foreign key(idConsulta) references Consulta (idConsulta)
);
