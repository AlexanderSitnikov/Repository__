--Preview of all tables

SELECT *
FROM Portfolio_project.dbo.billionaires_2023#csv$

SELECT *
FROM Portfolio_project.dbo.billionaires_2022#csv$

SELECT *
FROM Portfolio_project.dbo.billionaires_2021#csv$

SELECT *
FROM Portfolio_project.dbo.billionaires_2020#csv$

SELECT *
FROM Portfolio_project.dbo.billionaires_2019#csv$

SELECT *
FROM Portfolio_project.dbo.billionaires_2018#csv$

--Select data that I will use

SELECT Rank, net_worth, full_name, age, gender, country_of_citizenship, organization_name
FROM Portfolio_project.dbo.billionaires_2023#csv$

--See how much billionaires have top country's by quantitie of billionaire 

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE country_of_citizenship='United States'

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE country_of_citizenship='China'

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE country_of_citizenship='India'

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE country_of_citizenship='Germany'

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE country_of_citizenship='Russia'

--Looking how much female and male billionaires we have in 2023

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE gender='Female'

SELECT 
    COUNT(country_of_citizenship)
FROM Portfolio_project.dbo.billionaires_2023#csv$
WHERE gender='Male'

--Looking average age of billionaires

SELECT 
    AVG(age)
FROM Portfolio_project.dbo.billionaires_2023#csv$

--looking min and max age of billionaires

SELECT 
    MIN(age)
FROM Portfolio_project.dbo.billionaires_2023#csv$

SELECT 
    MAX(age)
FROM Portfolio_project.dbo.billionaires_2023#csv$

--looking for total money that belonge to billionaires

SELECT 
    SUM(cast(net_worth as int))
FROM Portfolio_project.dbo.billionaires_2023#csv$

--Comparison net_worth of billionaires by 2023 and 2022 years

SELECT *
FROM Portfolio_project.dbo.billionaires_2023#csv$ AS Forbes23
JOIN Portfolio_project.dbo.billionaires_2022#csv$ AS Forbes22
ON Forbes23.full_name=Forbes22.full_name
ORDER BY 3

--Emphasize crucial aspects of data set

SELECT Forbes23.year, Forbes23.rank, Forbes23.full_name, Forbes23.net_worth, Forbes22.year, Forbes22.rank, Forbes22.full_name, Forbes22.net_worth 
FROM Portfolio_project.dbo.billionaires_2023#csv$ AS Forbes23
JOIN Portfolio_project.dbo.billionaires_2022#csv$ AS Forbes22
ON Forbes23.full_name=Forbes22.full_name
ORDER BY Forbes23.rank

--Comparison of net_worth and rank by 2023 and 2022

SELECT Forbes23.full_name,  Forbes23.year, Forbes23.rank, Forbes23.net_worth, Forbes22.year AS last_year, Forbes22.rank, Forbes22.net_worth 
FROM Portfolio_project.dbo.billionaires_2023#csv$ AS Forbes23
JOIN Portfolio_project.dbo.billionaires_2022#csv$ AS Forbes22
ON Forbes23.full_name=Forbes22.full_name
ORDER BY Forbes23.rank

--Creating a View for later visualizations

CREATE VIEW ComparisonWelthyByYears AS
SELECT Forbes23.full_name,  Forbes23.year, Forbes23.rank, Forbes23.net_worth, Forbes22.year AS last_year, Forbes22.rank AS was_rank, Forbes22.net_worth AS wa_net_worth
FROM Portfolio_project.dbo.billionaires_2023#csv$ AS Forbes23
JOIN Portfolio_project.dbo.billionaires_2022#csv$ AS Forbes22
ON Forbes23.full_name=Forbes22.full_name
--ORDER BY Forbes23.rank

--Checking my new working table

SELECT *
From [dbo].[ComparisonWelthyByYears]