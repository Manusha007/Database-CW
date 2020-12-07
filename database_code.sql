CREATE DATABASE w1790142_0

CREATE TABLE w1790142 company(
w1790142_compCode INT NULL,
w1790142_compName VARCHAR(30) NOT NULL,
w1790142_compDescrip VARCHAR(60) NOT NULL,
CONSTRAINT pk_w1790142_compCode PRIMARY KEY(w1790142_compCode)
);

CREATE TABLE w1790142_staff( 
w1790142_staffId INT NOT NULL, 
w1790142_staffFullName VARCHAR(30) NOT NULL, 
w1790142_staffPosition VARCHAR(50) NOT NULL, 
w1790142_staffEmail VARCHAR(40) NOT NULL, 
w1790142_compCode INT NOT NULL, 
CONSTRAINT pk_ w1790142_staffId PRIMARY KEY (w1790142_staffId), 
CONSTRAINT fk_ w1790142_compCode FOREIGN KEY(w1790142_compCode) 
REFERENCES w1790142_company(w1790142_compCode) 
);

CREATE TABLE w1790142_offer( 
w1790142_offerCode INT NOT NULL, 
w1790142_offerName VARCHAR(30) NOT NULL, 
w1790142_offerDescrip VARCHAR(60) NOT NULL, 
w1790142_offerDeadline DATE NOT NULL, 
w1790142_offerStartDate DATE NOT NULL, 
w1790142_compCode INT NOT NULL, 
CONSTRAINT pk_w1790142_offerCode PRIMARY KEY (w1790142_offerCode), 
CONSTRAINT fk_w1790142_compCode_1 FOREIGN KEY(w1790142_compCode) 
REFERENCES w1790142_company(w1790142_compCode)
);

INSERT INTO `w1790142_company`(`w1790142_compCode`, `w1790142_compName`, `w1790142_compDescrip`) VALUES (202005,'Epic','Electronics'); 
INSERT INTO `w1790142_company`(`w1790142_compCode`, `w1790142_compName`, `w1790142_compDescrip`) VALUES (202009,'EET','Vehicles'); 
INSERT INTO `w1790142_company`(`w1790142_compCode`, `w1790142_compName`, `w1790142_compDescrip`) VALUES (202015,'DGI','Food');

INSERT INTO `w1790142_staff`(`w1790142_staffId`, `w1790142_staffFullName`, `w1790142_staffPosition`, `w1790142_staffEmail`, `w1790142_compCode`) VALUES (1001,'Peter Wayne','Manager','pw@email.com',202005);
INSERT INTO `w1790142_staff`(`w1790142_staffId`, `w1790142_staffFullName`, `w1790142_staffPosition`, `w1790142_staffEmail`, `w1790142_compCode`) VALUES (1002,'Ana Roberts',' Sales Representative','ar@email.com',202009);
INSERT INTO `w1790142_staff`(`w1790142_staffId`, `w1790142_staffFullName`, `w1790142_staffPosition`, `w1790142_staffEmail`, `w1790142_compCode`) VALUES (1003,'Martha Rockafeller','Accountant','mr@email.com',202015); 
INSERT INTO `w1790142_staff`(`w1790142_staffId`, `w1790142_staffFullName`, `w1790142_staffPosition`, `w1790142_staffEmail`, `w1790142_compCode`) VALUES (1004,'Zack Yung','Manager','zy@email.com',202015);
INSERT INTO `w1790142_staff`(`w1790142_staffId`, `w1790142_staffFullName`, `w1790142_staffPosition`, `w1790142_staffEmail`, `w1790142_compCode`) VALUES (1005,'Arthur Morgan','Accountant','am@email.com',202005);

INSERT INTO `w1790142_offer`(`w1790142_offerCode`, `w1790142_offerName`, `w1790142_offerDescrip`, `w1790142_offerDeadline`, `w1790142_offerStartDate`, `w1790142_compCode`) VALUES (5051, 'Christmas','50% Discount','2020.12.31','2020.12.15',202005); 
INSERT INTO `w1790142_offer`(`w1790142_offerCode`, `w1790142_offerName`, `w1790142_offerDescrip`, `w1790142_offerDeadline`, `w1790142_offerStartDate`, `w1790142_compCode`) VALUES (5052, 'Halloween','20% Discount','2020.11.01','2020.10.23',202009); 
INSERT INTO `w1790142_offer`(`w1790142_offerCode`, `w1790142_offerName`, `w1790142_offerDescrip`, `w1790142_offerDeadline`, `w1790142_offerStartDate`, `w1790142_compCode`) VALUES (5053, 'New Year','75% Discount','2021.01.11','2020.12.30',202015); 
INSERT INTO `w1790142_offer`(`w1790142_offerCode`, `w1790142_offerName`, `w1790142_offerDescrip`, `w1790142_offerDeadline`, `w1790142_offerStartDate`, `w1790142_compCode`) VALUES (5054, 'Summer','30% Discount','2020.08.31','2020.08.15',202005); 

SELECT company1.w1790142_compName, staff1.w1790142_compCode, COUNT(staff1.w1790142_compCode) AS 'NumberofStaff' 
FROM w1790142_staff staff1
JOIN w1790142_company company1
ON company1.w1790142_compCode = staff1.w1790142_compCode GROUP BY staff1.w1790142_compCode, company1.w1790142_compName

SELECT company1.w1790142_compName, staff1.w1790142_staffFullName, staff1.w1790142_staffPosition, offer1.w1790142_offerName, offer1.w1790142_offerDescrip 
FROM w1790142_company company1
JOIN w1790142_staff staff1 
JOIN w1790142_offer offer1 
ON company1.w1790142_compCode = staff1.w1790142_compCode AND company1.w1790142_compCode = offer1.w1790142_compCode
