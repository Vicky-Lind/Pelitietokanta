
CREATE TABLE Kaveri (
                KaveriID INT IDENTITY NOT NULL,
                Etunimi VARCHAR(20) NOT NULL,
                Sukunimi VARCHAR(20) NOT NULL,
                CONSTRAINT Kaveri_pk PRIMARY KEY (KaveriID)
)

CREATE TABLE Alusta (
                AlustaID INT IDENTITY NOT NULL,
                AlustanNimi VARCHAR(20) NOT NULL,
                CONSTRAINT Alusta_pk PRIMARY KEY (AlustaID)
)

CREATE TABLE Ikaryhma (
                IkaryhmaID INT IDENTITY NOT NULL,
                IkaryhmaTeksti VARCHAR(20) NOT NULL,
                CONSTRAINT Ikaryhma_pk PRIMARY KEY (IkaryhmaID)
)

CREATE TABLE Genre (
                GenreID INT IDENTITY NOT NULL,
                GenreNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Genre_pk PRIMARY KEY (GenreID)
)

CREATE TABLE Julkaisija (
                JulkaisijaID INT IDENTITY NOT NULL,
                JulkaisijaNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Julkaisija_pk PRIMARY KEY (JulkaisijaID)
)

CREATE TABLE Peli (
                PeliID INT IDENTITY NOT NULL,
                Nimi VARCHAR(30) NOT NULL,
                JulkaisijaID INT NOT NULL,
                GenreID INT NOT NULL,
                IkaryhmaID INT NOT NULL,
                CONSTRAINT Peli_pk PRIMARY KEY (PeliID)
)

CREATE TABLE Pisteet (
                KaveriID INT NOT NULL,
                PeliID INT NOT NULL,
                Maksimipisteet INT NOT NULL,
                Paivamaara DATETIME,
                CONSTRAINT Pisteet_pk PRIMARY KEY (KaveriID, PeliID)
)

CREATE TABLE Pelialusta (
                PeliID INT NOT NULL,
                AlustaID INT NOT NULL,
                Muistinmaara INT,
                Tallennustila INT,
                NaytonOhjain VARCHAR(100),
                Prosessori VARCHAR(20),
                CONSTRAINT Pelialusta_pk PRIMARY KEY (PeliID, AlustaID)
)

ALTER TABLE Pisteet ADD CONSTRAINT Kaveri_Pisteet_fk
FOREIGN KEY (KaveriID)
REFERENCES Kaveri (KaveriID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Alusta_Pelialusta_fk
FOREIGN KEY (AlustaID)
REFERENCES Alusta (AlustaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Ikaryhma_Peli_fk
FOREIGN KEY (IkaryhmaID)
REFERENCES Ikaryhma (IkaryhmaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Genre_Peli_fk
FOREIGN KEY (GenreID)
REFERENCES Genre (GenreID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Julkaisija_Peli_fk
FOREIGN KEY (JulkaisijaID)
REFERENCES Julkaisija (JulkaisijaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Peli_Pelialusta_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pisteet ADD CONSTRAINT Peli_Pisteet_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
