SHOW databases;

USE bytedegree;

RENAME TABLE 데이터분석_Expert TO HR_basic hb;

COMMIT;

SELECT DISTINCT PerformanceRating FROM HR_basic hb;

SELECT PerformanceRating, COUNT(*) AS RatingCount, 
       (COUNT(*) / (SELECT COUNT(*) FROM HR_basic)) AS Ratio
FROM HR_basic
GROUP BY PerformanceRating;


# 어차피 EmployeeCount는 1이므로 삭제
SELECT DISTINCT EmployeeCount FROM HR_basic hb ;

ALTER TABLE HR_basic DROP COLUMN EmployeeCount;

# Over18도 전부 Y이므로 삭제
SELECT DISTINCT Over18 FROM HR_basic hb;

ALTER TABLE HR_basic DROP COLUMN Over18;

# StandardHours도 전부 80이므로 삭제 
SELECT DISTINCT StandardHours FROM HR_basic hb;

ALTER TABLE HR_basic DROP COLUMN StandardHours;

# Select unique PerformanceRating values from the HR_basic table.
SELECT DISTINCT PerformanceRating FROM HR_basic;

# 뭔가 평가 인심이 후한 회사같다. 그나마 가장 낮은 평가점수인 3에 해당하는 사람들을 성과가 낮은 사람이라고 정의.
# 과제 1-1-1:
SELECT EmployeeNumber, TotalWorkingYears 
FROM HR_basic hb
WHERE PerformanceRating = 3;

SELECT PerformanceRating, 
			AVG(TotalWorkingYears) AS avg, 
			Max(TotalWorkingYears) AS Max, 
			Min(TotalWorkingYears) AS Min, 
			STDDEV(TotalWorkingYears) AS STDDEV
FROM HR_basic hb
GROUP BY PerformanceRating;

# 과제 1-1-2 :
SELECT WorkLifeBalance, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(PerformanceRating) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY WorkLifeBalance)) * 100, 2), '%') AS WLB_PR_Ratio,
			 CONCAT(ROUND((COUNT(WorkLifeBalance) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS PR_WLB_Ratio
FROM HR_basic
GROUP BY WorkLifeBalance, PerformanceRating
ORDER BY WorkLifeBalance, PerformanceRating;

# 과제 1-1-3 :
SELECT PerformanceRating, 
			 AVG(YearsSinceLastPromotion) AS AVG,
			 Max(YearsSinceLastPromotion) AS MAX,
			 Min(YearsSinceLastPromotion) AS MIN,
			 STDDEV(YearsSinceLastPromotion) AS STDDEV
FROM HR_basic hb
GROUP BY PerformanceRating;

# 과제 1-1-4의 경우 Yes, No 단 2개로 Count만 살펴봄:
SELECT PerformanceRating,
    SUM(CASE WHEN Overtime = 'Yes' THEN 1 ELSE 0 END) AS Overtime_Yes,
    SUM(CASE WHEN Overtime = 'No' THEN 1 ELSE 0 END) AS Overtime_No,
    ROUND((SUM(CASE WHEN Overtime = 'Yes' THEN 1 ELSE 0 END) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY PerformanceRating)) * 100, 2) AS Ratio_Yes,
    ROUND((SUM(CASE WHEN Overtime = 'No' THEN 1 ELSE 0 END) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY PerformanceRating)) * 100, 2) AS Ratio_No
FROM HR_basic
GROUP BY PerformanceRating;
   
# 과제 1-1-5:
SELECT StockOptionLevel, 
			PerformanceRating, 
			COUNT(*) AS Count,
						 CONCAT(ROUND((COUNT(PerformanceRating) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY  StockOptionLevel)) * 100, 2), '%') AS SOL_PR_Ratio,
			 CONCAT(ROUND((COUNT(StockOptionLevel) / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS PR_SOL_Ratio
FROM HR_basic
GROUP BY StockOptionLevel, PerformanceRating 
ORDER BY StockOptionLevel, PerformanceRating;


# 과제 1-2
SELECT 
	   Attrition,
	   PerformanceRating,
       COUNT(*) AS Count,
       CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Attrition)) * 100, 2), '%') AS Ratio_ATT_by_PR,
       CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_ATT
FROM HR_basic
GROUP BY Attrition, PerformanceRating
ORDER BY Attrition, PerformanceRating;

SELECT BusinessTravel, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY BusinessTravel)) * 100, 2), '%') AS Ratio_BT_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_BT
FROM HR_basic
GROUP BY BusinessTravel, PerformanceRating
Order BY BusinessTravel, PerformanceRating;

SELECT PerformanceRating, AVG(DailyRate), Max(DailyRate), Min(DailyRate)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT Department, 
		     PerformanceRating, 
		     Count(*) AS Count,
		     CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Department)) * 100, 2), '%') AS Ratio_Department_by_PR,
		     CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_Department
FROM HR_basic
GROUP BY Department, PerformanceRating
ORDER BY Department, PerformanceRating;

SELECT PerformanceRating, AVG(DistanceFromHome), MAX(DistanceFromHome), MIN(DistanceFromHome), STDDEV(DistanceFromHome)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT Education, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Education)) * 100, 2), '%') AS Ratio_Edu_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_Edu
FROM HR_basic
GROUP BY Education, PerformanceRating
ORDER BY Education, PerformanceRating;

SELECT EducationField, 
			PerformanceRating,
			Count(*) AS Count,
			CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY EducationField)) * 100, 2), '%') AS Ratio_EduField_by_PR,
			CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_EduField
FROM HR_basic
GROUP BY EducationField, PerformanceRating
ORDER BY EducationField, PerformanceRating;

SELECT EnvironmentSatisfaction, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY EnvironmentSatisfaction)) * 100, 2), '%') AS Ratio_ES_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_ES
FROM HR_basic
GROUP BY EnvironmentSatisfaction, PerformanceRating
ORDER BY EnvironmentSatisfaction, PerformanceRating;

SELECT JobLevel, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY JobLevel)) * 100, 2), '%') AS Ratio_JL_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_JL
FROM HR_basic
GROUP BY JobLevel, PerformanceRating
ORDER BY JobLevel, PerformanceRating;

SELECT JobRole, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY JobRole)) * 100, 2), '%') AS Ratio_JR_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_JR
FROM HR_basic
GROUP BY JobRole, PerformanceRating
ORDER BY JobRole, PerformanceRating;

# 이것도 조금 의미있는 듯
SELECT JobSatisfaction, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY JobSatisfaction)) * 100, 2), '%') AS Ratio_JS_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_JS
FROM HR_basic
GROUP BY JobSatisfaction, PerformanceRating
ORDER BY JobSatisfaction, PerformanceRating;

SELECT MaritalStatus, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY MaritalStatus)) * 100, 2), '%') AS Ratio_JS_by_PR
FROM HR_basic
GROUP BY MaritalStatus, PerformanceRating
ORDER BY MaritalStatus DESC, PerformanceRating;

SELECT PerformanceRating, AVG(MonthlyIncome), MAX(MonthlyIncome), MIN(MonthlyIncome), STDDEV(MonthlyIncome)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT PerformanceRating, AVG(MonthlyRate), MAX(MonthlyRate), MIN(MonthlyRate), STDDEV(MonthlyRate)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT PerformanceRating, AVG(NumCompaniesWorked), MAX(NumCompaniesWorked), MIN(NumCompaniesWorked), STDDEV(NumCompaniesWorked)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT NumCompaniesWorked, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY NumCompaniesWorked)) * 100, 2), '%') AS Ratio_NumCom_by_PR
FROM HR_basic
GROUP BY NumCompaniesWorked, PerformanceRating
ORDER BY NumCompaniesWorked, PerformanceRating;

# 이건 좀 의미가 있는 듯
SELECT PerformanceRating, 
			AVG(PercentSalaryHike) AVG, 
			MAX(PercentSalaryHike) MAX, 
			MIN(PercentSalaryHike) MIN, 
			STDDEV(PercentSalaryHike) STDDEV
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT RelationshipSatisfaction, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY RelationshipSatisfaction)) * 100, 2), '%') AS Ratio_RS_by_PR,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PerformanceRating)) * 100, 2), '%') AS Ratio_PR_by_RS
FROM HR_basic
GROUP BY RelationshipSatisfaction, PerformanceRating
ORDER BY RelationshipSatisfaction, PerformanceRating;

SELECT PerformanceRating, AVG(TotalWorkingYears), MAX(TotalWorkingYears), MIN(TotalWorkingYears), STDDEV(TotalWorkingYears)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT TrainingTimesLastYear, 
			 PerformanceRating, 
			 Count(*) AS count,
			 CONCAT(ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY TrainingTimesLastYear)) * 100, 2), '%') AS Ratio_TTLY_by_PR
FROM HR_basic
GROUP BY TrainingTimesLastYear, PerformanceRating
ORDER BY TrainingTimesLastYear, PerformanceRating;

SELECT PerformanceRating, AVG(YearsAtCompany), MAX(YearsAtCompany), MIN(YearsAtCompany), STDDEV(YearsAtCompany)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT PerformanceRating, AVG(YearsInCurrentRole), MAX(YearsInCurrentRole), MIN(YearsInCurrentRole), STDDEV(YearsInCurrentRole)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT PerformanceRating, AVG(YearsSinceLastPromotion), MAX(YearsSinceLastPromotion), MIN(YearsSinceLastPromotion), STDDEV(YearsSinceLastPromotion)
FROM HR_basic hb
GROUP BY PerformanceRating;

SELECT PerformanceRating, AVG(YearsWithCurrManager), MAX(YearsWithCurrManager), MIN(YearsWithCurrManager), STDDEV(YearsWithCurrManager)
FROM HR_basic hb
GROUP BY PerformanceRating;

