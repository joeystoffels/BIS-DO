USE gameparadise
go

DELETE Role
DELETE Employee
DELETE RolesPerEmployee
DELETE Publisher
DELETE Stock
DELETE Game

INSERT INTO Role VALUES
	('admin'),
	('verkoop'),
	('reparatie'),
	('manager');

INSERT INTO Employee VALUES
	('hveen', 'Harry', 'van Veen', 'pUM0H1cxALP_yVVOdvSP', '01-02-1989'),
	('kgroot', 'Karel', 'de Groot', '46kRUZfTndF@7U7J9F3P', '09-10-1992'),
	('sboer', 'Saskia', 'de Boer', 'Pw9wQiO1fTQY*s0F3Y9k', '03-11-1965'),
	('jwitt', 'Johan', 'de Witt', 'ejMCv3(nYTjxTSrqxy2a', '04-12-1970'),
	('sschouten', 'Sjon', 'Schouten', 'YWXszUFier40d^cvdJpC', '09-12-1987');

INSERT INTO RolesPerEmployee VALUES
	('hveen', 'admin'),
	('hveen', 'verkoop'),
	('kgroot', 'verkoop'),
	('kgroot', 'reparatie'),
	('sboer', 'admin'),
	('sboer', 'verkoop'),
	('sboer', 'reparatie'),
	('sboer', 'manager'),
	('jwitt', 'reparatie'),
	('jwitt', 'verkoop'),
	('sschouten', 'reparatie'),
	('sschouten', 'verkoop');

INSERT INTO Publisher VALUES 
	('Electronic Arts'),
	('Activision'),
	('Ubisoft'),
	('Microsoft');

INSERT INTO Stock VALUES
	(12),
	(8),
	(1),
	(2),
	(3),
	(22),
	(35),
	(70),
	(24);

INSERT INTO Customer VALUES 
	('wilfried.kanen1984@gmail.com', 'Wilfried', 'Kanen', '6092AH', 'Arnhem', '0612345678', '0241234567', '02-01-1984', 'kapsalon123', 'M', 'K. Bouterlaan', '31'),
	('piet.saman32@gmail.com', 'Piet', 'Saman', '3411KA', 'Amstelveen', '0611234112', '0314235112', '10-17-1998', 'PietjePuk!!2', 'M', 'Grote Dorpstraat', '18'),
	('karin119@gmail.com', 'Karin', 'de Vries', '4511SD', 'Teuge', '0623111235', '0957728573', '07-27-2002', 'vlinderhetkonijn1', 'F', 'Keulensedwarsstraat', '109');

INSERT INTO Purchase VALUES 
	('12', 'wilfried.kanen1984@gmail.com', 19.99),
	('13', 'piet.saman32@gmail.com', 63.79),
	('25', 'karin119@gmail.com', 12.99);

INSERT INTO Category VALUES 
	('Actie'),
	('Simulatie'),
	('Racen');

INSERT INTO AgeCategory VALUES 
	('8+'),
	('12+'),
	('16+'),
	('18+');

INSERT INTO GameType VALUES 
	('Singleplayer'),
	('Multiplayer'),
	('Online');

INSERT INTO Game VALUES
	('9266204557940', 29.95, '18+', 19.99, 'Battlefield 1', '10-21-2016', 'Battlefield 1 is een first-person shooter ontwikkeld door EA DICE. Het spel werd uitgegeven door Electronic Arts en kwam op 21 oktober 2016 uit voor PlayStation 4, Windows en Xbox One. Het spel speelt zich af in de Eerste Wereldoorlog.', 'Beschikbaar', 'Electronic Arts', 12, null),
	('0771534236892', 49.95, '16+', 35.50, 'Call of Duty: Black ops III', '11-03-2017', 'Call of Duty: Black Ops III is een computerspel uit de Call of Duty-reeks. Het spel is ontwikkeld door Treyarch en is het vervolg op Call of Duty: Black Ops II.', 'Beschikbaar', 'Activision', 8, null),
	('3253420807924', 59.95, '12+', 49.99, 'Destiny', '09-09-2014', 'Destiny is een first-person shooter ontwikkeld door Bungie. Het spel wordt uitgegeven door Activision en kwam op 9 september 2014 uit voor PlayStation 3, PlayStation 4, Xbox 360 en Xbox One.', 'Niet beschikbaar', 'Activision', 1, null),
	('5232754559163', 39.95, '8+', 25.00, 'Microsoft Flight Simulator X', '10-13-2006', 'Microsoft Flight Simulator is een computerprogramma voor Microsoft Windows dat het vliegen met allerlei soorten vliegtuigen simuleert.', 'Niet beschikbaar', 'Microsoft', 2, 3),
	('8211752690303', 49.95, '16+', 33.00, 'Tom Clancys The Division', '03-08-2016', 'Tom Clancys The Division is een third-person shooter die via internet gespeeld kan worden. Het spel werd ontwikkeld door Ubisoft Massive, Ubisoft Reflections, Ubisoft Red Storm en Ubisoft Annecy.', 'Beschikbaar', 'Ubisoft', 3, 2),
	('3243283243243', 24.95, '12+', 19.95, 'Need for Speed Payback', '11-10-2017', 'Need for Speed is een reeks computerspelen die door EA Games op de markt zijn gebracht voor verschillende platforms, waaronder Windows, Mac, Nintendo-, Xbox- en PlayStation-consoles.', 'Beschikbaar', 'Electronic Arts', 22, 1);
	
INSERT INTO CategoriesPerGame VALUES
	('Actie', '9266204557940'),
	('Actie', '0771534236892'),
	('Actie', '3253420807924'),
	('Simulatie', '5232754559163'),
	('Actie', '8211752690303'),
	('Racen', '3243283243243');
	
INSERT INTO GameTypesPerGame VALUES 	
	('Singleplayer', '9266204557940'),
	('Singleplayer', '0771534236892'),
	('Singleplayer', '3253420807924'),
	('Singleplayer', '5232754559163'),
	('Singleplayer', '8211752690303'),
	('Singleplayer', '3243283243243'),
	('Multiplayer', '9266204557940'),
	('Multiplayer', '0771534236892'),	
	('Multiplayer', '8211752690303'),
	('Online', '9266204557940'),
	('Online', '0771534236892'),
	('Online', '8211752690303');

INSERT INTO PurchasedGames VALUES
	(1, '5232754559163'),
	(2, '8211752690303'),
	(3, '3243283243243');

INSERT INTO PurchasedConsoles VALUES
	(10, '493284329844'),
	(23, '654643354323'),
	(31, '852324325644');

INSERT INTO RentedGames VALUES
	(1, '954353423333'),
	(3, '748350430003'),
	(19, '894832843294');

INSERT INTO RentedConsoles VALUES
	(6, '473284372432'),
	(7, '894324839248'),
	(9, '991232321455');

INSERT INTO Damage VALUES
	(1, 'kgroot', 'wilfried.kanen1984@gmail.com', 49.50, '12-05-2017', 'In reparatie', '9865765456778'),
	(2, 'sschouten', 'piet.saman32@gmail.com', 30.00, '12-20-2017', 'In reparatie', '3727118273849'),
	(5, 'sboer', 'piet.saman32@gmail.com', 132.95, '19-05-2017', 'Wachten op reparatie', '8293847583921');

INSERT INTO Rental VALUES
	(1, 25.00, 75.00, '24-11-2017', '24-12-2017', 'Gereserveerd', 'wilfried.kanen1984@gmail.com'),
	(3, 25.00, 34.95, '08-11-2017', '08-12-2017', 'Verhuurd', 'wilfried.kanen1984@gmail.com'),
	(4, 25.00, 39.95, '15-10-2017', '15-12-2017', 'Te laat', 'karin119@gmail.com');

INSERT INTO Console VALUES
	('7728364482373', 312.95, 349.95, null, 'Nieuw', 35, 'Sony', 'Playstation 4', null),
	('9812321711123', 224.95, 289.95, 'Gebruikerssporen aanwezig', 'Gebruikt', 70, 'Microsoft', 'XBOX One', null),
	('2131232432432', 169.99, 229.99, null, 'Nieuw', 24, 'Nintendo', 'Switch', null);

INSERT INTO Brand VALUES
	('Sony'),
	('Nintendo'),
	('Microsoft');

INSERT INTO Type VALUES
	('Playstation 4'),
	('XBOX One'),
	('Switch');



