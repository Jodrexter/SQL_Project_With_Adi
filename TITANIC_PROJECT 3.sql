   -- $$$$$$$$$$$$$$$$   MOVIES_PROJECT    $$$$$$$$$$$$$$$$ --      
   -- SELECT DATABASE --
   USE TITANIC_PROJECT;
   
   -- SHOW RECORDS IN THE TABLE --
   SELECT * FROM TITANIC;
   
/*
1. Select all columns for all passengers in the Titanic dataset. 
2. Display the number of passengers in each class (1st, 2nd, 3rd).
3. Find the number of male and female passengers. 
4. Display the names of passengers who survived.
5. Find the average age of passengers. 
6. List the names and ages of passengers who were younger than 18. 
7. Display the number of passengers in each embarkation port (C, Q, S). 
8. Find the highest fare paid by any passenger. 
9. List the average age of passengers for each class. 
10. Display the passenger names and ages for those who survived and were in 1st class. 
11. Find the number of passengers who paid more than 50 for their ticket.
12. List the names of passengers who did not survive and were in 3rd class. 
13. Find the number of passengers with missing values in the "Age" column. 
14. Display the passenger names and ages for those who embarked at port 'S' and survived. 
15. Calculate the total number of passengers on board. 
16. List the average fare for each class. 
17. Display the passenger names and ages for those with a known age and a fare greater than 100. 
18. Find the percentage of passengers who survived. 
19. List the names of passengers who were in 2nd class and had a fare less than 20. 
20. Display the passenger names and ages for those who did not survive and were in 1st class. 
21. Find the number of passengers for each combination of class and gender. 
22. List the names of passengers who survived  and were in 3rd class with an age less than 20. 
23. Display the passenger names for those with the name starting with 'Mr.' 
24. Find the average age of male and female passengers. 
25. List the names of passengers who paid the highest fare. 
26. Find the number of passengers for each embarkation port and class. 
27. Display the passenger names and ages for those who survived and paid more than 200 for their ticket.
28. Find the average age of passengers who survived and those who did not. 
29. List the names of passengers who were in 1st class and had an age greater than 50. 
30. Display the passenger names for those with the name ending with 'sson' */ 


 -- SOLUTIONS --
	-- 1. Select all columns for all passengers in the Titanic dataset --
    SELECT * FROM TITANIC;
    
    -- 2. Display the number of passengers in each class (1st, 2nd, 3rd).--
    SELECT PCLASS,COUNT(*) AS NUMBER_OF_PASSANGERS FROM TITANIC GROUP BY PCLASS ORDER BY PCLASS ASC;
    -- OR --
    SELECT PCLASS, COUNT(*) AS NUMBER_OF_PASSANGERS
	FROM TITANIC
	GROUP BY PCLASS;

	-- 3. Find the number of male and female passengers.  --
    SELECT SEX,COUNT(SEX) FROM TITANIC GROUP BY SEX;
    
	-- 4. Display the names of passengers who survived. --
	SELECT NAME FROM TITANIC WHERE SURVIVED = 'SURVIVED';
    
	-- 5. Find the average age of passengers.  --
    SELECT AVG(AGE)  AS AVERAGE_AGE_OF_PASSENGER FROM TITANIC;
    
	-- 6. List the names and ages of passengers who were younger than 18.  --
    SELECT NAME,AGE FROM TITANIC WHERE AGE < 18;
    
	-- 7. Display the number of passengers in each embarkation port (C, Q, S). -- 
    SELECT EMBARKED,COUNT(EMBARKED) AS NUMBER_OF_PASSENGER_IN_PORT FROM TITANIC WHERE EMBARKED IN ('C','Q','S') GROUP BY EMBARKED;
    -- OR --
     SELECT EMBARKED,COUNT(*) AS NUMBER_OF_PASSENGER_IN_PORT FROM TITANIC GROUP BY EMBARKED;
	-- 8. Find the highest fare paid by any passenger.  -
    SELECT MAX(FARE) FROM TITANIC;
    -- OR --
    SELECT NAME,FARE
	FROM TITANIC
	WHERE FARE = (SELECT MAX(FARE) FROM TITANIC);

	-- 9. List the average age of passengers for each class. -- 
    SELECT AVG(AGE),EMBARKED FROM TITANIC GROUP BY EMBARKED ORDER BY AVG(AGE);
    
	-- 10. Display the passenger names and ages for those who survived and were in 1st class. -- 
    SELECT NAME,AGE,PCLASS,SURVIVED FROM TITANIC WHERE SURVIVED = 'SURVIVED' AND PCLASS = 1;
    
	-- 11. Find the number of passengers who paid more than 50 for their ticket. --
	SELECT * FROM TITANIC;
	SELECT COUNT(TICKET) AS PASSENGERS_WHO_PAID_MORE_THAN_50 FROM TITANIC WHERE TICKET > 50;
    
	-- 12. List the names of passengers who did not survive and were in 3rd class.  --
	SELECT NAME,PCLASS,SURVIVED AS NOT_SURVIVE FROM TITANIC WHERE SURVIVED = 'DIED' AND PCLASS = 3;
    
	-- 13. Find the number of passengers with missing values in the "Age" column.  --
    SELECT COUNT(*) AS NUMBER_OF_PASSENGERS_WITH_MISSING_AGE FROM TITANIC WHERE AGE IS NULL;
    -- OR --
    SELECT COUNT(*) AS NUMBER_OF_PASSENGERS_WITH_MISSING_AGE FROM TITANIC WHERE AGE = NULL;

	-- 14. Display the passenger names and ages for those who embarked at port 'S' and survived. -- 
    SELECT NAME,AGE,EMBARKED,SURVIVED FROM TITANIC WHERE SURVIVED = 'SURVIVED' AND EMBARKED = 'S';
    
	-- 15. Calculate the total number of passengers on board.  --
    SELECT COUNT(*) AS NUMBER_OF_PASSENGER_ON_BOARD FROM TITANIC;
    
	-- 16. List the average fare for each class.  --
    SELECT * FROM TITANIC;
    SELECT PCLASS,AVG(FARE) FROM TITANIC GROUP BY PCLASS ORDER BY PCLASS ASC;
    
	-- 17. Display the passenger names and ages for those with a known age and a fare greater than 100. -- 
    SELECT NAME,AGE FROM TITANIC WHERE AGE IS NOT NULL AND FARE > 100;

	-- 18. Find the percentage of passengers who survived.  --
    SELECT (SUM(CASE WHEN SURVIVED ='SURVIVED' THEN 1 ELSE 0 END)* 100 / COUNT(*)) AS PASSENGER_WHO_SURVIVED FROM TITANIC;
    -- OR --
    
    -- ADDING COLUMN PERCENTAGE --
    ALTER TABLE TITANIC ADD COLUMN PERCENTAGE INT;
    
    -- USING CASE FOR FINDING PERCENTAGE --
    UPDATE TITANIC SET PERCENTAGE = CASE
    WHEN SURVIVED ='SURVIVED' THEN 1
    ELSE 0
    END;
    
    -- RESULT --
    SELECT SUM(PERCENTAGE)*100/COUNT(*) AS PASSENGER_WHO_SURVIVED FROM TITANIC;
    
	-- 19. List the names of passengers who were in 2nd class and had a fare less than 20.  --
    SELECT NAME,PCLASS,FARE FROM TITANIC WHERE PCLASS = 2 AND FARE < 20;
    
	-- 20. Display the passenger names and ages for those who did not survive and were in 1st class.  --
    SELECT NAME,AGE,SURVIVED AS NOT_SURVIVE,PCLASS FROM TITANIC WHERE SURVIVED = 'DIED' AND PCLASS = 1;
    
	-- 21. Find the number of passengers for each combination of class and gender.  --
    SELECT PCLASS,COUNT(PCLASS),SEX FROM TITANIC GROUP BY PCLASS,SEX ORDER BY PCLASS ASC;
    
	-- 22. List the names of passengers who survived  and were in 3rd class with an age less than 20.  --
    SELECT NAME,SURVIVED,PCLASS,AGE FROM TITANIC WHERE SURVIVED = 'SURVIVED' AND PCLASS = 3 AND AGE < 20;
    
	-- 23. Display the passenger names for those with the name starting with 'Mr.'  --
    SELECT NAME FROM TITANIC WHERE NAME LIKE 'Mr%';
    
	-- 24. Find the average age of male and female passengers.  --
    SELECT SEX,AVG(AGE) FROM TITANIC GROUP BY SEX;

	-- 25. List the names of passengers who paid the highest fare. -- 
    SELECT NAME,MAX(FARE) AS HIGHEST_FARE FROM TITANIC GROUP BY NAME ORDER BY MAX(FARE) DESC LIMIT 1;
    SELECT NAME,MAX(FARE) AS HIGHEST_FARE  FROM TITANIC GROUP BY NAME ORDER BY MAX(FARE) DESC LIMIT 3;
    
	-- 26. Find the number of passengers for each embarkation port and class. -- 
    SELECT EMBARKED,PCLASS,COUNT(*) FROM TITANIC GROUP BY EMBARKED,PCLASS ORDER BY EMBARKED,PCLASS ASC;

	-- 27. Display the passenger names and ages for those who survived and paid more than 200 for their ticket. --
    SELECT NAME,AGE,SURVIVED,TICKET FROM TITANIC WHERE SURVIVED = 'SURVIVED' AND TICKET > 200;
    
	-- 28. Find the average age of passengers who survived and those who did not.  --
    SELECT SURVIVED,AVG(AGE) FROM TITANIC GROUP BY SURVIVED;
    
	-- 29. List the names of passengers who were in 1st class and had an age greater than 50. -- 
    SELECT NAME,PCLASS,AGE FROM TITANIC WHERE PCLASS = 1 AND AGE > 50;
    
	-- 30. Display the passenger names for those with the name ending with 'sson' --
    SELECT NAME FROM TITANIC WHERE NAME LIKE '%SSON';
    
    
   