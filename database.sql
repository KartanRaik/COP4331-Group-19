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

CREATE TABLE `group19A`.`Users`
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

CREATE TABLE `group19A`.`Contacts`
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

insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Liberty','Romero','330-254-2429','lromero@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Lily-Mae','Good','215-900-4880','lgood@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Carley','Lucas','302-262-9447','clucas@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Riya','Vinson','302-992-1139','rvinson@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Sia','Aguilar','281-378-3571','saguilar@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Stefania','Davison','336-354-8157','sdavison@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Karis','Valdez','787-395-3526','kvaldez@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Shelby','Travis','203-394-0550','stravis@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Darlene','Bartlett','856-357-9973','dbartlett@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Saima','Mill','305-945-7546','smill@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Abbigail','Aguirre','408-522-4176','aaguire@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Kiaan','Nixon','925-481-2156','knixon@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Tille','Wallis','843-651-6274','twallis@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Sidra','Mcmanus','415-937-4227','smcmanus@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Latisha','Atkinson','224-226-8438','latkinson@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Jed','Neal','559-517-0989','jneal@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Ioana','Needham','973-364-8536','ineedham@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Jeanette','Sims','671-563-1736','jsims@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Lexi-Mai','Mohammed','989-553-9122','lmohammed@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Olive','Hough','334-458-2788','ohough@hotmail.com');
insert into Contacts (FirstName,LastName,PhoneNumber,Email) VALUES ('Abigail','Smith','269-861-0634','asmith@hotmail.com');
