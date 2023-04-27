use kutuphane;
CREATE TABLE Uye (
  Uye_No integer PRIMARY KEY,
  Ad varchar(255),
  Soyad varchar(255),
  Tel_No integer,
  Mail varchar(255)
);

CREATE TABLE Kayit (
  Kayit_No integer PRIMARY KEY,
  Uye_No integer,
  Kitap_No integer,
  Verilis_Tarihi timestamp,
  Teslim_Tarihi timestamp,
  Personel_No integer,
  Kac_Gunlugune_Alindi integer,
  Kesin_Teslim_Tarihi timestamp
);

CREATE TABLE Kitap (
  Kitap_No integer PRIMARY KEY,
  Kitap_Adi varchar(255),
  Kategori_No integer,
  Yazar_No integer,
  Yayinevi_No integer,
  Sayfa_Sayisi integer,
  ISBN integer,
  Basim_Yili timestamp
);

CREATE TABLE Yazar (
  Yazar_No integer PRIMARY KEY,
  Yazar_Adi varchar(255),
  Yazar_Soyadi varchar(255),
  Yazar_Bio varchar(255)
);

CREATE TABLE Yayinevi (
  Yayinevi_No integer PRIMARY KEY,
  Yayinevi_Adi varchar(255),
  Aciklama varchar(255)
);

CREATE TABLE Kategori (
  Kategori_No integer PRIMARY KEY,
  Kategori_Adi varchar(255)
);
CREATE TABLE Personel (
  Personel_No integer PRIMARY KEY,
  Ad varchar(255),
  Soyad varchar(255),
  Gorev_No integer
);
CREATE TABLE Gorev (
  Gprev_No integer PRIMARY KEY,
  Gorev_Ad varchar(255),
  ACiklama varchar(255)
);
/*Many to Many*/
CREATE TABLE YazarKitap (
YazarKitap_No integer PRIMARY KEY AUTO_INCREMENT, 
Yazar_No integer, 
Kitap_No integer, 
FOREIGN KEY (Yazar_No) REFERENCES Yazar(Yazar_No), 
FOREIGN KEY (Kitap_No) REFERENCES Kitap(Kitap_No)
);
/*Many to Many*/
CREATE TABLE KitapKategori (
KitapKategori_No integer PRIMARY KEY AUTO_INCREMENT, 
Kitap_No integer, 
Kategori_No integer, 
FOREIGN KEY (Kitap_No) REFERENCES Kitap(Kitap_No),
FOREIGN KEY (Kategori_No) REFERENCES Kategori(Kategori_No)
);

ALTER TABLE Kayit ADD FOREIGN KEY (Uye_No) REFERENCES Uye (Uye_No);

ALTER TABLE Kayit ADD FOREIGN KEY (Kitap_No) REFERENCES Kitap (Kitap_No);

ALTER TABLE Kitap ADD FOREIGN KEY (Yazar_No) REFERENCES Yazar (Yazar_No);

ALTER TABLE Kitap ADD FOREIGN KEY (Yayinevi_No) REFERENCES Yayinevi (Yayinevi_No);

ALTER TABLE Kitap ADD FOREIGN KEY (Kategori_No) REFERENCES Kategori (Kategori_No);

ALTER TABLE Kayit ADD FOREIGN KEY (Personel_No) REFERENCES Personel (Personel_No);

ALTER TABLE Personel ADD FOREIGN KEY (Gorev_No) REFERENCES Gorev (Gorev_No);
