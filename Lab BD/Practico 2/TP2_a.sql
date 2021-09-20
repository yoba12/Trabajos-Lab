DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `code` VARCHAR(255) PRIMARY KEY,
  `continent` VARCHAR(255) NOT NULL,
  `region` VARCHAR(255) NOT NULL,
  `surfacearea` INTEGER,
  `indepyear` INTEGER,
  `population` INTEGER,
  `lifeexpectancy` INTEGER,
  `gnp` INTEGER,
  `gnpoid` DOUBLE,
  `localname` VARCHAR(255) NOT NULL,
  `governmentform` VARCHAR(255) NOT NULL,
  `headofstate` VARCHAR(255) NOT NULL,
  `capital` INTEGER,
  `code2` VARCHAR(255) NOT NULL
);

CREATE TABLE `city` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `countrycode` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `district` VARCHAR(255) NOT NULL,
  `population` INTEGER,
  FOREIGN KEY (countrycode) REFERENCES country(code) 
) ENGINE=INNODB;


CREATE TABLE `countrylanguages` (
  `countrycode` VARCHAR(255) NOT NULL,
  `language` VARCHAR(255) NOT NULL,
  `isofficial` BOOLEAN,
  `percentage` INTEGER,
  PRIMARY KEY (`countrycode`, `language`),
  FOREIGN KEY (countrycode) REFERENCES country(code) 
 );


DROP table IF exists continent;
CREATE TABLE `continent` (
  `name` VARCHAR(255) NOT NULL,
  `area` int NOT NULL,
  `percentTotalMass` decimal(5,2) NOT NULL,
  `mostPopulousCity` char(255) NOT NULL,
  PRIMARY KEY (name)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



