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

insert into Users (FirstName,LastName,Login,Password) VALUES ('Anthony','Galbo','AnthonyG','agalbo1');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Johnny','Ngo','JohnnyN','jngo1');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Kartik','Rana','KartikR','krana1');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Chris','Herrera','ChrisH','cherrera1');
insert into Users (FirstName,LastName,Login,Password) VALUES ('Angel','Garcia','AngelG','agarcia1');

insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Liberty','Romero','330-254-2429','lromero@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Lily-Mae','Good','215-900-4880','lgood@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Carley','Lucas','302-262-9447','clucas@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Riya','Vinson','302-992-1139','rvinson@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Sia','Aguilar','281-378-3571','saguilar@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Stefania','Davison','336-354-8157','sdavison@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Karis','Valdez','787-395-3526','kvaldez@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Shelby','Travis','203-394-0550','stravis@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Darlene','Bartlett','856-357-9973','dbartlett@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Saima','Mill','305-945-7546','smill@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Abbigail','Aguirre','408-522-4176','aaguire@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Kiaan','Nixon','925-481-2156','knixon@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Tille','Wallis','843-651-6274','twallis@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Sidra','Mcmanus','415-937-4227','smcmanus@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Latisha','Atkinson','224-226-8438','latkinson@hotmail.com',5);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jed','Neal','559-517-0989','jneal@hotmail.com',3);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Ioana','Needham','973-364-8536','ineedham@hotmail.com',1);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Jeanette','Sims','671-563-1736','jsims@hotmail.com',2);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Lexi-Mai','Mohammed','989-553-9122','lmohammed@hotmail.com',4);
insert into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES ('Olive','Hough','334-458-2788','ohough@hotmail.com',3);
