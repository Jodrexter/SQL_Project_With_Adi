   -- $$$$$$$$$$$$$$$$   MOVIES_PROJECT    $$$$$$$$$$$$$$$$ --      
   -- SELECT DATABASE --
   USE MOVIES_PROJECT;
   
   -- SHOW RECORDS IN THE TABLE --
   SELECT * FROM MOVIES;
   
/*1.Retrieve the names of all the Bollywood movies which are of drama genre in the dataset.
2.Retrieve the names of all the Bollywood movies of Amir Khan in the dataset.
3.Retrieve the names of all the Bollywood movies which are directed by RamGopal Verma in the dataset.
4.Retrieve the names of all the Bollywood movies which have been released over more than 1000 number of screens in the dataset.
5.Retrieve the names of all the Bollywood movies which have generated Revenue(INR)more than 700000000 in the dataset.
6.Retrieve the names of all the Bollywood movies which have budget less than 1cr in the dataset.
7.Retrieve the names of all the Bollywood movies which are flop in the dataset.(flop=revenue – budget)
8.Retrieve the names and profit of all the Bollywood movies in the dataset.(profit=revenue – budget)
9.Retrieve the names and loss of all the Bollywood movies in the dataset.(loss=revenue – budget)
10. Retrieve the names of all the Bollywood movies which have been released on holidays in the dataset.
11. Retrieve the names of all the Bollywood movies which have lead star as Akshay Kumar and directed by Priyadarshan in the dataset.
12. Retrieve the names of all the Bollywood movies starting with ‘a’ in the dataset.
13. Retrieve the names of all the Bollywood movies ending with ‘a’ in the dataset.
14. Retrieve the names of all the Bollywood movies having ‘a’ at second place of the name in the dataset.
15. Retrieve the names of all the Bollywood movies having music of amit trivedi the dataset.
16. Retrieve the names of all the comedy movies of Akshay Kumar in the dataset.
17. Retrieve the names of movies and star name starring khan in the dataset.
18. Retrieve all the information of movies race and race2 in the dataset.
19. Retrieve the names of all the thriller Bollywood movies in the dataset.
20. Retrieve the names and budget of all the Bollywood movies according to the highest budget to lowest budget in the dataset.
21. Retrieve the names and budget of top 5 Bollywood movies with highest budget in the dataset.
22. Retrieve the names of top 10 Bollywood movies with highest revenue generation in the dataset.
23. Retrieve the names of top 5 movies of salman khan in the dataset.
24. Retrieve the names of top 5 floped movies in the dataset.
25. Retrieve the names of top 5 hit movies in the dataset.
26. Which is the second movie released on maximum screens.
27. Which is the 10th movies with highest budget.
28. Which is the 2nd movie of Amitabh Bachchan with highest budget.
29. Which are the flopped movies of AkshayKumar.
30. With which director Sharukh Khan have given the biggest hit movie */ 

   -- SOLUTIONS --
	-- 1.Retrieve the names of all the Bollywood movies which are of drama genre in the dataset.--
    SELECT MOVIE_NAME,GENRE FROM MOVIES WHERE GENRE = 'DRAMA';
    
    -- 2.Retrieve the names of all the Bollywood movies of Amir Khan in the dataset. --
    SELECT MOVIE_NAME,LEAD_STAR FROM MOVIES WHERE LEAD_STAR = 'AAMIR KHAN';
    
    -- 3.Retrieve the names of all the Bollywood movies which are directed by RamGopal Verma in the dataset. --
    SELECT MOVIE_NAME,DIRECTOR FROM MOVIES WHERE DIRECTOR = 'RAM GOPAL VERMA';
    
    -- 4.Retrieve the names of all the Bollywood movies which have been released over more than 1000 number of screens in the dataset. --
    SELECT MOVIE_NAME,NUMBER_OF_SCREENS FROM MOVIES WHERE NUMBER_OF_SCREENS > 1000;
    
    -- 5.Retrieve the names of all the Bollywood movies which have generated Revenue(INR)more than 700000000 in the dataset. --
    SELECT MOVIE_NAME,REVENUE FROM MOVIES WHERE REVENUE > 700000000;
        
    -- 6.Retrieve the names of all the Bollywood movies which have budget less than 1cr in the dataset. --
    SELECT MOVIE_NAME,BUDGET FROM MOVIES WHERE BUDGET < 10000000;
    
    -- 7.Retrieve the names of all the Bollywood movies which are flop in the dataset.(flop=revenue – budget) --
    SELECT COUNT(*) FROM MOVIES WHERE BUDGET > REVENUE;
    -- OR --
	SELECT 
    COUNT(*) #(REVENUE - BUDGET) AS FLOP
	FROM 
    MOVIES;
	WHERE 
    (REVENUE - BUDGET)  < 0;

    -- 8.Retrieve the names and profit of all the Bollywood movies in the dataset.(profit=revenue – budget)    -- 
    SELECT MOVIE_NAME,(REVENUE - BUDGET) AS PROFIT  FROM MOVIES WHERE (REVENUE - BUDGET) > 0 ;
    
    -- 9.Retrieve the names and loss of all the Bollywood movies in the dataset.(loss=revenue – budget)    -- 
    SELECT MOVIE_NAME,(REVENUE - BUDGET) AS FLOP FROM MOVIES WHERE (REVENUE - BUDGET) < 0;
    
    -- 10. Retrieve the names of all the Bollywood movies which have been released on holidays in the dataset.    -- 
    SELECT MOVIE_NAME,RELEASE_PERIOD FROM MOVIES WHERE RELEASE_PERIOD = 'HOLIDAY';
    
    -- 11. Retrieve the names of all the Bollywood movies which have lead star as Akshay Kumar and directed by Priyadarshan in the dataset.    -- 
    SELECT MOVIE_NAME,LEAD_STAR,DIRECTOR FROM MOVIES WHERE LEAD_STAR = 'AKSHAY KUMAR' AND DIRECTOR = 'PRIYADARSHAN';
    
    -- 12. Retrieve the names of all the Bollywood movies starting with ‘a’ in the dataset.    -- 
    SELECT MOVIE_NAME FROM MOVIES WHERE MOVIE_NAME LIKE 'A%';
    
    -- 13. Retrieve the names of all the Bollywood movies ending with ‘a’ in the dataset.    -- 
    SELECT MOVIE_NAME FROM MOVIES WHERE MOVIE_NAME LIKE '%A';
    
    -- 14. Retrieve the names of all the Bollywood movies having ‘a’ at second place of the name in the dataset.    -- 
    SELECT MOVIE_NAME FROM MOVIES WHERE MOVIE_NAME LIKE '_A%';
    
    -- 15. Retrieve the names of all the Bollywood movies having music of amit trivedi the dataset.    -- 
    SELECT MOVIE_NAME,MUSIC_DIRECTOR FROM MOVIES WHERE MUSIC_DIRECTOR = 'AMIT TRIVEDI';
    
    -- 16. Retrieve the names of all the comedy movies of Akshay Kumar in the dataset.    -- 
    SELECT MOVIE_NAME,GENRE,LEAD_STAR FROM MOVIES WHERE LEAD_STAR = 'AKSHAY KUMAR' AND GENRE = 'COMEDY';

    -- 17. Retrieve the names of movies and star name starring khan in the dataset.    -- 
    SELECT MOVIE_NAME,LEAD_STAR FROM MOVIES WHERE LEAD_STAR LIKE '%KHAN%';

    -- 18. Retrieve all the information of movies race and race2 in the dataset.    -- 
    SELECT * FROM MOVIES WHERE MOVIE_NAME IN ('RACE','RACE2');
    
    -- 19. Retrieve the names of all the thriller Bollywood movies in the dataset.    -- 
    SELECT MOVIE_NAME,GENRE FROM MOVIES WHERE GENRE = 'THRILLER';
    
    -- 20. Retrieve the names and budget of all the Bollywood movies according to the highest budget to lowest budget in the dataset.    -- 
    SELECT MOVIE_NAME,BUDGET FROM MOVIES ORDER BY BUDGET DESC;
    
    -- 21. Retrieve the names and budget of top 5 Bollywood movies with highest budget in the dataset.    -- 
    SELECT MOVIE_NAME,BUDGET FROM MOVIES ORDER BY BUDGET DESC LIMIT 5;
    
    -- 22. Retrieve the names of top 10 Bollywood movies with highest revenue generation in the dataset.    --
    SELECT MOVIE_NAME,REVENUE FROM MOVIES ORDER BY REVENUE DESC LIMIT 10;

    -- 23. Retrieve the names of top 5 movies of salman khan in the dataset.  -- 
    SELECT MOVIE_NAME,LEAD_STAR,REVENUE FROM MOVIES WHERE LEAD_STAR = 'SALMAN KHAN' ORDER BY REVENUE DESC LIMIT 5;
    
    -- 24. Retrieve the names of top 5 floped movies in the dataset.--
    SELECT MOVIE_NAME,REVENUE AS FLOPED_MOVIE FROM MOVIES ORDER BY FLOPED_MOVIE ASC LIMIT 5;
    --  OR --
    SELECT MOVIE_NAME,(REVENUE - BUDGET) AS FLOPED_MOVIE FROM MOVIES WHERE (REVENUE - BUDGET) < 0 ORDER BY FLOPED_MOVIE ASC LIMIT 5;
    
    -- 25. Retrieve the names of top 5 hit movies in the dataset.    -- 
    SELECT MOVIE_NAME,REVENUE AS HIT_MOVIE FROM MOVIES ORDER BY HIT_MOVIE DESC LIMIT 5;
    -- OR --
    SELECT MOVIE_NAME,(REVENUE - BUDGET) AS HIT_MOVIE FROM MOVIES WHERE (REVENUE - BUDGET) > 0 ORDER BY HIT_MOVIE DESC LIMIT 5;
    -- OR --
    SELECT MOVIE_NAME FROM MOVIES ORDER BY (REVENUE - BUDGET) DESC LIMIT 5;
    
    -- 26. Which is the second movie released on maximum screens.    -- 
    SELECT * FROM MOVIES;
    SELECT MOVIE_NAME,NUMBER_OF_SCREENS FROM MOVIES ORDER BY NUMBER_OF_SCREENS DESC LIMIT 1,1;
    -- 27. Which is the 10th movies with highest budget.    -- 
    SELECT MOVIE_NAME,BUDGET FROM MOVIES ORDER BY BUDGET DESC LIMIT 9,1;
    
    -- 28. Which is the 2nd movie of Amitabh Bachchan with highest budget.    -- 
    SELECT MOVIE_NAME,BUDGET,LEAD_STAR FROM MOVIES WHERE LEAD_STAR = 'AMITABH BACHCHAN' ORDER BY BUDGET DESC LIMIT 1,1;
    
    -- 29. Which are the flopped movies of AkshayKumar.    -- 
        SELECT MOVIE_NAME,LEAD_STAR,(REVENUE - BUDGET) AS FLOPED_MOVIE FROM MOVIES WHERE (REVENUE -BUDGET) < 0 AND LEAD_STAR ='AKSHAY KUMAR' ORDER BY FLOPED_MOVIE;
        -- OR --
        SELECT MOVIE_NAME,REVENUE AS FLOPED_MOVIE FROM MOVIES WHERE LEAD_STAR ='AKSHAY KUMAR' ORDER BY FLOPED_MOVIE;
        
    -- 30. With which director Sharukh Khan have given the biggest hit movie --
    -- NOTE --
    # NO RECORD OF Sharukh Khan FOUND IN THE TABLE;
    SELECT MOVIE_NAME,LEAD_STAR,DIRECTOR FROM MOVIES WHERE LEAD_STAR = 'SHARUKH KHAN' ORDER BY REVENUE DESC LIMIT 1;
    SELECT * FROM MOVIES WHERE LEAD_STAR = 'Sharukh Khan';
    
    


