SHOW DATABASES;

USE bytedegree;

SELECT Attrition, COUNT(*) AS RatingCount, 
       (COUNT(*) / (SELECT COUNT(*) FROM HR_basic)) AS Ratio
FROM HR_basic
GROUP BY Attrition;

# 과제 2-1-1
SELECT Attrition, 
			AVG(DistanceFromHome) AS avg, 
			Max(DistanceFromHome) AS Max, 
			Min(DistanceFromHome) AS Min, 
			STDDEV(DistanceFromHome) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

# 과제 2-1-2
SELECT Attrition, 
			AVG(MonthlyIncome) AS avg, 
			Max(MonthlyIncome) AS Max, 
			Min(MonthlyIncome) AS Min, 
			STDDEV(MonthlyIncome) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

# 과제 2-1-3
SELECT EnvironmentSatisfaction, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY EnvironmentSatisfaction)) * 100, 2), '%') AS ES_ATT_Ratio,
			 CONCAT(ROUND((COUNT(EnvironmentSatisfaction) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_ES_Ratio
FROM HR_basic
GROUP BY EnvironmentSatisfaction, Attrition
ORDER BY EnvironmentSatisfaction, Attrition;

# 과제 2-1-4
SELECT PerformanceRating, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS PR_ATT_Ratio,
			 CONCAT(ROUND((COUNT(PerformanceRating) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_PR_Ratio
FROM HR_basic
GROUP BY PerformanceRating, Attrition
ORDER BY PerformanceRating, Attrition;

# 과제 2-2
SELECT Attrition, 
			AVG(Age) AS avg, 
			Max(Age) AS Max, 
			Min(Age) AS Min, 
			STDDEV(Age) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT BusinessTravel, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY BusinessTravel)) * 100, 2), '%') AS BT_ATT_Ratio,
			 CONCAT(ROUND((COUNT(BusinessTravel) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_BT_Ratio
FROM HR_basic
GROUP BY BusinessTravel, Attrition
ORDER BY BusinessTravel, Attrition;

SELECT Attrition, 
			AVG(DailyRate) AS avg, 
			Max(DailyRate) AS Max, 
			Min(DailyRate) AS Min, 
			STDDEV(DailyRate) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Department, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY Department)) * 100, 2), '%') AS Department_ATT_Ratio,
			 CONCAT(ROUND((COUNT(Department) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_Department_Ratio
FROM HR_basic
GROUP BY Department, Attrition
ORDER BY Department, Attrition;

SELECT Education, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY Education)) * 100, 2), '%') AS Edu_ATT_Ratio,
			 CONCAT(ROUND((COUNT(Education) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_Edu_Ratio
FROM HR_basic
GROUP BY Education, Attrition
ORDER BY Education, Attrition;

SELECT EducationField, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY EducationField)) * 100, 2), '%') AS EF_ATT_Ratio,
			 CONCAT(ROUND((COUNT(EducationField) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_EF_Ratio
FROM HR_basic
GROUP BY EducationField, Attrition
ORDER BY EducationField, Attrition;

SELECT Gender, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY Gender)) * 100, 2), '%') AS Gender_ATT_Ratio,
			 CONCAT(ROUND((COUNT(Gender) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_Gender_Ratio
FROM HR_basic
GROUP BY Gender, Attrition
ORDER BY Gender, Attrition;

SELECT Attrition, 
			AVG(HourlyRate) AS avg, 
			Max(HourlyRate) AS Max, 
			Min(HourlyRate) AS Min, 
			STDDEV(HourlyRate) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT JobInvolvement, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobInvolvement)) * 100, 2), '%') AS JI_ATT_Ratio,
			 CONCAT(ROUND((COUNT(JobInvolvement) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_JI_Ratio
FROM HR_basic
GROUP BY JobInvolvement, Attrition
ORDER BY JobInvolvement, Attrition;

SELECT JobLevel, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobLevel)) * 100, 2), '%') AS JobLevel_ATT_Ratio,
			 CONCAT(ROUND((COUNT(JobLevel) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_JobLevel_Ratio
FROM HR_basic
GROUP BY JobLevel, Attrition
ORDER BY JobLevel, Attrition;

SELECT JobRole, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobRole)) * 100, 2), '%') AS JobRole_ATT_Ratio,
			 CONCAT(ROUND((COUNT(JobRole) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_JobRole_Ratio
FROM HR_basic
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;

SELECT JobSatisfaction, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobSatisfaction)) * 100, 2), '%') AS JobSatisfaction_ATT_Ratio,
			 CONCAT(ROUND((COUNT(JobSatisfaction) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_JobSatisfaction_Ratio
FROM HR_basic
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction, Attrition;

SELECT MaritalStatus, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY MaritalStatus)) * 100, 2), '%') AS MaritalStatus_ATT_Ratio,
			 CONCAT(ROUND((COUNT(MaritalStatus) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_MaritalStatus_Ratio
FROM HR_basic
GROUP BY MaritalStatus, Attrition
ORDER BY MaritalStatus, Attrition;

SELECT Attrition, 
			AVG(MonthlyRate) AS avg, 
			Max(MonthlyRate) AS Max, 
			Min(MonthlyRate) AS Min, 
			STDDEV(MonthlyRate) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Attrition, 
			AVG(NumCompaniesWorked) AS avg, 
			Max(NumCompaniesWorked) AS Max, 
			Min(NumCompaniesWorked) AS Min, 
			STDDEV(NumCompaniesWorked) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT OverTime, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY OverTime)) * 100, 2), '%') AS OverTime_ATT_Ratio,
			 CONCAT(ROUND((COUNT(OverTime) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_OverTime_Ratio
FROM HR_basic
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

SELECT Attrition, 
			AVG(PercentSalaryHike) AS avg, 
			Max(PercentSalaryHike) AS Max, 
			Min(PercentSalaryHike) AS Min, 
			STDDEV(PercentSalaryHike) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT RelationshipSatisfaction, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY RelationshipSatisfaction)) * 100, 2), '%') AS RS_ATT_Ratio,
			 CONCAT(ROUND((COUNT(RelationshipSatisfaction) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_RS_Ratio
FROM HR_basic
GROUP BY RelationshipSatisfaction, Attrition
ORDER BY RelationshipSatisfaction, Attrition;

SELECT StockOptionLevel, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY StockOptionLevel)) * 100, 2), '%') AS StockOptionLevel_ATT_Ratio,
			 CONCAT(ROUND((COUNT(StockOptionLevel) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_StockOptionLevel_Ratio
FROM HR_basic
GROUP BY StockOptionLevel, Attrition
ORDER BY StockOptionLevel, Attrition;

SELECT Attrition, 
			AVG(TotalWorkingYears) AS avg, 
			Max(TotalWorkingYears) AS Max, 
			Min(TotalWorkingYears) AS Min, 
			STDDEV(TotalWorkingYears) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Attrition, 
			AVG(TrainingTimesLastYear) AS avg, 
			Max(TrainingTimesLastYear) AS Max, 
			Min(TrainingTimesLastYear) AS Min, 
			STDDEV(TrainingTimesLastYear) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT WorkLifeBalance, 
			 Attrition, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(Attrition) / SUM(COUNT(Attrition)) OVER (PARTITION BY WorkLifeBalance)) * 100, 2), '%') AS WB_ATT_Ratio,
			 CONCAT(ROUND((COUNT(WorkLifeBalance) / SUM(COUNT(Attrition)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS ATT_WB_Ratio
FROM HR_basic
GROUP BY WorkLifeBalance, Attrition
ORDER BY WorkLifeBalance, Attrition;

SELECT Attrition, 
			AVG(YearsAtCompany) AS avg, 
			Max(YearsAtCompany) AS Max, 
			Min(YearsAtCompany) AS Min, 
			STDDEV(YearsAtCompany) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Attrition, 
			AVG(YearsInCurrentRole) AS avg, 
			Max(YearsInCurrentRole) AS Max, 
			Min(YearsInCurrentRole) AS Min, 
			STDDEV(YearsInCurrentRole) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Attrition, 
			AVG(YearsSinceLastPromotion) AS avg, 
			Max(YearsSinceLastPromotion) AS Max, 
			Min(YearsSinceLastPromotion) AS Min, 
			STDDEV(YearsSinceLastPromotion) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Attrition, 
			AVG(YearsWithCurrManager) AS avg, 
			Max(YearsWithCurrManager) AS Max, 
			Min(YearsWithCurrManager) AS Min, 
			STDDEV(YearsWithCurrManager) AS STDDEV
FROM HR_basic hb
GROUP BY Attrition;

SELECT Overtime,
			 Department,
		     JobRole,
			 Attrition,
			 Count(MonthlyIncome) AS Count,
			 AVG(MonthlyIncome) AS avg, 
			 Max(MonthlyIncome) AS Max, 
			 Min(MonthlyIncome) AS Min, 
			 STDDEV(MonthlyIncome) AS STDDEV
FROM HR_basic hb
GROUP BY OverTime, Department, JobRole, Attrition
ORDER BY OverTime, Department, JobRole, Attrition;

SELECT JobRole,
			 Round(Avg(Joblevel), 1) AS Avg_Joblevel,
			 CONCAT(Round((SUM(CASE WHEN Overtime='Yes' THEN 1 ELSE 0 END) / SUM(COUNT(Overtime)) OVER (PARTITION BY JobRole)) * 100, 2), '%')  AS Overtime_Ratio,
			 CONCAT(Round((SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobRole)) * 100, 2), '%')  AS Attrition_Ratio,
			 AVG(MonthlyIncome) AS avg, 
			 Max(MonthlyIncome) AS Max, 
			 Min(MonthlyIncome) AS Min
FROM HR_basic hb
GROUP BY JobRole
ORDER BY AVG_joblevel, JobRole;

# 과제 2-3
SELECT JobRole,
	   Count(*) AS count,
       AVG(RelationshipSatisfaction) AS Avg_RelationshipSatisfaction,
       CONCAT(Round((SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / SUM(COUNT(Attrition)) OVER (PARTITION BY JobRole)) * 100, 2), '%')  AS Attrition_Ratio
FROM HR_basic
GROUP BY JobRole
ORDER BY JobRole;