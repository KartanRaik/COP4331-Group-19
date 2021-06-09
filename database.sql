# Create Users Table

-- CREATE TABLE BASEBALL.Cards
-- (
--     ID INT NOT NULL AUTO_INCREMENT ,
--     Player VARCHAR(50) NOT NULL DEFAULT '' ,
--     Team VARCHAR(50) NOT NULL DEFAULT '' ,
--     Year VARCHAR(50) NOT NULL DEFAULT '' ,
--     UserID INT NOT NULL DEFAULT '0' ,
--     PRIMARY KEY (ID))
-- ENGINE = InnoDB;

-- insert into Cards (Player,Team,Year,UserID) VALUES ('Babe Ruth','Mets','1948',3);

CREATE TABLE `group_19A`.`Users`
(
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `DateCreated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `DateLastLoggedIn` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `FirstName` VARCHAR(50) NOT NULL DEFAULT '' ,
  `LastName` VARCHAR(50) NOT NULL DEFAULT '' ,
  `Login` VARCHAR(50) NOT NULL DEFAULT '' ,
  `Password` VARCHAR(50) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

CREATE TABLE `group_19A`.`Contacts`
(
    `ID` INT NOT NULL AUTO_INCREMENT ,
    `FirstName` VARCHAR(50) NOT NULL DEFAULT '' ,
    `LastName` VARCHAR(50) NOT NULL DEFAULT '',
    `PhoneNumber` VARCHAR(50) NOT NULL DEFAULT '',
    `Email` VARCHAR(50) NOT NULL DEFAULT '',
    `UserID` INT NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`))
ENGINE = InnoDB;

--Users
-- insert into Users (FirstName,LastName,Login,Password) VALUES ('Anthony','Galbo','AnthonyG','agalbo1');
-- insert into Users (FirstName,LastName,Login,Password) VALUES ('Johnny','Ngo','JohnnyN','jngo1');
-- insert into Users (FirstName,LastName,Login,Password) VALUES ('Kartik','Rana','KartikR','krana1');
-- insert into Users (FirstName,LastName,Login,Password) VALUES ('Chris','Herrera','ChrisH','cherrera1');
-- insert into Users (FirstName,LastName,Login,Password) VALUES ('Angel','Garcia','AngelG','agarcia1');

--Users
insert into Users (FirstName,LastName,Login,Password) VALUES ('Anthony','Galbo','AnthonyG','ba230a603754d849f9b46e55952dcfc7');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Johnny','Ngo','JohnnyN','ea774bd0848b37cb7b1818b2a0c155d3');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Kartik','Rana','KartikR','b092da6300d2e9201baab722035efbb2');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Chris','Herrera','ChrisH','d8703b08044eac3b470ba58b1ad97d89');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Angel','Garcia','AngelG','9e3271a1c7d68a02daa7e7c12710f46f');

--1
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Benjamin','Willis','401-426-6955','bwillis@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Louis','Baker','816-618-8670','lbaker@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jean','Copeland','320-401-1009','jcopeland@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Phil','Reyes','716-462-4515','preyes@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Elmer','Harper','707-951-2074','eharper@hotmail.com',5);
--2
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Liberty','Romero','330-254-2429','lromero@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Lily-Mae','Good','215-900-4880','lgood@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Carley','Lucas','302-262-9447','clucas@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Riya','Vinson','302-992-1139','rvinson@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Sia','Aguilar','281-378-3571','saguilar@hotmail.com',5);
--3
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Stefania','Davison','336-354-8157','sdavison@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Karis','Valdez','787-395-3526','kvaldez@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Shelby','Travis','203-394-0550','stravis@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Darlene','Bartlett','856-357-9973','dbartlett@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Saima','Mill','305-945-7546','smill@hotmail.com',2);
--4
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Abbigail','Aguirre','408-522-4176','aaguire@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Kiaan','Nixon','925-481-2156','knixon@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Tille','Wallis','843-651-6274','twallis@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Sidra','Mcmanus','415-937-4227','smcmanus@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Latisha','Atkinson','224-226-8438','latkinson@hotmail.com',3);
--5
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jed','Neal','559-517-0989','jneal@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ioana','Needham','973-364-8536','ineedham@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jeanette','Sims','671-563-1736','jsims@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Lexi-Mai','Mohammed','989-553-9122','lmohammed@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Olive','Hough','334-458-2788','ohough@hotmail.com',5);
--6
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Joey','Graves','231-839-4125','jgraves@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Benny','Mills','650-949-8545','bmills@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Donnie','Drake','706-960-4782','ddrake@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jon','Dunn','507-320-6339','jdunn@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Luis','Kelly','206-905-5937','lkelly@hotmail.com',4);
--7
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Genevine','Bryan','973-635-5576','gbryan@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Anita','Mendoza','860-449-6655','amendoza@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jeremiah','Hansen','412-837-0055','jhansen@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jodi','Cobb','925-437-1810','jcobb@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Paulette','Poole','813-366-3557','ppoole@hotmail.com',4);
--8
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Dana','Bennett','248-875-2499','dbennett@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Brandon','Parsons','301-230-7393','bparsons@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Flora','Weber','510-935-2207','fweber@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Conrad','Clayton','651-864-8844','cclayton@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Megan','Pearson','757-288-4905','mpearson@hotmail.com',4);
--9
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Santiago','Williams','785-550-9601','swilliams@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Moses','Cummings','661-889-4217','mcummings@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Garrett','Moreno','774-230-7740','gmoreno@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Blanche','Hudson','860-552-1409','bhudson@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Maurice','Pierce','240-638-7929','mpierce@hotmail.com',4);
--10
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Valerie','Bowers','912-437-2371','vbowers@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Elisa','Gregory','520-584-1611','egregory@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ramon','Dawson','561-844-2226','rdawson@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ana','Fowler','949-268-4431','afowler@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ray','Harrington','559-346-1822','rharrington@hotmail.com',4);
--10
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Rafael','Perez','435-473-2319','rperez@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Fred','Bass','440-519-3495','fbass@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Tiffany','Wood','732-238-7778','twood@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Andrew','Chapman','508-902-9350','achapman@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jennifer','Klein','915-502-9612','jklein@hotmail.com',4);
--11
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Anita','Medina','504-887-8492','amedina@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Anne','Herrera','301-594-8340','aherrera@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Melissa','Tucker','651-769-1723','mtucker@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Marion','Peterson','580-304-0433','mpeterson@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Kristi','Jones','703-283-8296','kjones@hotmail.com',4);
--12
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Mindy','Garrett','708-431-0659','mgarrett@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Judy','Gibbs','419-459-9099','jgibbs@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Christopher','Potter','740-577-6115','cpotter@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Kelly','Scott','609-339-5084','kscott@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Amelia','Anderson','571-328-3355','aanderson@hotmail.com',4);
--13
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jonathan','Allen','812-495-0881','jallen@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Alexis','Dunn','608-370-2241','adunn@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Roberta','Reed','313-883-5475','rreed@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Kyle','Rowe','513-821-0240','krowe@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Cecelia','Rice','602-414-2499','crice@hotmail.com',4);
--14
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jared','Montgomery','858-270-9972','jmontgomery@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Troy','Rivera','931-516-1246','trivera@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Cindy','Tran','312-644-6127','ctran@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Samuel','Stevenson','216-776-4677','sstevenson@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Dexter','Owens','812-329-1767','dowens@hotmail.com',4);
--15
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Brenda','Caldwell','740-417-8190','bcaldwell@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Erin','Kim','267-297-4550','ekim@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Faith','Washington','615-816-7677','fwashington@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Edmund','Cortez','406-268-6407','ecortez@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ernesto','Gonzales','814-432-7443','egonzales@hotmail.com',4);
--16
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Brenda','Caldwell','740-417-8190','bcaldwell@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Erin','Kim','267-297-4550','ekim@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Faith','Washington','615-816-7677','fwashington@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Edmund','Cortez','406-268-6407','ecortez@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ernesto','Gonzales','814-432-7443','egonzales@hotmail.com',4);
--17
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Douglas','Marsh','253-799-6807','dmarsh@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Evelyn','Graves','740-419-3921','egraves@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Cesar','Douglas','276-293-5259','cdouglas@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Tabitha','Sulivan','662-276-7088','tsulivan@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Alma','Chapman','617-558-7335','achapman@hotmail.com',4);
--18
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Renee','Poole','914-341-6924','rpoole@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Edna','Wilson','919-579-2256','ewilson@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Donnie','Flowers','917-469-2039','dflowers@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Henry','Nguyen','817-347-8462','hnguyen@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jose','Howell','352-316-4949','jhowell@hotmail.com',4);
--19
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Olivia','Boone','831-205-1999','oboone@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Conrad','Reed','443-605-9877','creed@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Theresa','Thompson','402-213-1028','tthompson@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Milton','Young','405-486-0422','myoung@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Dwayne','Lamb','650-575-7789','dlamb@hotmail.com',4);
--20
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Betty','Huff','215-752-8296','bhuff@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Carole','Holloway','641-866-7691','cholloway@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Maime','Wilkins','718-696-5317','mwilkins@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Tim','Curtis','701-347-2072','tcurtis@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Delia','Edwards','202-604-8499','dedwards@hotmail.com',4);
--21
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Lynn','Chandler','360-935-5285','lchandler@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Earnest','Bush','325-279-6083','ebush@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Deborah','Malone','203-933-9327','dmalone@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Sophie','Hogan','225-330-9185','shogan@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Raquel','Pittman','440-376-5927','rpittman@hotmail.com',4);
