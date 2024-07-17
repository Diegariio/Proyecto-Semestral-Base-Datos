-- Crear primero las tablas sin claves foráneas
CREATE TABLE Pais (
    PA_CODIGO INTEGER PRIMARY KEY,
    PA_NOMBRE VARCHAR(50)
);
INSERT INTO Pais VALUES
(01, 'Argentina'),
(02, 'Brasil'),
(03, 'Chile'),
(04, 'Colombia'),
(05, 'Ecuador'),
(06, 'Perú'),
(07, 'Uruguay'),
(08, 'Paraguay'),
(09, 'Venezuela'),
(010, 'Bolivia');

CREATE TABLE Estado_PC (
    EPC_CODIGO INTEGER PRIMARY KEY,
    EPC_DESC VARCHAR(50)
);
INSERT INTO Estado_PC VALUES
(1, 'En Rodaje'),
(2, 'En Edición'),
(3, 'En Producción'),
(4, 'Pre-Producción'),
(5, 'Post-Producción');

CREATE TABLE Tipo_Cine (
    TC_CODIGO INTEGER PRIMARY KEY,
    TC_DESC VARCHAR(50)
);
INSERT INTO Tipo_Cine VALUES
(1, 'Películas'),
(2, 'Cortos'),
(3, 'Animaciones'),
(4, 'Documentales'),
(5, 'Series'),
(6, 'Cine Experimental');

CREATE TABLE Fuente_Finan (
    FF_CODIGO INTEGER PRIMARY KEY,
    FF_DESC VARCHAR(50)
);
INSERT INTO Fuente_Finan VALUES
(1, 'Gobierno'),
(2, 'Productoras Privadas'),
(3, 'Patrocinadores Corporativos'),
(4, 'Subvenciones Culturales');

CREATE TABLE Plataforma (
    PLA_CODIGO INTEGER PRIMARY KEY,
    PLA_DESC VARCHAR(50)
);
INSERT INTO Plataforma VALUES
(100, 'Adobe Premiere Pro'),
(101, 'Final Cut Pro'),
(102, 'Avid Media Composer'),
(103, 'DaVinci Resolve'),
(104, 'Sony Vegas Pro'),
(105, 'Blender'),
(106, 'After Effects'),
(107, 'Maya'),
(108, 'Cinema 4D'),
(109, 'Pro Tools');

CREATE TABLE Plataforma_Dis (
    PD_CODIGO INTEGER PRIMARY KEY,
    PD_NOMBRE VARCHAR(50)
);
INSERT INTO Plataforma_Dis VALUES
(200, 'Netflix'),
(201, 'Disney+'),
(202, 'Amazon Prime Video'),
(203, 'Hulu'),
(204, 'HBO Max'),
(205, 'Apple TV+'),
(206, 'Paramount+'),
(207, 'Peacock'),
(208, 'YouTube'),
(209, 'Google Play Movies & TV');

CREATE TABLE Especialidad (
    ES_CODIGO INTEGER PRIMARY KEY,
    ES_NOMBRE VARCHAR(50)
);
INSERT INTO Especialidad VALUES
(300, 'Artes Marciales'),
(301, 'Baile'),
(302, 'Equitación'),
(303, 'Acrobacias'),
(304, 'Música'),
(305, 'Malabares'),
(306, 'Parkour'),
(307, 'Canto'),
(308, 'Teatro'),
(309, 'Magia');

CREATE TABLE Categoria (
    CA_CODIGO INTEGER PRIMARY KEY,
    CA_NOMBRE VARCHAR(50)
);
INSERT INTO Categoria VALUES
(400, 'Mejor Película'),
(401, 'Mejor Director'),
(402, 'Mejor Actor Principal'),
(403, 'Mejor Actriz Principal'),
(404, 'Mejor Actor de Reparto'),
(405, 'Mejor Actriz de Reparto'),
(406, 'Mejor Guión Original'),
(407, 'Mejor Guión Adaptado'),
(408, 'Mejor Fotografía'),
(409, 'Mejor Diseño de Producción'),
(410, 'Mejor Edición'),
(411, 'Mejor Vestuario'),
(412, 'Mejor Maquillaje y Peinado'),
(413, 'Mejores Efectos Visuales'),
(414, 'Mejor Sonido'),
(415, 'Mejor Banda Sonora Original'),
(416, 'Mejor Película Animada'),
(417, 'Mejor Película Internacional'),
(418, 'Mejor Documental');

CREATE TABLE Banda (
    BA_CODIGO INTEGER PRIMARY KEY,
    BA_NOMBRE VARCHAR(50),
    BA_TIPO_MUSIC VARCHAR(50)
);
INSERT INTO Banda VALUES
(1, 'Echoes of Cinema', 'Orquestal'),
(2, 'Neon Soundtrack', 'Synthwave'),
(3, 'Rhythm and Reels', 'Jazz'),
(4, 'Epic Harmonies', 'Choir'),
(5, 'Acoustic Echo', 'Folk'),
(6, 'Pulse Ensemble', 'Electronic'),
(7, 'Harmony Heights', 'Pop Rock'),
(8, 'Symphonic Waves', 'Classical'),
(9, 'Groove Machine', 'Funk'),
(10, 'Vocal Fusion', 'A cappella');

CREATE TABLE Tema_Musical (
    TM_CODIGO INTEGER PRIMARY KEY,
    TM_NOMBRE VARCHAR(50)
);
INSERT INTO Tema_Musical VALUES
(011, 'Echoes of Time'),
(012, 'Neon Dreams'),
(013, 'Smooth Jazz Nights'),
(014, 'Epic Journey'),
(015, 'Acoustic Serenade'),
(016, 'Pulse of Tomorrow'),
(017, 'Harmonic Groove'),
(018, 'Symphonic Overture'),
(019, 'Funky Beats'),
(0110, 'Vocal Harmony');

CREATE TABLE Rol_Per (
    RP_CODIGO INTEGER PRIMARY KEY,
    RP_DESC VARCHAR(50)
);
INSERT INTO Rol_Per (RP_CODIGO, RP_DESC) VALUES
(1, 'Actor'),
(2, 'Actriz'),
(3, 'Director'),
(4, 'Guionista'),
(5, 'Productor'),
(6, 'Editor'),
(7, 'Cameraman'),
(8, 'Efectos Especiales'),
(9, 'Diseñador de Vestuario'),
(10, 'Maquillador'),
(11, 'Extra');

CREATE TABLE Ciudad (
    CIU_CODIGO INTEGER PRIMARY KEY,
    CIU_NOMBRE VARCHAR(50),
    PA_CODIGO INTEGER,
    FOREIGN KEY (PA_CODIGO) REFERENCES Pais
);
INSERT INTO Ciudad VALUES
(1, 'Santiago', 03),        -- Santiago, Chile (PA_CODIGO = 03)
(2, 'Buenos Aires', 01),    -- Buenos Aires, Argentina (PA_CODIGO = 01)
(3, 'Lima', 06),           	--Lima, Peru (PA_CODIGO = 06)
(4, 'Bogotá', 04),
(5,'Concepcion', 03),
(6, 'Montevideo',07),
(7, 'Caracas', 09);


CREATE TABLE Persona (
    PER_CODIGO INTEGER PRIMARY KEY,
    PER_NOMBRE VARCHAR(255),
    PER_FECHA_NAC DATE,
    PER_NACIONALIDAD VARCHAR(255),
    PER_TELEFONO VARCHAR(50),
    PER_EMAIL VARCHAR(255),
    RP_CODIGO INTEGER,
    CIU_CODIGO INTEGER,
    FOREIGN KEY (CIU_CODIGO) REFERENCES Ciudad,
    FOREIGN KEY (RP_CODIGO) REFERENCES Rol_Per
);
INSERT INTO Persona (PER_CODIGO, PER_NOMBRE, PER_FECHA_NAC, PER_NACIONALIDAD, PER_TELEFONO, PER_EMAIL, RP_CODIGO, CIU_CODIGO) VALUES --especificacion de columnas para evitar confusiones
(1, 'Juan Pérez', '1980-05-15', 'Chilena', '+56 9 12345678', 'juan.perez@example.com', 1, 1),    -- Juan Pérez, Actor, Santiago (CIU_CODIGO = 1)
(2, 'María López', '1975-10-20', 'Argentina', '+54 9 98765432', 'maria.lopez@example.com', 2, 2),  -- María López, Actriz, Buenos Aires (CIU_CODIGO = 2)
(3, 'Diego Torres', '1988-03-25', 'Peruana', '+51 9 87654321', 'diego.torres@example.com', 3, 3),   -- Diego Torres, Director, Lima (CIU_CODIGO = 3)
(4, 'Ana Gómez', '1995-08-10', 'Colombiana', '+57 9 23456789', 'ana.gomez@example.com', 4, 4),    -- Ana Gómez, Guionista, Bogotá (CIU_CODIGO = 4)
(5, 'Luisa Martínez', '1990-07-12', 'Chilena', '+56 9 55555555', 'luisa.martinez@example.com', 11, 1),    -- Luisa Martínez, Actor, Santiago (CIU_CODIGO = 1)
(6, 'Carlos Rodríguez', '1985-04-28', 'Argentina', '+54 9 44444444', 'carlos.rodriguez@example.com', 11, 2),  -- Carlos Rodríguez, Actriz, Buenos Aires (CIU_CODIGO = 2)
(7, 'Elena Pérez', '1992-01-05', 'Peruana', '+51 9 33333333', 'elena.perez@example.com', 3, 3),   -- Elena Pérez, Director, Lima (CIU_CODIGO = 3)
(8, 'Andrés Gómez', '1987-09-20', 'Colombiana', '+57 9 22222222', 'andres.gomez@example.com', 4, 4),    -- Andrés Gómez, Guionista, Bogotá (CIU_CODIGO = 4)
(9, 'Martina Fernández', '1983-12-15', 'Chilena', '+56 9 66666666', 'martina.fernandez@example.com', 1, 5),    -- Martina Fernández, Actor, Santiago (CIU_CODIGO = 1)
(10, 'Diego Silva', '1980-08-30', 'Argentina', '+54 9 77777777', 'diego.silva@example.com', 2, 2),  -- Diego Silva, Actriz, Buenos Aires (CIU_CODIGO = 2)
(11, 'Valeria Torres', '1989-03-10', 'Peruana', '+51 9 88888888', 'valeria.torres@example.com', 3, 3),   -- Valeria Torres, Director, Lima (CIU_CODIGO = 3)
(12, 'Roberto Ramírez', '1984-06-25', 'Colombiana', '+57 9 99999999', 'roberto.ramirez@example.com', 4, 4);    -- Roberto Ramírez, Guionista, Bogotá (CIU_CODIGO = 4)

CREATE TABLE Academia (
    AC_CODIGO INTEGER PRIMARY KEY,
    AC_NOMBRE VARCHAR(50),
    PA_CODIGO INTEGER,
    FOREIGN KEY (PA_CODIGO) REFERENCES Pais
);
INSERT INTO Academia (AC_CODIGO, AC_NOMBRE, PA_CODIGO) VALUES
(2, 'Academia de Artes Escénicas Buenos Aires', 01),     -- Academia de Artes Escénicas en Buenos Aires, Argentina (PA_CODIGO = 1)
(3, 'Teatro Nacional de Lima', 06),                      -- Teatro Nacional de Lima, Perú (PA_CODIGO = 6)
(4, 'Instituto de Teatro Bogotá', 04),                   -- Instituto de Teatro en Bogotá, Colombia (PA_CODIGO = 4)
(5, 'Academia de Actuación Santiago', 03);               -- Academia de Actuación en Santiago, Chile (PA_CODIGO = 3)    

CREATE TABLE Premiacion (
    PRE_CODIGO INTEGER PRIMARY KEY,
    PRE_NOMBRE VARCHAR(50),
    PRE_ANO INTEGER,
    CIU_CODIGO INTEGER,
    FOREIGN KEY (CIU_CODIGO) REFERENCES Ciudad
);
INSERT INTO Premiacion (PRE_CODIGO, PRE_NOMBRE, PRE_ANO, CIU_CODIGO) VALUES
(11, 'Oscar 2024', 2024, 5),          -- Oscar 2024 en Ciudad de México (CIU_CODIGO = 5)
(21, 'Golden Globe Awards 2024', 2024, 6), -- Golden Globe Awards 2024 en Montevideo (CIU_CODIGO = 6)
(31, 'MTV Movie & TV Awards 2024', 2024, 2), -- MTV Movie & TV Awards 2024 en Buenos Aires (CIU_CODIGO = 2)
(41, 'BAFTA Awards 2024', 2024, 1),   -- BAFTA Awards 2024 en Buenos Aires (CIU_CODIGO = 1)
(51, 'Festival de Cine de Lima 2024', 2024, 3), -- Festival de Cine de Lima 2024 en Lima (CIU_CODIGO = 3)
(61, 'Premios Goya 2024', 2024, 2),   -- Premios Goya 2024 en Buenos Aires (CIU_CODIGO = 2)
(71, 'Festival Internacional de Cine de Cartagena 2024', 2024, 4), -- Festival Internacional de Cine de Cartagena 2024 en Bogotá (CIU_CODIGO = 4)
(81, 'Sundance Film Festival 2024', 2024, 5); -- Sundance Film Festival 2024 en Concepcion (CIU_CODIGO = 6)

CREATE TABLE Locacion (
    LOC_CODIGO INTEGER PRIMARY KEY,
    LOC_DESC VARCHAR(50),
    CIU_CODIGO INTEGER,
    FOREIGN KEY (CIU_CODIGO) REFERENCES Ciudad
);
INSERT INTO Locacion (LOC_CODIGO, LOC_DESC, CIU_CODIGO) VALUES
(1, 'Estudio Santiago', 1),         -- Estudio en Santiago, Chile (CIU_CODIGO = 1)
(2, 'Centro Buenos Aires', 2),      -- Centro en Buenos Aires, Argentina (CIU_CODIGO = 2)
(3, 'Estudio Lima', 3),             -- Estudio en Lima, Perú (CIU_CODIGO = 3)
(4, 'Estudio Bogotá', 4),           -- Estudio en Bogotá, Colombia (CIU_CODIGO = 4)
(5, 'Centro Concepción', 5),        -- Centro en Concepción, Chile (CIU_CODIGO = 5)
(6, 'Centro Montevideo', 6),        -- Centro en Montevideo, Uruguay (CIU_CODIGO = 6)
(7, 'Centro Caracas', 7);    

CREATE TABLE Pieza_Cine (
    PC_CODIGO INTEGER PRIMARY KEY,
    PC_NOMBRE VARCHAR(50),
    PC_FECHA_IN DATE,
    PC_FECHA_FIN DATE,
    TC_CODIGO INTEGER,
    FOREIGN KEY (TC_CODIGO) REFERENCES Tipo_Cine
);
-- Insertar las películas en la tabla Pieza_Cine
INSERT INTO Pieza_Cine VALUES
(50426, 'Shrek 2', '01/07/2002', '01/07/2003', 3),
(50427, 'The Dark Knight', '18/07/2008', '18/07/2009', 5),
(50428, 'Inception', '16/07/2010', '16/07/2011', 6),
(50429, 'Toy Story 3', '18/06/2010', '18/06/2011', 3),
(50430, 'Avatar', '18/12/2009', '18/12/2010', 1),
(50431, 'The Avengers', '04/05/2012', '04/05/2013', 1);

CREATE TABLE Requiere (
    PLA_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    FECHA_INICIO DATE,
    COSTO INTEGER,
    FECHA_FIN DATE,
    PRIMARY KEY (PLA_CODIGO, PC_CODIGO),
    FOREIGN KEY (PLA_CODIGO) REFERENCES Plataforma,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Requiere (PLA_CODIGO, PC_CODIGO, FECHA_INICIO, COSTO, FECHA_FIN) VALUES
(100, 50426, '01/07/2002', 5000, '01/07/2003'),   -- Adobe Premiere Pro para Shrek 2
(101, 50427, '18/07/2008', 7000, '18/07/2009'),   -- Final Cut Pro para The Dark Knight
(102, 50428, '16/07/2010', 6000, '16/07/2011'),   -- Avid Media Composer para Inception
(100, 50429, '18/06/2010', 5500, '18/06/2011'),   -- Adobe Premiere Pro para Toy Story 3
(103, 50430, '18/12/2009', 6500, '18/12/2010'),   -- DaVinci Resolve para Avatar
(103, 50431, '04/05/2012', 7200, '04/05/2013');   -- DaVinci Resolve para The Avengers

CREATE TABLE Distribuye (
    PD_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    VALOR INTEGER,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    CLAUSULA VARCHAR(50),
    PRIMARY KEY (PD_CODIGO, PC_CODIGO),
    FOREIGN KEY (PD_CODIGO) REFERENCES Plataforma_Dis,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Distribuye (PD_CODIGO, PC_CODIGO, VALOR, FECHA_INICIO, FECHA_FIN, CLAUSULA) VALUES
(200, 50426, 1500, '01/07/2003', '01/07/2004', 'Distribución en América Latina'),
(201, 50427, 2000, '18/07/2009', '18/07/2010', 'Distribución en Estados Unidos'),
(202, 50428, 1800, '16/07/2011', '16/07/2012', 'Distribución en Europa'),
(200, 50429, 1600, '18/06/2011', '18/06/2012', 'Distribución en América Latina'),
(203, 50430, 2200, '18/12/2010', '18/12/2011', 'Distribución en Asia'),
(203, 50431, 2100, '04/05/2013', '04/05/2014', 'Distribución en Asia');


CREATE TABLE Tiene (
    EPC_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    PRIMARY KEY (EPC_CODIGO, PC_CODIGO),
    FOREIGN KEY (EPC_CODIGO) REFERENCES Estado_PC,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Tiene (EPC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(1, 50426, '01/08/2002', '01/07/2003'),   -- Estado 1 para Shrek 2
(2, 50427, '18/08/2008', '18/07/2009'),   -- Estado 2 para The Dark Knight
(3, 50428, '16/08/2010', '16/07/2011'),   -- Estado 3 para Inception
(2, 50429, '18/09/2010', '18/06/2011'),   -- Estado 2 para Toy Story 3
(1, 50430, '19/12/2009', '18/12/2010'),   -- Estado 1 para Avatar
(3, 50431, '14/05/2012', '04/05/2013');   -- Estado 3 para The Avengers

CREATE TABLE Financia (
    FF_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    MONTO_FIN INTEGER,
    PRIMARY KEY (FF_CODIGO, PC_CODIGO),
    FOREIGN KEY (FF_CODIGO) REFERENCES Fuente_Finan,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Financia (FF_CODIGO, PC_CODIGO, MONTO_FIN) VALUES
(1, 50426, 1000000),   -- Fuente de financiamiento 1 para Shrek 2
(2, 50427, 1500000),   -- Fuente de financiamiento 2 para The Dark Knight
(3, 50428, 1200000),   -- Fuente de financiamiento 3 para Inception
(1, 50429, 900000),    -- Fuente de financiamiento 1 para Toy Story 3
(4, 50430, 1800000),   -- Fuente de financiamiento 4 para Avatar
(1, 50431, 2000000);   -- Fuente de financiamiento 5 para The Avengers

CREATE TABLE Presenta (
    CA_CODIGO INTEGER,
    PRE_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    OBTENCION BOOLEAN,
    PRIMARY KEY (CA_CODIGO, PRE_CODIGO, PC_CODIGO),
    FOREIGN KEY (CA_CODIGO) REFERENCES Categoria,
    FOREIGN KEY (PRE_CODIGO) REFERENCES Premiacion,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Presenta (CA_CODIGO, PRE_CODIGO, PC_CODIGO, OBTENCION) VALUES
(401, 11, 50426, true),   
(402, 21, 50427, false), 
(403, 51, 50428, true),  
(404, 71, 50429, false),  
(405, 11, 50430, true);   

CREATE TABLE Suena (
    BA_CODIGO INTEGER,
    TM_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    PRIMARY KEY (BA_CODIGO, TM_CODIGO, PC_CODIGO),
    FOREIGN KEY (BA_CODIGO) REFERENCES Banda,
    FOREIGN KEY (TM_CODIGO) REFERENCES Tema_Musical,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Suena (BA_CODIGO, TM_CODIGO, PC_CODIGO) VALUES
(1, 011, 50426),   
(2, 014, 50427),   
(3, 013, 50428),   
(4, 017, 50429),  
(5, 012, 50430);   

CREATE TABLE Dirige (
    PC_CODIGO INTEGER,
    PER_CODIGO INTEGER,
    PRIMARY KEY (PC_CODIGO, PER_CODIGO),
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine,
    FOREIGN KEY (PER_CODIGO) REFERENCES Persona
);
INSERT INTO Dirige (PC_CODIGO, PER_CODIGO) VALUES
(50426, 3),  -- Persona 3 dirige la pieza de cine 50426
(50429, 7),  -- Persona 7 dirige la pieza de cine 50429
(50428, 4),  -- Persona 4 dirige la pieza de cine 50428
(50430, 8);  -- Persona 8 dirige la pieza de cine 50430

CREATE TABLE Participa (
    PER_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    MONTO INTEGER,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    PRIMARY KEY (PER_CODIGO, PC_CODIGO),
    FOREIGN KEY (PER_CODIGO) REFERENCES Persona,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Participa (PER_CODIGO, PC_CODIGO, MONTO, FECHA_INICIO, FECHA_FIN) VALUES
(1, 50426, 10000, '01/10/2002', '01/07/2003'),  -- Persona 1 participa en la pieza de cine 50426 con un monto de 10000
(2, 50430, 12000, '30/12/2009', '18/12/2010'),  -- Persona 2 participa en la pieza de cine 50430 con un monto de 12000
(5, 50428, 15000, '16/10/2010', '16/07/2011'),  -- Persona 5 participa en la pieza de cine 50428 con un monto de 15000
(6, 50431, 13000, '04/10/2012', '04/05/2013');  -- Persona 6 participa en la pieza de cine 50431 con un monto de 13000

CREATE TABLE Realiza (
    ES_CODIGO INTEGER,
    PER_CODIGO INTEGER,
    PRIMARY KEY (ES_CODIGO, PER_CODIGO),
    FOREIGN KEY (ES_CODIGO) REFERENCES Especialidad,
    FOREIGN KEY (PER_CODIGO) REFERENCES Persona
);
INSERT INTO Realiza (ES_CODIGO, PER_CODIGO) VALUES
(300, 1),  -- La persona 1 realiza la especialidad 300
(301, 2),  -- La persona 2 realiza la especialidad 301
(302, 5),  -- La persona 5 realiza la especialidad 302
(303, 6);  -- La persona 6 realiza la especialidad 303

CREATE TABLE Estudia (
    AC_CODIGO INTEGER,
    PER_CODIGO INTEGER,
    PRIMARY KEY (AC_CODIGO, PER_CODIGO),
    FOREIGN KEY (AC_CODIGO) REFERENCES Academia,
    FOREIGN KEY (PER_CODIGO) REFERENCES Persona
);
INSERT INTO Estudia (AC_CODIGO, PER_CODIGO) VALUES
(5, 1),  -- La persona 1 estudia en la academia 5
(2, 2),  -- La persona 2 estudia en la academia 2
(3, 3),  -- La persona 3 estudia en la academia 3
(4, 4);  -- La persona 4 estudia en la academia 4


CREATE TABLE Estrena (
    LOC_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    PRIMARY KEY (LOC_CODIGO, PC_CODIGO),
    FOREIGN KEY (LOC_CODIGO) REFERENCES Locacion,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);
INSERT INTO Estrena (LOC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(1, 50426, '2024-05-01', '2024-05-15'),  -- La pieza de cine 50426 se estrena en la locación 1 desde 2024-05-01 hasta 2024-05-15
(2, 50430, '2024-06-01', '2024-06-15'),  -- La pieza de cine 50430 se estrena en la locación 2 desde 2024-06-01 hasta 2024-06-15
(3, 50429, '2024-07-01', '2024-07-15'),  -- La pieza de cine 50429 se estrena en la locación 3 desde 2024-07-01 hasta 2024-07-15
(4, 50428, '2024-08-01', '2024-08-15');  -- La pieza de cine 50428 se estrena en la locación 4 desde 2024-08-01 hasta 2024-08-15

CREATE TABLE Se_Filma (
    LOC_CODIGO INTEGER,
    PC_CODIGO INTEGER,
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    PRIMARY KEY (LOC_CODIGO, PC_CODIGO),
    FOREIGN KEY (LOC_CODIGO) REFERENCES Locacion,
    FOREIGN KEY (PC_CODIGO) REFERENCES Pieza_Cine
);

INSERT INTO Se_Filma (LOC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(2, 50427, '2024-03-01', '2024-03-15'),  -- La pieza de cine 50427 se filma en la locación 1 desde 2024-03-01 hasta 2024-03-15
(2, 50429, '2024-04-01', '2024-04-15'),  -- La pieza de cine 50429 se filma en la locación 2 desde 2024-04-01 hasta 2024-04-15
(3, 50431, '2024-05-01', '2024-05-15'),  -- La pieza de cine 50431 se filma en la locación 3 desde 2024-05-01 hasta 2024-05-15
(4, 50426, '2024-06-01', '2024-06-15');  -- La pieza de cine 50426 se filma en la locación 4 desde 2024-06-01 hasta 2024-06-15


--MAS DATOS PARA QUE Q1 ENTREGUE UNA RESPUESTA
INSERT INTO Estrena (LOC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(1, 50427, '2024-05-01', '2024-05-02'),
(3, 50430, '2024-06-01', '2024-06-03'),
(4, 50430, '2024-07-01', '2024-07-01'),
(5, 50427, '2024-02-01', '2024-05-01'),
(6, 50427, '2024-03-01', '2024-03-05');
INSERT INTO Se_Filma (LOC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(5, 50430, '2024-05-01', '2024-05-22'),
(7, 50430, '2024-06-01', '2024-06-24'),
(7, 50427, '2024-07-01', '2024-07-25');
INSERT INTO Se_Filma (LOC_CODIGO, PC_CODIGO, FECHA_INICIO, FECHA_FIN) VALUES
(2, 50430, '2024-05-01', '2024-05-22');

/* Q1: Por cada pieza de cine que no es animada, mostrar el codigo y nombre de la pieza y cantidad total de
locaciones utilizadas por la pieza de cine, considere locaciones de filmaci´on y estreno. Muestre aquellas
piezas cinematogr´aficas con m´as de 4 locaciones. TIP: utilice vistas y funciones de agregaci´on.*/

CREATE VIEW vista_locaciones_por_pieza AS
SELECT PC_CODIGO, COUNT(*) AS total_locaciones
FROM (		--Usamos una subconsulta
    SELECT DISTINCT PC_CODIGO, LOC_CODIGO FROM Se_Filma --consulta
    UNION   --unimos las filas de las 2 consultas dentro de la subconsulta, con union que elimina los duplicados
    SELECT DISTINCT PC_CODIGO, LOC_CODIGO FROM Estrena  --consulta
) AS locaciones_union
GROUP BY PC_CODIGO; --obtenemos una vista con el codigo de una pieza de cine y la cantidad de locaciones utilizadas

SELECT PC.PC_CODIGO, PC.PC_NOMBRE, VL.total_locaciones
FROM Pieza_Cine PC JOIN vista_locaciones_por_pieza VL ON PC.PC_CODIGO = VL.PC_CODIGO --igualamos el codigo de las piezas de cine con la vista anterior
WHERE PC.TC_CODIGO != 3 AND VL.total_locaciones > 4; -- con la condicion de que no sean animadas y el total de locaciones debe ser mayor a 4 


/*Q2: Mostrar por cada pieza de cine el codigo, nombre, rol de personas que participan y total de personas por
cada rol. Considere personas que no estudian en academias y no son el director/es de la pieza y viven en
US. Considere solo piezas que est´an en estado de edici´on actualmente y son del tipo ”cortos”.*/

