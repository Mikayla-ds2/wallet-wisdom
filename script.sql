-- head of table --
drop table if exists demographics

drop table if exists employment

drop table if exists housing

drop table if exists transportation

drop table if exists healthcare

drop table if exists debt

drop table if exists food

drop table if exists subscriptions

drop table if exists personalHousehold

drop table if exists discretionary

drop table if exists savingsInvestments

drop table if exists financialMetrics

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
    housingCost DECIMAL(10, 2),
    propertyTax DECIMAL(10, 2),
    hoaFees decimal(10, 2),
    homeInsurance DECIMAL(10, 2),
    utilities DECIMAL(10, 2),
    internet DECIMAL(10, 2),
    phone DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists transportation (
    personID int PRIMARY key,
    ownsCar BOOLEAN,
    carPayment decimal(10, 2),
    carInsurance decimal(10, 2),
    gas DECIMAL(10, 2),
    publicTransit DECIMAL(10, 2),
    carMaintenance DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists healthcare (
    personID int PRIMARY key,
    healthInsurance DECIMAL(10, 2),
    oopMedical DECIMAL(10, 2),
    dentalVision DECIMAL(10, 2),
    lifeInsurance DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists debt (
    personID int PRIMARY key,
    studentLoans DECIMAL(10, 2),
    ccPayment DECIMAL(10, 2),
    personalLoans DECIMAL(10, 2),
    medicalDebt DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists food (
    personID int PRIMARY key,
    groceries DECIMAL(10, 2),
    diningOut DECIMAL(10, 2),
    coffee DECIMAL(10, 2),
    alcohol DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists subscriptions (
    personID int PRIMARY key,
    streaming DECIMAL(10, 2),
    musicStreaming DECIMAL(10, 2),
    gaming DECIMAL(10, 2),
    gym DECIMAL(10, 2),
    otherSubscriptions DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists personalHousehold (
    personID int PRIMARY key,
    clothing DECIMAL(10, 2),
    personalCare DECIMAL(10, 2),
    householdSupplies DECIMAL(10, 2),
    childcare DECIMAL(10, 2),
    petExpenses DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists discretionary (
    personID int PRIMARY key,
    entertainment DECIMAL(10, 2),
    hobbies DECIMAL(10, 2),
    travel DECIMAL(10, 2),
    gifts DECIMAL(10, 2),
    donations DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists savingsInvestments (
    personID int PRIMARY key,
    retirement401k DECIMAL(10, 2),
    iraContribution DECIMAL(10, 2),
    emergencyFundContributions DECIMAL(10, 2),
    generalSavings DECIMAL(10, 2),
    investmentContributions DECIMAL(10, 2),
    contributions529 DECIMAL(10, 2),
    Foreign Key (personID) REFERENCES demographics(personID)
)

create table if not exists financialMetrics (
    personID int PRIMARY key,
    totalExpenses DECIMAL(10, 2),
    totalSavingsInvestments DECIMAL(10, 2),
    monthlyCashFlow DECIMAL(10, 2),
    housingRatio DECIMAL(10, 2),
    debtToIncome DECIMAL(10, 2),
    savingsInvestmentsRate DECIMAL(10, 2),
    carPaymentRatio DECIMAL(10, 2),
    monthsSaved DECIMAL(10, 2),
    financialHealth text,
    Foreign Key (personID) REFERENCES demographics(personID)
)

/copy demographics(personID, age, gender, raceEthnicity, education, region, householdType, householdSize)
from '/tmp/demographics.csv'
DELIMITER ','
csv HEADER;

/copy employment(personID, career, workArrangement, annualIncome, sideHustleIncome, monthlyIncome)
from '/tmp/employment.csv'
DELIMITER ','
CSV HEADER;

/copy housing(personID, housingStatus, housingCost, propertyTax, hoaFees, homeInsurance, utilities, internet, phone)
from '/tmp/housing.csv'
DELIMITER ','
csv header;

/copy transportation(personID, ownsCar, carPayment, carInsurance, gas, publicTransit, carMaintenance)
from '/tmp/transportation.csv'
DELIMITER ','
csv HEADER;

/copy healthcare(personID, healthInsurance, oopMedical, dentalVision, lifeInsurance)
from '/tmp/healthcare.csv'
DELIMITER ','
csv HEADER;

/copy debt(personID, studentLoans, ccPayment, personalLoans, medicalDebt)
from '/tmp/debt.csv'
DELIMITER ','
csv HEADER;

/copy food(personID, groceries, diningOut, coffee, alcohol)
from '/tmp/food.csv'
DELIMITER ','
csv HEADER;

/copy subscriptions(personID, streaming, musicStreaming, gaming, gym, otherSubscriptions)
from '/tmp/subscriptions.csv'
DELIMITER ','
csv header;

/copy personalHousehold(personID, clothing, personalCare, householdSupplies, childcare, petExpenses)
from '/tmp/personalHousehold.csv'
DELIMITER ','
csv header;

/copy discretionary(personID, entertainment, hobbies, travel, gifts, donations)
from '/tmp/discretionary.csv'
DELIMITER ','
csv HEADER;

/copy savingsInvestments(personID, retirement401k, iraContribution, emergencyFundContributions, generalSavings, investmentContributions, contributions529)
from '/tmp/savingsInvestments.csv'
DELIMITER ','
csv header;

/copy financialMetrics(personID, totalExpenses, totalSavingsInvestments, monthlyCashFlow, housingRatio, debtToIncome, savingsInvestmentsRate, carPaymentRatio, monthsSaved, financialHealth)
from '/tmp/financialMetrics.csv'
DELIMITER ','
CSV HEADER;

select * from demographics
limit 10;

select raceEthnicity, region from demographics
group by region, raceEthnicity
order by region asc;

select personID, raceEthnicity, age from demographics
order by age desc;

select * from debt

select * from demographics
join debt on demographics.personID = debt.personID

select demographics.personID, age, gender, region, householdType, householdSize, studentLoans from demographics
join debt on demographics.personID = debt.personID
where studentLoans > 0
order by studentLoans desc
limit 20;
-- note: explore person 2425


