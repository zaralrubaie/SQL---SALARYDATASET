select * from PROC1
-- 1. Encode Gender column: Male = 0, Female = 1

UPDATE PROC1
SET Gender = CASE
    WHEN Gender = 'Male' THEN '0'
    WHEN Gender = 'Female' THEN '1'
    ELSE Gender
END;
-- 2. Drop unnecessary columns

ALTER TABLE PROC1
DROP COLUMN Start_Date;

---- 3. Calculate total compensation and salary rank
ALTER TABLE PROC1
ADD Total_Compensation FLOAT,        
    Salary_Rank INT;                 

UPDATE PROC1
SET Total_Compensation = Salary + Bonus + Senior_Management;

ALTER TABLE PROC1
ADD Salary_Rank INT;

WITH RankedSalaries AS (
    SELECT *,
           RANK() OVER (PARTITION BY Team ORDER BY Salary DESC) AS RankInTeam
    FROM PROC1
)
UPDATE RankedSalaries
SET Salary_Rank = RankInTeam;
-- 4. Calculate bouns_category

UPDATE PROC1
SET Bonus_Category = CASE
                        WHEN Bonus >= 10000 THEN 'High'
                        WHEN Bonus >= 5000 THEN 'Medium'
                        ELSE 'Low'
                     END;

-- 5.calculates the average Total_Compensation for each team
WITH TeamAvg AS (
    SELECT Team, AVG(Total_Compensation) AS Avg_Comp
    FROM PROC1
    GROUP BY Team
)
UPDATE P
SET Team_Avg_Comp = T.Avg_Comp
FROM PROC1 P
JOIN TeamAvg T ON P.Team = T.Team;
-- 6. Add string function columns for First_Name
ALTER TABLE proc1
ADD FirstName_Length INT,
    FirstName_Upper VARCHAR(50),
    FirstName_Lower VARCHAR(50),
    FirstName_Initial CHAR(1);

UPDATE proc1
SET FirstName_Length = LEN(First_Name),
    FirstName_Upper = UPPER(First_Name),
    FirstName_Lower = LOWER(First_Name),
    FirstName_Initial = LEFT(First_Name, 1);




