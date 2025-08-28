# Hospital Management Database / Hastane Yönetim Veritabanı

## Description (English)
This repository contains a hospital management database designed and tested in **SQL Server Management Studio**.  
It includes tables for Patients, Patient Information, Doctors, Head Physicians, Specializations, Surgical Procedures, Nurses, Appointments, Medical Tests, Meals, and more.  
The database structure is normalized and demonstrates relationships between entities in a hospital system.

## Açıklama (Türkçe)
Bu depo, **SQL Server Management Studio** ile tasarlanmış ve test edilmiş bir hastane yönetim veritabanını içerir.  
Hastalar, Hasta Bilgileri, Doktorlar, Baş Hekim, Branşlar, Cerrahi İşlemler, Hemşireler, Randevular, Tahliller, Yemekler ve daha fazlasını içeren tablolar bulunmaktadır.  
Veritabanı yapısı normalleştirilmiş olup, bir hastane sistemindeki varlıklar arasındaki ilişkileri göstermektedir.

## Tables / Tablolar
- `Hasta` → Patients
- `HastaBilgi` → Patient Information
- `Hastalik` → Diseases
- `AcilHastalar` → Emergency Patients
- `Doktor` → Doctors
- `BasHekim` → Head Physicians
- `BransListe` → Specializations
- `CerrahiIslemler` → Surgical Procedures
- `Personel` → Staff
- `Refakatci` → Companions
- `TibbiBirimler` → Medical Units
- `Poliklinikler` → Polyclinics
- `Hemsire` → Nurses
- `RandevuListe` → Appointments
- `DoktorBilgi` → Doctor Information
- `Nobet` → Duty Schedule
- `Yemekler` → Meals
- `HastaYemek` → Patient Meals
- `RefakatciYemek` → Companion Meals
- `Tahliller` → Tests
- `LaboratuvarTestleri` → Laboratory Tests
- `TahlilSonuclari` → Test Results
- `Hastane` → Hospital

## Notes / Notlar
- The database is designed for **SQL Server**, not MySQL.  
- All foreign key relationships are implemented to maintain referential integrity.  
- Some data types like `TC` and `Phone` are stored as `VARCHAR` to preserve leading zeros.

## Files / Dosyalar
- `HastaneDB.sql` → SQL Server database creation script / Veritabanı oluşturma scripti
