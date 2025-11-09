-- head of table --
drop table if exists demographics

create table if not exists demographics (
    personID int PRIMARY key,
    age int,
    gender TEXT,
    raceEthnicity text,
    education text,
    region text,
    householdType text,
    householdSize int
)

create table if not exists employment (
    personID int PRIMARY key,
    career text,
    workArrangement TEXT,
    annualIncome DECIMAL(10, 2),
    sideHustleIncome decimal(10, 2),
    monthlyIncome DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists housing (
    personID int PRIMARY key,
    housingStatus text,
    housingCost int,
    propertyTax DECIMAL(10, 2),
    hoaFees decimal(10, 2),
    homeInsurance DECIMAL(10, 2),
    utilities DECIMAL(10, 2),
    internet DECIMAL(10, 2),
    phone DECIMAL(10, 2)
    Foreign Key (personID) REFERENCES demographics(personID)
)
