/*================================================================*/
/* Database name:  GameParadise			                          */
/* DBMS name:      Microsoft SQL Server 2017                      */
/* Created on:     23/11/2017									  */
/* Made by:        Martijn de Geus, Nick Hartjes en Joey Stoffels */
/*================================================================*/

/*================================================================*/
/* Initialisation						                          */
/*================================================================*/

USE gameparadise
GO

/*================================================================*/
/* Start Constraint testing.			                          */
/*================================================================*/


-- Test 01: MobilePhone starts with 06
  -- Case 1a: MobilePhone starts with 60
INSERT INTO Customer VALUES ('test1a_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '6012345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');
  -- Case 1a: MobilePhone starts with 08
INSERT INTO Customer VALUES ('test1b_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0812345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');


-- Test 02: MobilePhone has an length of exactly 10, the field is a Char(10), so longer values will not be inserted.
  -- Case 2a: MobilePhone length is 9
INSERT INTO Customer VALUES ('test2a_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '06123456', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');
  -- Case 2b: MobilePhone length is 6
INSERT INTO Customer VALUES ('test2b_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '061234', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');


-- Test 03: PostalCode starts with 4 numbers and 2 chars
  -- Case 3a: Starts with 2 chars and then 4 numbers
INSERT INTO Customer VALUES ('test3a_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', 'AH6092', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');
  -- Case 3b: Starts with 5 numbers and then a char
INSERT INTO Customer VALUES ('test3b_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '60921A', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');



-- Test 04: Gender can contain M(ale), F(emale) or (N)eutral
  -- Case 4a: Insert a G
INSERT INTO Customer VALUES ('test4a_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'G', 'K. Bouterlaan', '31');
  -- Case 4b: Insert a Char 9
INSERT INTO Customer VALUES ('test4b_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', '9', 'K. Bouterlaan', '31');


-- Test 05: Day of Birth is after 01-01-1900
  -- Case 5a: Insert a Day of Birth of 02-01-1884
INSERT INTO Customer VALUES ('test5a_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1884', 'kapsalon123', 'M', 'K. Bouterlaan', '31');
  -- Case 5b: Insert a Day of Birth of 01-17-1201
INSERT INTO Customer VALUES ('test5b_wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '01-17-1201', 'kapsalon123', 'M', 'K. Bouterlaan', '31');


-- Test 06: Check if the Emailadres has an correct syntax
  -- Case 6a: Missing @ in Emailadres
INSERT INTO Customer VALUES ('test6a_wilfried.kanen1984gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');
  -- Case 6a: Missing domain extension
INSERT INTO Customer VALUES ('test6b_wilfried.kanen1984@gmail', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31');


-- Test 07: Password needs to have a minimal length of 6, needs 1 number, needs 1 capital and a special character.
  -- Case 7a: Password is smaller then 6
INSERT INTO Employee VALUES	('test7a_gebruiker', 'Guus', 'Geluk', '1@Wa', '01-01-1970');
  -- Case 7b: Password is missing a number
INSERT INTO Employee VALUES ('test7b_gebruiker', 'Guus', 'Geluk', '@Wachtwoord', '01-01-1970');
  -- Case 7c: Password is missing a Special character
INSERT INTO Employee VALUES ('test7c_gebruiker', 'Guus', 'Geluk', '1Wachtwoord', '01-01-1970');
  -- Case 7d: Password is missing a capital
INSERT INTO Employee VALUES ('test7d_gebruiker', 'Guus', 'Geluk', '1@wachtwoord', '01-01-1970');