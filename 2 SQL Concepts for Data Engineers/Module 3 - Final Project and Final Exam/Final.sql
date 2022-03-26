-- Exercise 1: Using Joins

-- Question 1
-- Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98
USE DataEngineering;

SELECT CS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, CS.AVERAGE_STUDENT_ATTENDANCE, HARDSHIP_INDEX
FROM 
	CENSUS_DATA AS CD
	LEFT JOIN CHICAGO_PUBLIC_SCHOOLS AS CS ON CD.COMMUNITY_AREA_NUMBER = CS.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX = 98;


