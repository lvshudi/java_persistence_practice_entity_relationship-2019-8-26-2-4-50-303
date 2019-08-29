CREATE TABLE employee (
  id INTEGER PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  age   int(4) NOT NULL
);



-- -----------------------------------------------------
-- Table `mydb`.`System_Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`System_Administrator` (
  `userID` INT NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`))


-- -----------------------------------------------------
-- Table `mydb`.`Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Company` (
  `CompanyID` INT NOT NULL,
  `CompanyAdminID` VARCHAR(45) NOT NULL,
  `CompanyName` VARCHAR(45) NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`CompanyID`),
  CONSTRAINT `SysAdMinID`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`System_Administrator` (`userID`)


-- -----------------------------------------------------
-- Table `mydb`.`CompanyAdministrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CompanyAdministrator` (
  `CompanyAdminID` INT NOT NULL,
  `CompanyAdminName` VARCHAR(45) NOT NULL,
  `EmployeeID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CompanyAdminID`),
  CONSTRAINT `company`
    FOREIGN KEY (`CompanyAdminID`)
    REFERENCES `mydb`.`Company` (`CompanyID`)


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `CompanyID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`, `CompanyID`),
  CONSTRAINT `CompanyAdmID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `CompanyAdministrator` (`CompanyAdminID`)
  CONSTRAINT `CompanyID`
    FOREIGN KEY (`CompanyID`)
    REFERENCES `mydb`.`Company` (`CompanyID`)
