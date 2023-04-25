SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
order by 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--order by 3,4

SELECT Location, date, total_cases, new_cases total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths

SELECT Location, date, total_cases, total_deaths, total_deaths/NULLIF(total_cases, 0)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
where location LIKE '%states%'
ORDER BY 1,2



-- Looking at Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected desc



-- Showing the Countries with Highest Death Coun per Population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC


-- Showing continents with the highest death count per population
-- I already changed some varchar data to int

SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC



-- GLOBAL NUMBERS 

SELECT date, SUM(new_cases) as total_cases, SUM(new_deathS) as total_deaths, SUM(new_deaths)/SUM(NULLIF(new_cases,0))*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER BY 1,2











