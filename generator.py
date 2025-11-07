import pandas as pd
import numpy as np
from datetime import datatime
import random

# setting seed for reproducibility
np.random.seed(42)
random.seed(42)

# sample size => number of data points
n = 3500

print("Generating comprehensive personal finance dataset...")
print(f"Creating {n} synthetic individuals with full financial profiles...\n")

# -- demographic data --
# age distribution (weighted towards the working class)
ages = np.random.choice(
    [25, 30, 35, 40, 45, 50, 55, 60, 65, 70],
    size=n,
    p=[0.15, 0.2, 0.15, 0.12, 0.1, 0.08, 0.05, 0.03, 0.02]
)

# race/ethnicity
race_ethnicity = np.random.choice(
    ['White', 'Hispanic/Latino', 'Black/African American', 'Asian', 'Other/Multiracial'],
    size=n,
    p=[0.6, 0.19, 0.13, 0.06, 0.02]
)

# education level (age is adjusted; elderly less likely to have degrees)  
def assignEducation(age):
    if age < 35:
        return np.random.choice(
            ['High School', "Some College/Associate's", "Bachelor's", "Master's", 'Ph.D'],
            p=[0.25, 0.25, 0.35, 0.13, 0.02]
        )
    elif age < 55:
        return np.random.choice(
            ['High School', "Some College/Associate's", "Bachelor's", "Master's", 'Ph.D'],
            p=[0.35, 0.28, 0.25, 0.1, 0.02]
        )
    else:
        return np.random.choice(
            ['High School', "Some College/Associate's", "Bachelor's", "Master's", 'Ph.D'],
            p=[0.45, 0.3, 0.18, 0.06, 0.01]
        )
education = [assignEducation(age) for age in ages]

# gender (more women in college-educated groups)
def assignGender(edu):
    if edu in ["Bachelor's", "Master's", 'Ph.D']:
        return np.random.choice(['Female', 'Male'], p=[0.57, 0.43])
    else:
        return np.random.choice(['Female', 'Male'], p=[0.51, 0.49])
gender = [assignGender(edu) for edu in education]

# geograhic data
region = np.random.choice(['South', 'West', 'Midwest', 'Northeast'],
                          size=n,
                          p=[0.38, 0.24, 0.21, 0.17])

# household type (age-dependent)
def assignHousehold(age):
    if age < 30:
        return np.random.choice(
            ['Single', 'DINKS', 'SmallFamily', 'SingleParent', 'Roommates'],
            p=[0.45, 0.25, 0.1, 0.05, 0.15]
        )
    elif age < 45:
        return np.random.choice(
            ['Single', 'DINKS', 'SmallFamily', 'SingleParent', 'Other'],
            p=[0.2, 0.15, 0.45, 0.15, 0.05]
        )
    elif age < 65:
        return np.random.choice(
            ['Single', 'DINKS', 'SmallFamily', 'SingleParent', 'Other'],
            p=[0.25, 0.35, 0.25, 0.08, 0.07]
        )
    else:
        return np.random.choice(
            ['Single', 'DINKS', 'Other'],
            p=[0.4, 0.5, 0.1]
        )
household_type = [assignHousehold(age) for age in ages]
household_size = []
for hh in household_type:
    if hh == 'Single':
        household_size.append(1)
    elif hh == 'DINKS':
        household_size.append(2)
    elif hh == 'SmallFamily':
        household_size.append(np.random.choice([3, 4, 5], p=[0.4, 0.4, 0.2]))
    elif hh == 'SingleParent':
        household_size.append(np.random.choice([2, 3, 4], p=[0.5, 0.3, 0.2]))
    else: # roommates & other
        household_size.append(np.random.choice([2, 3, 4], p=[0.5, 0.3, 0.2]))

# -- career & income --
# career fields (education-dependent)
def assignCareer(edu, age):
    if age >= 65:
        return np.random.choice(['Retired', 'PartTime'], p=[0.75, 0.25])
    elif edu == 'High School':
        return np.random.choice(
            ['Retail', 'FoodService', 'Manufacturing', 'Construction', 'Transportation', 'Admin'],
            p=[0.25, 0.2, 0.15, 0.15, 0.15, 0.1]
        )
    elif edu == "Some College/Associate's":
        return np.random.choice(
            ['Retail', 'Admin', 'Healthcare', 'Manufacturing', 'Sales', 'Service'],
            p=[0.2, 0.2, 0.2, 0.15, 0.15, 0.1]
        )
    elif edu == "Bachelor's":
        return np.random.choice(
            ['Technology', 'Healthcare', 'Business', 'Education', 'Engineering', 'Sales', 'Finance'],
            p=[0.18, 0.15, 0.15, 0.15, 0.12, 0.12, 0.13]
        )
    elif edu == "Master's":
        return np.random.choice(
            ['Technology', 'Healthcare', 'Education', 'Business', 'Engineering', 'Finance', 'Legal'],
            p=[0.2, 0.18, 0.15, 0.15, 0.12, 0.12, 0.08]
        )
    else:
        return np.random.choice(
            ['Education', 'Healthcare', 'Technology', 'Research'],
            p=[0.35, 0.3, 0.2, 0.15]
        )
career = [assignCareer(edu, age) for edu, age in zip(education, ages)]

# work arrangement (career & age dependent)
def arrangeWork(career, age):
    if career == 'Retired':
        return 'Retired'
    elif career == 'PartTime':
        return 'PartTime'
    elif career in ['Technology', 'Finance', 'Business']:
        return np.random.choice(['Remote', 'Hybrid', 'Office'], p=[0.35, 0.4, 0.25])
    elif career in ['Education', 'Healthcare', 'Legal']:
        return np.random.choice(['Office', 'Hybrid'], p=[0.7, 0.3])
    else:
        return np.random.choice(['Office', 'Hybrid'], p=[0.85, 0.15])

workArrangement = [arrangeWork(c, a) for c, a in zip(career, ages)]

# annual income (education, age, career, region dependent)
def calculateIncome(edu, age, career, region):
    # start w/ base income by education
    baseIncome = {
        'High School': 35000,
        "Some College/Associate's": 45000,
        "Bachelor's": 70000,
        "Master's": 90000,
        'Ph.D':105000
    }
    
    # career multipliers
    careerMultipliers = {
        'Technology': 1.4, 'Finance': 1.3, 'Engineering': 1.3, 'Legal': 1.35,
        'Healthcare': 1.2, 'Business': 1.1, 'Education': 0.85, 'Research': 0.9,
        'Sales': 1.0, 'Admin': 0.9, 'Healthcare': 0.85,
        'Manufacturing': 0.95, 'Retail': 0.75, 'FoodService': 0.7,
        'Construction': 1.0, 'Transportation': 0.85, 'Service': 0.75,
        'Retired': 0, 'PartTime': 0.4
    }
    
    # age multipliers
    if age < 30:
        ageMultiplier = 0.8
    elif age < 40:
        ageMultiplier = 1.0
    elif age < 50:
        ageMultiplier = 1.15
    elif age < 60:
        ageMultiplier = 1.2
    else: 
        ageMultiplier = 1.1
    
    # region cost-of-living adjustment
    regionMultipliers = {
        'Northeast': 1.15,
        'West': 1.2,
        'Midwest': 0.9,
        'South': 0.95
    }
    
    if career == 'Retired':
        return np.random.uniform(25000, 65000) # retirement income (Social Security + pension/savings)
    
    income = baseIncome[edu] * careerMultipliers[career] * ageMultiplier * regionMultipliers[region]
    
    # add realistic variation
    income = income * np.random.uniform(0.85, 1.25)
    
    return round(income, 2)

annualIncome = [calculateIncome(e, c, a, r) for e, c, a, r in zip(education, career, ages, region)]

# side hustle income (20% of people have side income)
sideHustle = np.random.choice([True, False], size=n, p=[0.2, 0.8])
sideHustleIncome = []
for i, sideHustle in enumerate(sideHustle):
    if sideHustle and annualIncome[i] > 0:
        sideIncome = annualIncome[i] * np.random.uniform(0.05, 0.2)
        sideHustleIncome.append(round(sideIncome, 2))
    else:
        sideHustleIncome.append(0)

# monthly income 
monthlyIncome = [(annualIncome + sideHustleIncome) / 12 for annualIncome, sideHustleIncome in zip(annualIncome, sideHustleIncome)]

# -- housing costs --
# housing status (age & income dependent)
def assignHousingStatus(age, income):
    if age < 30:
        return np.random.choice(['Rent', 'Own'], p=[0.8, 0.2])
    elif age < 40:
        return np.random.choice(['Rent', 'Own'], p=[0.55, 0.45])
    elif age < 60:
        if income > 60000:
            return np.random.choice(['Rent', 'Own'], p=[0.3, 0.7])
        else:
            return np.random.choice(['Rent', 'Own'], p=[0.5, 0.5])
    else:
        return np.random.choice(['Rent', 'Own'], p=[0.25, 0.75])

housingStatus = [assignHousingStatus(a, inc) for a, inc in zip(ages, annualIncome)]

# housing cost (region, household size, income dependent)
def calculateHousingCost(status, region, hh_size, income):
    # base monthly costs by region 
    baseRent = {'Northeast': 1900, 'West': 2100, 'Midwest': 1200, 'South': 1400}
    baseMortgage = {'Northeast': 2200, 'West': 2600, 'Midwest': 1400, 'South': 1600}

    if status == 'Rent':
        cost = baseRent[region] * (0.7 + 0.15 * hh_size)
    else:
        cost = baseMortgage[region] * (0.7 + 0.15 * hh_size)
    
    incomeFactor = (income / 12) / 5000
    cost = cost * np.random.uniform(0.7, 1.3) * (0.8 + 0.4 * incomeFactor)
    
    return round(cost, 2)

housingCost = [calculateHousingCost(s, r, h, inc) 
                for s, r, h, inc in zip(housingStatus, region, household_size, annualIncome)]

# property tax (for owner's only)
propertyTax = [round(housing / 12, 2) if status == 'Own' else 0
               for housing, status in zip(housingCost, housingStatus)]

# hoa fees (30% of owners)
hoaFees = []
for status in housingStatus:
    if status == 'Own' and np.random.random() < 0.3:
        hoaFees.append(round(np.random.uniform(50, 400), 2))
    else:
        hoaFees.append(0)

# insurance
homeInsurance = [round(np.random.uniform(80, 200), 2) if status == 'Own'
                 else round(np.random.uniform(15, 35), 2) for status in housingStatus]

# utilities
def calculateUtilities(hh_size, workArrangement)



        

