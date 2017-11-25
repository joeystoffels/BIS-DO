/*================================================================*/
/* Database name:  GameParadise			                          */
/* DBMS name:      Microsoft SQL Server 2017                      */
/* Created on:     23/11/2017									  */
/* Made by:        Martijn de Geus, Nick Hartjes en Joey Stoffels */
/*================================================================*/

/*================================================================*/
/* Initialisation						                          */
/*================================================================*/
USE master
GO

IF EXISTS(select * from sys.databases where name='gameparadise')
DROP DATABASE gameparadise

CREATE DATABASE gameparadise
GO

USE gameparadise
GO

/*================================================================*/
/* Start DDL.   						                          */
/*================================================================*/

CREATE TABLE Category (
 CategoryName VARCHAR(30) NOT NULL
);

ALTER TABLE Category ADD CONSTRAINT PK_Category PRIMARY KEY (CategoryName);


CREATE TABLE Customer (
 Emailadres VARCHAR(50) NOT NULL,
 FirstName VARCHAR(30) NOT NULL,
 LastName VARCHAR(30) NOT NULL,
 PostalCode CHAR(6) NOT NULL,
 City CHAR(10) NOT NULL,
 MobilePhone CHAR(10) NOT NULL,
 Phone CHAR(10),
 DateOfBirth DATE NOT NULL,
 Password VARCHAR(30) NOT NULL,
 Gender CHAR(1),
 Streetname VARCHAR(50) NOT NULL,
 HouseNumber VARCHAR(10) NOT NULL
);

ALTER TABLE Customer ADD CONSTRAINT PK_Customer PRIMARY KEY (Emailadres);


CREATE TABLE Purchase (
 PurchaseId INT NOT NULL,
 Emailadres VARCHAR(50) NOT NULL,
 Amount DECIMAL(6,2) NOT NULL
);

ALTER TABLE Purchase ADD CONSTRAINT PK_Purchase PRIMARY KEY (PurchaseId);


CREATE TABLE AgeCategory (
 AgeCategoryName VARCHAR(30) NOT NULL
);

ALTER TABLE AgeCategory ADD CONSTRAINT PK_AgeCategory PRIMARY KEY (AgeCategoryName);


CREATE TABLE Employee (
 Login VARCHAR(30) NOT NULL,
 FirstName VARCHAR(30) NOT NULL,
 LastName VARCHAR(30) NOT NULL,
 Password VARCHAR(30) NOT NULL,
 DateOfBirth DATE
);

ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY (Login);


CREATE TABLE Brand (
 BrandName VARCHAR(30) NOT NULL
);

ALTER TABLE Brand ADD CONSTRAINT PK_Brand PRIMARY KEY (BrandName);


CREATE TABLE Role (
 RoleName VARCHAR(30) NOT NULL
);

ALTER TABLE Role ADD CONSTRAINT PK_Role PRIMARY KEY (RoleName);


CREATE TABLE RolesPerEmployee (
 Login VARCHAR(30) NOT NULL,
 RoleName VARCHAR(30) NOT NULL
);

ALTER TABLE RolesPerEmployee ADD CONSTRAINT PK_RolesPerEmployee PRIMARY KEY (Login,RoleName);


CREATE TABLE GameType (
 GameTypeName VARCHAR(30) NOT NULL
);

ALTER TABLE GameType ADD CONSTRAINT PK_GameType PRIMARY KEY (GameTypeName);


CREATE TABLE Type (
 TypeName VARCHAR(30) NOT NULL
);

ALTER TABLE Type ADD CONSTRAINT PK_Type PRIMARY KEY (TypeName);


CREATE TABLE Publisher (
 PublisherName VARCHAR(30) NOT NULL
);

ALTER TABLE Publisher ADD CONSTRAINT PK_Publisher PRIMARY KEY (PublisherName);


CREATE TABLE Stock (
 StockLocation INT NOT NULL
);

ALTER TABLE Stock ADD CONSTRAINT PK_Stock PRIMARY KEY (StockLocation);


CREATE TABLE Formulier (
 Schadenummer CHAR(10),
 Login VARCHAR(30) NOT NULL
);


CREATE TABLE Game (
 Barcode CHAR(13) NOT NULL,
 Price DECIMAL(6,2) NOT NULL,
 AgeCategoryName VARCHAR(30) NOT NULL,
 CurrentPrice DECIMAL(6,2) NOT NULL,
 Title VARCHAR(30) NOT NULL,
 YearOfRelease DATE NOT NULL,
 Description VARCHAR(254) NOT NULL,
 Status VARCHAR(30) NOT NULL,
 PublisherName VARCHAR(30) NOT NULL,
 StockLocation INT,
 PurchaseId INT
);

ALTER TABLE Game ADD CONSTRAINT PK_Game PRIMARY KEY (Barcode);


CREATE TABLE Rental (
 RentalId INT NOT NULL,
 Deposit DECIMAL(6,2) NOT NULL,
 Price DECIMAL(6,2) NOT NULL,
 StartDate DATE NOT NULL,
 EndDate DATE NOT NULL,
 Status VARCHAR(30) NOT NULL,
 Emailadres VARCHAR(50) NOT NULL
);

ALTER TABLE Rental ADD CONSTRAINT PK_Rental PRIMARY KEY (RentalId);


CREATE TABLE CategoriesPerGame (
 CategoryName VARCHAR(30) NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE CategoriesPerGame ADD CONSTRAINT PK_CategoriesPerGame PRIMARY KEY (CategoryName,Barcode);


CREATE TABLE Console (
 Barcode CHAR(13) NOT NULL,
 CurrentPrice DECIMAL(6,2) NOT NULL,
 Price DECIMAL(6,2) NOT NULL,
 Comment VARCHAR(254),
 Status VARCHAR(30) NOT NULL,
 StockLocation INT,
 BrandName VARCHAR(30) NOT NULL,
 TypeName VARCHAR(30) NOT NULL,
 PurchaseId INT
);

ALTER TABLE Console ADD CONSTRAINT PK_Console PRIMARY KEY (Barcode);


CREATE TABLE GameTypesPerGame (
 GameTypeName VARCHAR(30) NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE GameTypesPerGame ADD CONSTRAINT PK_GameTypesPerGame PRIMARY KEY (GameTypeName,Barcode);


CREATE TABLE PurchasedGames (
 PurchaseId INT NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE PurchasedGames ADD CONSTRAINT PK_PurchasedGames PRIMARY KEY (PurchaseId,Barcode);


CREATE TABLE RentedConsoles (
 RentalId INT NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE RentedConsoles ADD CONSTRAINT PK_RentedConsoles PRIMARY KEY (RentalId,Barcode);


CREATE TABLE RentedGames (
 RentalId INT NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE RentedGames ADD CONSTRAINT PK_RentedGames PRIMARY KEY (RentalId,Barcode);


CREATE TABLE PurchasedConsoles (
 PurchaseId INT NOT NULL,
 Barcode CHAR(13) NOT NULL
);

ALTER TABLE PurchasedConsoles ADD CONSTRAINT PK_PurchasedConsoles PRIMARY KEY (PurchaseId,Barcode);


CREATE TABLE Damage (
 DamageId INT NOT NULL,
 Login VARCHAR(30) NOT NULL,
 Emailadres VARCHAR(50) NOT NULL,
 DamageCost DECIMAL(6,2) NOT NULL,
 PredictedReady DATE NOT NULL,
 Status VARCHAR(30) NOT NULL,
 Barcode CHAR(13)
);

ALTER TABLE Damage ADD CONSTRAINT PK_Damage PRIMARY KEY (DamageId);


CREATE TABLE Reparatie (
 DamageId INT NOT NULL,
 Voorspelling CHAR(10),
 Barcode CHAR(13)
);

ALTER TABLE Reparatie ADD CONSTRAINT PK_Reparatie PRIMARY KEY (DamageId);

/*================================================================*/
/* Add FOREIGN KEYS 					                          */
/*================================================================*/

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_0 FOREIGN KEY (Emailadres) REFERENCES Customer (Emailadres);


ALTER TABLE RolesPerEmployee ADD CONSTRAINT FK_RolesPerEmployee_0 FOREIGN KEY (Login) REFERENCES Employee (Login);
ALTER TABLE RolesPerEmployee ADD CONSTRAINT FK_RolesPerEmployee_1 FOREIGN KEY (RoleName) REFERENCES Role (RoleName);


ALTER TABLE Formulier ADD CONSTRAINT FK_Formulier_0 FOREIGN KEY (Login) REFERENCES Employee (Login);


ALTER TABLE Game ADD CONSTRAINT FK_Game_0 FOREIGN KEY (AgeCategoryName) REFERENCES AgeCategory (AgeCategoryName);
ALTER TABLE Game ADD CONSTRAINT FK_Game_1 FOREIGN KEY (PublisherName) REFERENCES Publisher (PublisherName);
ALTER TABLE Game ADD CONSTRAINT FK_Game_2 FOREIGN KEY (StockLocation) REFERENCES Stock (StockLocation);
ALTER TABLE Game ADD CONSTRAINT FK_Game_3 FOREIGN KEY (PurchaseId) REFERENCES Purchase (PurchaseId);


ALTER TABLE Rental ADD CONSTRAINT FK_Rental_0 FOREIGN KEY (Emailadres) REFERENCES Customer (Emailadres);


ALTER TABLE CategoriesPerGame ADD CONSTRAINT FK_CategoriesPerGame_0 FOREIGN KEY (CategoryName) REFERENCES Category (CategoryName);
ALTER TABLE CategoriesPerGame ADD CONSTRAINT FK_CategoriesPerGame_1 FOREIGN KEY (Barcode) REFERENCES Game (Barcode);


ALTER TABLE Console ADD CONSTRAINT FK_Console_0 FOREIGN KEY (StockLocation) REFERENCES Stock (StockLocation);
ALTER TABLE Console ADD CONSTRAINT FK_Console_1 FOREIGN KEY (BrandName) REFERENCES Brand (BrandName);
ALTER TABLE Console ADD CONSTRAINT FK_Console_2 FOREIGN KEY (TypeName) REFERENCES Type (TypeName);
ALTER TABLE Console ADD CONSTRAINT FK_Console_3 FOREIGN KEY (PurchaseId) REFERENCES Purchase (PurchaseId);


ALTER TABLE GameTypesPerGame ADD CONSTRAINT FK_GameTypesPerGame_0 FOREIGN KEY (GameTypeName) REFERENCES GameType (GameTypeName);
ALTER TABLE GameTypesPerGame ADD CONSTRAINT FK_GameTypesPerGame_1 FOREIGN KEY (Barcode) REFERENCES Game (Barcode);


ALTER TABLE PurchasedGames ADD CONSTRAINT FK_PurchasedGames_0 FOREIGN KEY (PurchaseId) REFERENCES Purchase (PurchaseId);
ALTER TABLE PurchasedGames ADD CONSTRAINT FK_PurchasedGames_1 FOREIGN KEY (Barcode) REFERENCES Game (Barcode);


ALTER TABLE RentedConsoles ADD CONSTRAINT FK_RentedConsoles_0 FOREIGN KEY (RentalId) REFERENCES Rental (RentalId);
ALTER TABLE RentedConsoles ADD CONSTRAINT FK_RentedConsoles_1 FOREIGN KEY (Barcode) REFERENCES Console (Barcode);


ALTER TABLE RentedGames ADD CONSTRAINT FK_RentedGames_0 FOREIGN KEY (RentalId) REFERENCES Rental (RentalId);
ALTER TABLE RentedGames ADD CONSTRAINT FK_RentedGames_1 FOREIGN KEY (Barcode) REFERENCES Game (Barcode);


ALTER TABLE PurchasedConsoles ADD CONSTRAINT FK_PurchasedConsoles_0 FOREIGN KEY (PurchaseId) REFERENCES Purchase (PurchaseId);
ALTER TABLE PurchasedConsoles ADD CONSTRAINT FK_PurchasedConsoles_1 FOREIGN KEY (Barcode) REFERENCES Console (Barcode);


ALTER TABLE Damage ADD CONSTRAINT FK_Damage_0 FOREIGN KEY (Login) REFERENCES Employee (Login);
ALTER TABLE Damage ADD CONSTRAINT FK_Damage_1 FOREIGN KEY (Emailadres) REFERENCES Customer (Emailadres);
ALTER TABLE Damage ADD CONSTRAINT FK_Damage_2 FOREIGN KEY (Barcode) REFERENCES Console (Barcode);


ALTER TABLE Reparatie ADD CONSTRAINT FK_Reparatie_0 FOREIGN KEY (DamageId) REFERENCES Damage (DamageId);
ALTER TABLE Reparatie ADD CONSTRAINT FK_Reparatie_1 FOREIGN KEY (Barcode) REFERENCES Console (Barcode);


/*==============================================================*/
/* Toevoegen check contraints									*/
/*==============================================================*/

-- Mobile phone starts with 06
ALTER TABLE Customer
ADD CONSTRAINT CH_MobileStart CHECK ( SUBSTRING( MobilePhone,1,2) = '06');

-- Mobile phone has an length of exactly 10
ALTER TABLE Customer
ADD CONSTRAINT CH_MobileLength CHECK (LEN(MobilePhone)=10);

-- PostalCode starts with 4 numbers and 2 chars
ALTER TABLE Customer
ADD CONSTRAINT CH_PostalCode CHECK (PostalCode like '[0-9][0-9][0-9][0-9][A-Z][A-Z]');

-- Gender can contain M(ale), F(emale) or (N)eutral
ALTER TABLE Customer
ADD CONSTRAINT CH_Gender CHECK (Gender IN ('M','F', 'N'))

-- Day of Birth is after 01-01-1900
ALTER TABLE Customer
ADD CONSTRAINT CH_Date CHECK (DateOfBirth >= '1900-01-01');

-- Check if the email has an correct syntax
ALTER TABLE Customer
ADD CONSTRAINT CH_Emailadres  CHECK(Emailadres LIKE '%___@___%.__%')

-- Password needs to have a minimal length of 6, needs 1 number, needs 1 capital and a special character.
ALTER TABLE Employee
ADD CONSTRAINT CH_Password CHECK (Password like '%[0-9]%' and Password like '%[A-Z]%' and Password like '%[!@#$%a^&*()-_+=.,;:''"`~]%' and LEN(Password) >= 6);
