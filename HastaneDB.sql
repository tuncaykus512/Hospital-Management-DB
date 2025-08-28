CREATE TABLE Hasta(
HastaID INT PRIMARY KEY,
Hasta_Ad_Soyad VARCHAR(50) NOT NULL,
)

CREATE TABLE HastaBilgi(
HastaID INT NOT NULL,
HastaTC INT NOT NULL,
Cinsiyet VARCHAR(5) NOT NULL,
DogumTarihi DATE NOT NULL,
Telefon INT NOT NULL,
Email VARCHAR(50) NOT NULL,
KanGrubu VARCHAR(3) CHECK (KanGrubu IN ('A', 'B', 'AB', '0', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', '0+', '0-')) NOT NULL,

FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)


CREATE TABLE Hastalık(
HastalıkID INT PRIMARY KEY,
HastaID INT NOT NULL,
Hastalık_Adı VARCHAR(50) NOT NULL,

FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)


CREATE TABLE AcilHastalar(
HastaID INT NOT NULL,
Hasta_Ad_Soyad VARCHAR(50) NOT NULL,
HastaTC INT NOT NULL,
Cinsiyet VARCHAR(5) NOT NULL,
DogumTarihi DATE NOT NULL,
Telefon INT NOT NULL,
Email VARCHAR(50) NOT NULL,
KanGrubu VARCHAR(3) CHECK (KanGrubu IN ('A', 'B', 'AB', '0', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', '0+', '0-')) NOT NULL,
Acil_Giris_Tarihi DATETIME NOT NULL,
Durum VARCHAR(50) NOT NULL,

FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)

CREATE TABLE Doktor(
DoktorID INT PRIMARY KEY,
Doktor_Ad_Soyad VARCHAR(50) NOT NULL,
)

CREATE TABLE BasHekim(
BasHekimID INT PRIMARY KEY,
DoktorID INT NOT NULL,

FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
)

CREATE TABLE BransListe(
BransID INT PRIMARY KEY,
DoktorID INT NOT NULL,
Brans_Adı VARCHAR(50) NOT NULL,

FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
)

CREATE TABLE CerrahiIslemler(
CerrahiIslemID INT PRIMARY KEY,
DoktorID INT NOT NULL,
HastaID INT NOT NULL,
CerrahiIslem_Adı VARCHAR(50) NOT NULL,
Tarih DATE NOT NULL,
CerrahiIslem_Baslangic_Saati TIME NOT NULL,
CerrahiIslem_Bitis_Saati TIME NOT NULL,

FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)


CREATE TABLE Personel(
PersonelID INT PRIMARY KEY,
Personel_Ad_Soyad VARCHAR(50) NOT NULL,
PersonelTC INT NOT NULL,
Telefon INT NOT NULL,
Pozisyon VARCHAR(50) NOT NULL,
)

CREATE TABLE Refakatci(
RefakatciID INT PRIMARY KEY,
HastaID INT NOT  NULL,
Refakatci_Ad_Soyad VARCHAR(50) NOT NULL,
Refakatci_TC VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,

FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)

CREATE TABLE TıbbiBirimler(
TıbbiBirimID INT PRIMARY KEY,
TıbbiBirim_Adı VARCHAR(50) NOT NULL,
)

CREATE TABLE Poliklinikler(
PoliklinikID INT PRIMARY KEY,
TıbbiBirimID INT NOT NULL,
Poliklinik_Adı VARCHAR(50) NOT NULL,

FOREIGN KEY (TıbbiBirimID) REFERENCES TıbbiBirimler(TıbbiBirimID),
)


CREATE TABLE Hemsire(
HemsireID INT PRIMARY KEY,
PoliklinikID INT NOT NULL,
Hemsire_Ad_Soyad VARCHAR(50) NOT NULL,
HemsireTC VARCHAR(50) NOT NULL,
Telefon INT NOT NULL,
Email VARCHAR(50) NOT NULL,

FOREIGN KEY (PoliklinikID) REFERENCES Poliklinikler(PoliklinikID),
)


CREATE TABLE RandevuListe(
RandevuID INT PRIMARY KEY,
DoktorID INT NOT NULL,
HastaID INT NOT NULL,
RandevuTarihi DATE NOT NULL,
RandevuSaati TIME NOT NULL,
RandevuNumarası INT NOT NULL,

FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)


CREATE TABLE DoktorBilgi(
DoktorID INT NOT NULL,
BransID INT NOT NULL,
PoliklinikID INT NOT NULL,
DoktorTC INT NOT NULL,
Cinsiyet VARCHAR(5) NOT NULL,
DogumTarihi DATE NOT NULL,
Telefon INT NOT NULL,
Email VARCHAR(50) NOT NULL,

FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
FOREIGN KEY (BransID) REFERENCES BransListe(BransID),
FOREIGN KEY (PoliklinikID) REFERENCES Poliklinikler(PoliklinikID),
)

CREATE TABLE Nobet(
NobetID INT PRIMARY KEY,
HemsireID INT NOT NULL,
DoktorID INT NOT NULL,
Nobet_Tarihi DATE NOT NULL,
Nobet_Baslangic_Saati TIME NOT NULL,
Nobet_Bitis_Saati TIME NOT NULL,

FOREIGN KEY (HemsireID) REFERENCES Hemsire(HemsireID),
FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
)

CREATE TABLE Yemekler(
YemekID INT PRIMARY KEY,
YemekAdi VARCHAR(50) NOT NULL,
)

CREATE TABLE HastaYemek(
YemekID INT NOT NULL,
HastaID INT NOT NULL,
YemekTarihi DATE NOT NULL,

FOREIGN KEY (YemekID) REFERENCES Yemekler(YemekID),
FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)


CREATE TABLE RefakatciYemek(
YemekID INT NOT NULL,
RefakatciID INT NOT NULL,
YemekTarihi DATE NOT NULL,

FOREIGN KEY (YemekID) REFERENCES Yemekler(YemekID),
FOREIGN KEY (RefakatciID) REFERENCES Refakatci(RefakatciID),
)

CREATE TABLE Tahliller(
TahlilID INT PRIMARY KEY,
Tahlil_Adı VARCHAR(50) NOT NULL,
)

CREATE TABLE LaboratuvarTestleri(
TestID INT PRIMARY KEY,
Test_Adı VARCHAR(50) NOT NULL,
)

CREATE TABLE TahlilSonuclari(
TahlilSonucuID INT PRIMARY KEY,
TahlilID INT NOT NULL,
TestID INT NOT NULL,
HastaID INT NOT NULL,
Tarih DATETIME NOT NULL,

FOREIGN KEY (TahlilID) REFERENCES Tahliller(TahlilID),
FOREIGN KEY (TestID) REFERENCES LaboratuvarTestleri(TestID),
FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
)


CREATE TABLE Hastane(
HastaneID INT PRIMARY KEY,
Hastane_Adı VARCHAR(50) NOT NULL,
BasHekimID INT NOT NULL,
DoktorID INT NOT NULL,
HemsireID INT NOT NULL,
HastaID INT NOT NULL,
PersonelID INT NOT NULL,
PoliklinikID INT NOT NULL,

FOREIGN KEY (BasHekimID) REFERENCES BasHekim(BasHekimID),
FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID),
FOREIGN KEY (HemsireID) REFERENCES Hemsire(HemsireID),
FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID),
FOREIGN KEY (PoliklinikID) REFERENCES Poliklinikler(PoliklinikID),
)

