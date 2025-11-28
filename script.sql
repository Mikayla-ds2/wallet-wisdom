-- head of table --
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

-- wanna create a full table too with all features --
drop table if exists finance

CREATE TABLE finance (
    personID int generated always as identity primary key,
    age INT,
    gender TEXT,
    raceEthnicity TEXT,
    education TEXT,
    region TEXT,
    householdType TEXT,
    householdSize INT,
    career TEXT,
    workArrangement TEXT,
    annualIncome DECIMAL(10, 2),
    sideHustleIncome DECIMAL(10, 2),
    monthlyIncome DECIMAL(10, 2),
    housingStatus TEXT,
    housingCost DECIMAL(10, 2),
    propertyTax DECIMAL(10, 2),
    hoaFees DECIMAL(10, 2),
    homeInsurance DECIMAL(10, 2),
    utilities DECIMAL(10, 2),
    internet DECIMAL(10, 2),
    phone DECIMAL(10, 2),
    ownsCar BOOLEAN,
    carPayment DECIMAL(10, 2),
    carInsurance DECIMAL(10, 2),
    gas DECIMAL(10, 2),
    publicTransit DECIMAL(10, 2),
    carMaintenance DECIMAL(10, 2),
    healthInsurance DECIMAL(10, 2),
    oopMedical DECIMAL(10, 2),
    dentalVision DECIMAL(10, 2),
    lifeInsurance DECIMAL(10, 2),
    studentLoans DECIMAL(10, 2),
    ccPayment DECIMAL(10, 2),
    personalLoans DECIMAL(10, 2),
    medicalDebt DECIMAL(10, 2),
    groceries DECIMAL(10, 2),
    diningOut DECIMAL(10, 2),
    coffee DECIMAL(10, 2),
    alcohol DECIMAL(10, 2),
    streaming DECIMAL(10, 2),
    musicStreaming DECIMAL(10, 2),
    gaming DECIMAL(10, 2),
    gym DECIMAL(10, 2),
    otherSubscriptions DECIMAL(10, 2),
    clothing DECIMAL(10, 2),
    personalCare DECIMAL(10, 2),
    householdSupplies DECIMAL(10, 2),
    childcare DECIMAL(10, 2),
    petExpenses DECIMAL(10, 2),
    entertainment DECIMAL(10, 2),
    hobbies DECIMAL(10, 2),
    travel DECIMAL(10, 2),
    gifts DECIMAL(10, 2),
    donations DECIMAL(10, 2),
    retirement401k DECIMAL(10, 2),
    iraContribution DECIMAL(10, 2),
    emergencyFundContributions DECIMAL(10, 2),
    generalSavings DECIMAL(10, 2),
    investmentContributions DECIMAL(10, 2),
    contributions529 DECIMAL(10, 2),
    totalExpenses DECIMAL(10, 2),
    totalSavingsInvestments DECIMAL(10, 2),
    monthlyCashFlow DECIMAL(10, 2),
    housingRatio DECIMAL(10, 2),
    debtToIncome DECIMAL(10, 2),
    savingsInvestmentsRate DECIMAL(10, 2),
    carPaymentRatio DECIMAL(10, 2),
    monthsSaved DECIMAL(10, 2),
    financialHealth TEXT,
    ageCategory TEXT
);

/copy finance(personID, age, gender, raceEthnicity, education, region, householdType, 
householdSize, career, workArrangement, annualIncome, sideHustleIncome, monthlyIncome, 
housingStatus, housingCost, propertyTax, hoaFees, homeInsurance, utilities, internet, phone, 
ownsCar, carPayment, carInsurance, gas, publicTransit, carMaintenance, healthInsurance, oopMedical, 
dentalVision, lifeInsurance, studentLoans, ccPayment, personalLoans, medicalDebt, groceries, diningOut, 
coffee, alcohol, streaming, musicStreaming, gaming, gym, otherSubscriptions, clothing, personalCare, 
householdSupplies, childcare, petExpenses, entertainment, hobbies, travel, gifts, donations, retirement401k, 
iraContribution, emergencyFundContributions, generalSavings, investmentContributions, contributions529, 
totalExpenses, totalSavingsInvestments, monthlyCashFlow, housingRatio, debtToIncome, 
savingsInvestmentsRate, carPaymentRatio, monthsSaved, financialHealth, ageCategory)
from '/tmp/personalFinanceDataset.csv'
DELIMITER ','
csv header;

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

-- BEGINNING OF QUERIES --

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
-- note: explore person 2425 --


select * from finance

select * from finance
where monthlycashflow > 0
order by monthlycashflow desc;

select education, avg(monthlycashflow) as average from finance
where monthlycashflow > 0
group by education
order by average desc;

select education, sum(travel) as travelExpenses from finance
where householdSize < 3
group by education
order by travelExpenses desc

select financialHealth, sum(travel) as travelExpenses from finance
where householdSize < 3
group by financialHealth
order by travelExpenses desc;

select * from finance

select financialhealth, sum(totalsavingsinvestments) as total from finance
where householdSize < 3
group by financialhealth
order by total desc;

select raceEthnicity, count(raceEthnicity) as count from finance
where financialHealth = 'FinanciallyThriving'
and householdSize < 3
group by raceEthnicity
order by count desc;

select region, count(region) as count from finance
where monthlycashflow > 0
group by region
order by count desc;

select householdType, count(householdType) as count from finance
where monthlycashflow > 0
group by householdType
order by count desc;

select * from finance
where raceEthnicity = 'Black/African American'
and monthlycashflow > 0
order by annualIncome desc;

select career, householdType, financialHealth, count(financialHealth) as count from finance
where monthlycashflow > 0
group by career, householdType, financialHealth
order by count desc;

select personID, age, gender, raceEthnicity, education, region, householdType, householdSize, career, workArrangement, annualIncome, housingStatus, monthlyCashFlow, financialHealth from finance
where career = 'Engineering'
and financialHealth not in ('FinanciallyThriving', 'FinanciallyStable')
order by monthlyCashFlow desc;

select personID, age, gender, raceEthnicity, education, region, householdType, householdSize, career, workArrangement, annualIncome, housingStatus, monthlyCashFlow, financialHealth from finance
where career = 'Engineering'
and financialHealth not in ('FinanciallyThriving', 'FinanciallyStable')

select * from demographics

select personID, age, gender, raceEthnicity, education, region, householdType, householdSize, career, workArrangement, housingStatus, ownsCar, financialHealth from finance
order by age desc;

select personID, age, ageCategory, gender, raceEthnicity, education, region, householdType, householdSize, career, workArrangement, ownsCar, housingStatus, financialHealth from finance

select householdType, avg(age) as averageAge from finance
group by householdType
order by averageAge desc;

select age from finance
order by age desc;
-- 25 to 70 years old --

select ageCategory, career, count(personID) as count from finance
group by ageCategory, career
order by count desc;

select education, avg(age) as average from finance
group by education
order by average desc; 

select education, region, count(personID) as count from finance
group by education, region
order by count desc;

select education, avg(monthlyIncome) as averageIncome from finance
group by education
order by averageIncome desc;

select career, raceEthnicity, avg(monthlyIncome) as averageIncome from finance
group by career, raceEthnicity
order by averageIncome desc;

select gender, region, avg(monthlyIncome) as averageIncome from finance
group by gender, region
order by averageIncome desc;

select education, career, count(age) as count from finance
where annualIncome > 50000
group by education, career
order by count desc;

select * from finance
where education = 'Ph.D' and career = 'PartTime'

select gender, region, avg(studentLoans + personalLoans) as averageLoans from finance
group by gender, region
order by averageLoans desc;

select * from debt

select * from finance
where ccPayment > 100

select * from demographics
join housing on demographics.personID = housing.personID

select education, raceEthnicity, region, avg(housingCost) as total from demographics
join housing on demographics.personID = housing.personID
join employment on demographics.personID = employment.personID
where age > 35
and region != 'West'
group by education, raceEthnicity, region
order by total desc;

select * from demographics
join employment on demographics.personID = employment.personID

select region, career, sum(sideHustleIncome) as total from demographics
join employment on demographics.personID = employment.personID
group by region, career
order by total desc

select * from finance
where personID = 2425

select ageCategory, sum(sideHustleIncome) as total from finance
group by ageCategory
order by total DESC

select career, ageCategory, avg(sideHustleIncome) as total from finance
group by career, ageCategory
order by total desc;

select * from demographics
join employment on demographics.personID = employment.personID
where career = 'Education'
order by monthlyIncome desc;

select * from employment
where career = 'Education' and workArrangement != 'Office'

select workArrangement, gender, avg(monthlyIncome) as average from employment
join demographics on employment.personID = demographics.personID
group by workArrangement, gender
order by average desc;

select householdType avg(monthlyIncome) as average from demographics
join employment on demographics.personID = employment.personID
where region != 'West'
group by householdType

select * from finance
where householdType = 'Roommates'
order by finance


select career, avg(monthlyIncome) as average from demographics
join employment on demographics.personID = employment.personID
where householdType = 'Roommates'
group by career
order by average desc;

select region, count(personID) as count from demographics
where householdType = 'Roommates'
group by region
order by count desc;

