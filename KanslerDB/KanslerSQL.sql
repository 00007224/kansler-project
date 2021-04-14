-- use kansler database --
USE KanslerDB;
GO

-- create price table --
CREATE TABLE ProductPrice (
	ID int NOT NULL,
	Lowest float,
	Highest float,
	Type nvarchar(20),
	CONSTRAINT pk_productprice_id PRIMARY KEY(ID)
);
GO

-- populate data to the price table --
INSERT INTO ProductPrice (ID, Lowest, Highest, Type)
VALUES (1, 0, 100000, 'Cheap');
GO

INSERT INTO ProductPrice (ID, Lowest, Highest, Type)
VALUES (2, 100001, 350000, 'Medium');
GO

INSERT INTO ProductPrice (ID, Lowest, Highest, Type)
VALUES (3, 350001, 1.7976931348623158E+308, 'Expensive');
GO

-- create category table --
CREATE TABLE ProductCategory (
	ID int NOT NULL,
	Category nvarchar(400),
	CONSTRAINT pk_productcategory_id PRIMARY KEY(ID),
	CONSTRAINT uq_productcategory_category UNIQUE(Category)
);
GO

-- populate data for category table --
INSERT INTO ProductCategory (ID, Category)
VALUES(1, 'Writing utensils');
GO

INSERT INTO ProductCategory (ID, Category)
VALUES(2, 'Paper products');
GO

INSERT INTO ProductCategory (ID, Category)
VALUES(3, 'Arhivation systems');
GO

INSERT INTO ProductCategory (ID, Category)
VALUES(4, 'Computer supplies');
GO

INSERT INTO ProductCategory (ID, Category)
VALUES(5, 'Stationery');
GO

INSERT INTO ProductCategory (ID, Category)
VALUES(6, 'Office goods');
GO

-- create product supplier table --
CREATE TABLE ProductSupplier (
	ID int NOT NULL,
	Supplier nvarchar(400),
	CONSTRAINT pk_productsupplier_id PRIMARY KEY(ID),
	CONSTRAINT uq_productsupplier_supplier UNIQUE(Supplier)
);
GO

-- populate data for product supplier table --
INSERT INTO ProductSupplier (ID, Supplier)
VALUES (1, 'Maped');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (2, 'Deli');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (3, 'Uni');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (4, 'Trodat');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (5, 'Metta');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (6, 'Luxor');
GO

INSERT INTO ProductSupplier (ID, Supplier)
VALUES (7, 'Schneider');
GO

-- create table product supplier country --
CREATE TABLE ProductSupplierCountry (
	ID int NOT NULL,
	Country nvarchar(400),
	CONSTRAINT pk_productsuppliercountry_id PRIMARY KEY(ID),
	CONSTRAINT uq_productsuppliercountry_country UNIQUE(Country)
);
GO

-- populate data for product supplier country table --
INSERT INTO ProductSupplierCountry (ID, Country)
VALUES (1, 'Uzbekistan');
GO

INSERT INTO ProductSupplierCountry (ID, Country)
VALUES (2, 'Tadjikistan');
GO

INSERT INTO ProductSupplierCountry (ID, Country)
VALUES (3, 'Kazakhstan');
GO

INSERT INTO ProductSupplierCountry (ID, Country)
VALUES (4, 'Russia');
GO

INSERT INTO ProductSupplierCountry (ID, Country)
VALUES (5, 'China');
GO

-- create product warehouse table --
CREATE TABLE ProductWarehouse (
	ID int NOT NULL,
	City nvarchar(400),
	CONSTRAINT pk_productwarehouse_id PRIMARY KEY(ID),
	CONSTRAINT uq_productwarehouse_city UNIQUE(City)
);

-- populate data for product warehouse table --
INSERT INTO ProductWarehouse (ID, City)
VALUES (1, 'Tashkent');
GO

INSERT INTO ProductWarehouse (ID, City)
VALUES (2, 'Samarqand');
GO

INSERT INTO ProductWarehouse (ID, City)
VALUES (3, 'Bukhara');
GO

INSERT INTO ProductWarehouse (ID, City)
VALUES (4, 'Termez');
GO

INSERT INTO ProductWarehouse (ID, City)
VALUES (5, 'Navoi');
GO

INSERT INTO ProductWarehouse (ID, City)
VALUES (6, 'Kokand');
GO

CREATE TABLE Product(
	ID int NOT NULL,
	Name nvarchar(1000),
	Image varbinary(max),
	Description nvarchar(2000),
	Category int NOT NULL,
	Price float,
	Barcode bigint NOT NULL,
	Quantity int,
	Warehouse int NOT NULL,
	SupplierName int NOT NULL,
	SupplyDate datetime,
	SupplierCountry int NOT NULL,
	IsInStock int,
	CONSTRAINT pk_product_id PRIMARY KEY(ID),
	CONSTRAINT uq_product_barcode UNIQUE(Barcode),
	CONSTRAINT fk_product_category FOREIGN KEY(Category) REFERENCES ProductCategory(ID),
	CONSTRAINT fk_product_warehouse FOREIGN KEY(Warehouse) REFERENCES ProductWarehouse(ID),
	CONSTRAINT fk_product_suppliername FOREIGN KEY(SupplierName) REFERENCES ProductSupplier(ID),
	CONSTRAINT fk_product_suppliercountry FOREIGN KEY(SupplierCountry) REFERENCES ProductSupplierCountry(ID)
);
GO

-- populate data into product table --
INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (1, 'Notebook Schneider', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\1.jpeg', SINGLE_BLOB) as T1), 'Notebook Schneider A5', 2, 5600, 78020137962, 0, 1, 7, '2021-10-02', 3, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (2, 'Deli E0018', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\2.jpeg', SINGLE_BLOB) as T2), 'Clips 29mm, Deli E0018', 5, 3400, 78024586962, 45, 3, 2, '2021-11-03', 5, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (3, 'Fellowes Powershred® 8C', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\3.jpeg', SINGLE_BLOB) as T3), 'Shredder Fellowes Powershred® 8C, DIN P-4', 6, 2206500, 93454586962, 120, 2, 4, '2019-10-23', 5, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (4, 'Metta BP-8 PI', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\4.png', SINGLE_BLOB) as T4), 'Office chair Metta BP-8 PI', 6, 1309500, 71025686963, 0, 4, 5, '2019-12-18', 4, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (5, 'Focus Icy Luxor', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\5.jpeg', SINGLE_BLOB) as T5), 'Ballpoint pen Focus Icy Luxor', 1, 1500, 48356686856, 2000, 5, 6, '2021-01-08', 3, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (6, 'Uni POSCA', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\6.jpeg', SINGLE_BLOB) as T6), 'Marker UNI POSCA (1.8-2.5mm/white)', 1, 28600, 93417856962, 586, 6, 3, '2021-02-14', 2, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (7, 'Folder Deli', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\7.jpeg', SINGLE_BLOB) as T7), 'Folder 7.5sm A4(black) Deli', 3, 20800, 48420137962, 0, 4, 2, '2021-01-30', 5, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (8, 'St.Lois Luxor', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\8.jpeg', SINGLE_BLOB) as T8), 'Ballpoint pen St.Lois Luxor', 1, 53800, 78024589652, 0, 1, 6, '2020-11-15', 5, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (9, 'Deli 3162', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\9.jpeg', SINGLE_BLOB) as T9), 'Diary 205*143 - A5 98p', 2, 29700, 74544586298, 3645, 2, 2, '2021-03-17', 4, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (10, 'Metta Samurai', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\10.jpeg', SINGLE_BLOB) as T10), 'Office chair Metta Samurai S-3.03', 6, 4490800, 45624586963, 780, 5, 5, '2020-09-04', 2, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (11, 'Maped aharpener', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\11.jpg', SINGLE_BLOB) as T11), 'Maped sharpener', 5, 5800, 85565458569, 150, 5, 1, '2020-12-24', 3, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (12, 'Folder Deli', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\12.jpeg', SINGLE_BLOB) as T12), 'Folder 5sm A4(blue) Deli', 3, 21400, 54525685467, 146, 1, 2, '2019-06-07', 1, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (13, 'Aura Luxor', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\13.jpeg', SINGLE_BLOB) as T13), 'Ballpoint pen Aura Luxor', 1, 29600, 48456687186, 0, 4, 6, '2020-08-29', 2, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (14, 'A6 UNI', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\14.jpeg', SINGLE_BLOB) as T14), 'Notebook Uni A6', 2, 4900, 94897856967, 250, 1, 3, '2020-03-05', 1, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (15, 'Deli 3729', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\15.jpeg', SINGLE_BLOB) as T15), 'Deli Computer Keyboard', 4, 275500, 58620137956, 800, 2, 2, '2021-02-04', 4, 1);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (16, 'Maped 30sm', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\16.jpeg', SINGLE_BLOB) as T16), 'Ruler Maped 30sm', 5, 6900,79562589613, 0, 3, 1, '2020-12-16', 3, 0);
GO

INSERT INTO Product (ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry, IsInStock)
VALUES (17, 'Deli DVD', (SELECT * FROM OPENROWSET(BULK N'E:\WEST\DBSD CW assets\imgs\17.jpeg', SINGLE_BLOB) as T17), 'DVD-R Deli (50)', 4, 4100, 17453856937, 650, 1, 2, '2020-11-01', 5, 1);
GO