USE `Team54`;
--
-- Dumping routines for database 'Team54'
--
/*!50003 DROP PROCEDURE IF EXISTS `admin_approve_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
	IF (i_username IN (SELECT user_name FROM user))
	THEN 
	UPDATE user
	SET user_status = "Approved"
    	WHERE user_name = i_username;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration INT,
IN i_movReleaseDate DATE)
BEGIN  
    	INSERT INTO movie (movie_name, movie_release_date, movie_duration)
VALUES (i_movName, i_movReleaseDate, i_movDuration);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_theater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2), IN i_thZipcode CHAR(5), IN i_capacity INT, IN i_managerUsername VARCHAR(50))
BEGIN
    	INSERT INTO theater(theater_name, theater_owned_by, theater_street, theater_city,
theater_state, theater_zipcode, theater_capacity, theater_managed_by  )
VALUES (i_thName, i_comName, i_thStreet, i_thCity, i_thState, i_thZipCode, i_capacity,
i_managerUsername);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_decline_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
	IF (i_username IN (SELECT user_name FROM user))
	THEN 
	UPDATE user	
	SET user_status = "Declined"
WHERE user_name = i_username and user_status <> "Approved";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT,
IN i_maxCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy ENUM("comName", "numCityCover", "numTheater", "numEmployee",""), IN i_sortDirection ENUM("ASC", "DESC",""))
BEGIN
    	DROP TABLE IF EXISTS AdFilterCom;
    	CREATE TABLE AdFilterCom
			SELECT companyName as comName, numCityCovered as numCityCover, numTheaters as numTheater, numEmployees as numEmployee FROM
				(SELECT *,
				(SELECT count(DISTINCT theater_city, theater_state) FROM theater WHERE theater_owned_by = companyName) as numCityCovered,
				(SELECT count(theater_name) FROM theater WHERE theater_owned_by = companyName) as numTheaters,
				(SELECT count(manager_name) FROM manager WHERE manager_works_in = companyName) as numEmployees
				FROM company) as uf
				WHERE 
                ((uf.numCityCovered BETWEEN i_minCity AND i_maxCity) or (i_minCity is null or i_minCity='' or i_maxCity is null or i_maxCity='' )) 
                AND ((uf.numTheaters BETWEEN i_minTheater AND i_maxTheater) or (i_minTheater is null or i_minTheater='' or i_maxTheater is null or i_maxTheater='' ) ) 
                AND ((uf.numEmployees BETWEEN i_minEmployee AND i_maxEmployee ) or ((i_minEmployee is null or i_minEmployee='' ) and  i_maxEmployee>=numEmployees ) or ((i_maxEmployee is null or i_maxEmployee='' ) and  i_minEmployee<=numEmployees )   or ((i_maxEmployee is null or i_maxEmployee='' ) and (i_minEmployee is null or i_minEmployee='' ) ))   
                and (i_comName = companyName or i_comName is null or  i_comName='' or i_comName= 'ALL')
        
         ORDER BY
        CASE
    	WHEN i_sortBy  IS NULL AND i_sortDirection = "ASC"
    	THEN comName END ASC,
    	CASE
        WHEN i_sortBy IS NULL AND i_sortDirection = "DESC"
    	THEN comName END DESC,
    	CASE
    	WHEN i_sortBy = "comName" AND i_sortDirection = "ASC"
    	THEN comName END ASC,
     	CASE
    	WHEN i_sortBy = "comName" AND i_sortDirection = "DESC"
    	THEN comName END DESC,
      	CASE
     	WHEN i_sortBy = "comName" AND i_sortDirection IS NULL
    	THEN comName END DESC,
     	CASE
      	WHEN i_sortBy = "numCityCover" AND i_sortDirection = "ASC"
    	THEN numCityCover END ASC,
    	CASE
     	WHEN i_sortBy = "numCityCover" AND i_sortDirection = "DESC"
    	THEN numCityCover END DESC,
     	CASE
      	WHEN i_sortBy = "numCityCover" AND i_sortDirection IS NULL
    	THEN numCityCover END DESC,
      	CASE
      	WHEN i_sortBy = "numTheater" AND i_sortDirection = "ASC"
    	THEN numTheater END ASC,
     	CASE
     	WHEN i_sortBy = "numTheater" AND i_sortDirection = "DESC"
    	THEN numTheater END DESC,
     	CASE
     	WHEN i_sortBy = "numTheater" AND i_sortDirection=''
    	THEN numTheater END ASC,
     	CASE
     	WHEN i_sortBy = "numEmployee" AND i_sortDirection = "ASC"
    	THEN numEmployee END ASC,
     	CASE
     	WHEN i_sortBy = "numEmployee" AND i_sortDirection = "DESC"
    	THEN numEmployee END DESC,
     	CASE
     	WHEN i_sortBy = "numEmployee" AND i_sortDirection IS NULL
    	THEN numEmployee END DESC,
     	CASE
    	WHEN i_sortBy IS NULL AND i_sortDirection IS NULL
    	THEN comName END DESC;
	
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status
VARCHAR(50), IN i_sortBy ENUM("username", "creditCardCount", "userType", "status", ""), IN i_sortDirection ENUM("DESC", "ASC",""))
BEGIN
DROP TABLE IF EXISTS AdFilterUser;
CREATE TABLE AdFilterUser
SELECT user_name as username, (SELECT count(creditcard_num) FROM creditcard WHERE creditcard_owner=user_name) as creditCardCount, user_status as status
FROM user
where (user_name=i_username or i_username= 'ALL' or i_username='') and (user_status = i_status or i_status= 'ALL' or i_status='');

ALTER TABLE AdFilterUser
ADD userType ENUM('User','Customer', 'Admin', 'Manager', 'CustomerManager',
'CustomerAdmin') NOT NULL DEFAULT 'User';

SET SQL_SAFE_UPDATES = 0;
UPDATE AdFilterUser
SET userType = 
	CASE WHEN username in (SELECT admin_name FROM admin) AND username in (SELECT customer_name FROM customer) THEN 'CustomerAdmin' 
	WHEN username in (SELECT manager_name FROM manager) AND username in (SELECT customer_name FROM customer) THEN 'CustomerManager'
	WHEN username in (SELECT customer_name FROM customer) THEN 'Customer'
    WHEN username in (SELECT manager_name FROM manager) THEN 'Manager'
    WHEN username in (SELECT admin_name FROM admin) THEN 'Admin'
	ELSE 'User' 
END;


SELECT username, userType, status,creditCardCount
FROM AdFilterUser
WHERE (username = i_username)
AND (status = i_status)
ORDER BY
    	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection = "ASC"
    	THEN username END ASC,
    	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection = "DESC"
    	THEN username END DESC,
     	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection IS NULL
    	THEN username END DESC,
    	CASE
    	WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "ASC"
THEN creditCardCount END ASC,
CASE
    	WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "DESC"
    	THEN creditCardCount END DESC,
CASE
     	WHEN i_sortBy = "creditCardCount" AND i_sortDirection IS NULL
    	THEN creditCardCount END DESC,
     	CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection = "ASC"
    	THEN userType END ASC,
CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection = "DESC"
THEN userType END DESC,
CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection IS NULL
     	THEN userType END DESC,
    	CASE
    	WHEN i_sortBy = "status" AND i_sortDirection = "ASC"
    	THEN status END ASC,
     	CASE
    	WHEN i_sortBy = "status" AND i_sortDirection = "DESC"
    	THEN status END DESC,
     	CASE
     	WHEN i_sortBy = "status" AND i_sortDirection IS NULL
    	THEN status END DESC,
     	CASE
     	WHEN i_sortBy IS NULL AND i_sortDirection IS NULL
    	THEN username END DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN

DROP TABLE IF EXISTS emp_first_last_name;
CREATE TABLE emp_first_last_name
SELECT manager_name, user_firstname, user_lastname, manager_works_in, user_name
FROM `user`
NATURAL JOIN manager 
WHERE user_name = manager_name;

DROP TABLE IF EXISTS AdComDetailEmp;
CREATE TABLE AdComDetailEmp
SELECT DISTINCT user_firstname as empFirstname,
user_lastname as empLastname
FROM emp_first_last_name 
NATURAL JOIN company
WHERE manager_works_in = companyName
AND manager_works_in = i_comName
AND companyName = i_comName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS theater_manager;
CREATE TABLE theater_manager
SELECT manager_name, manager_works_in, theater_name, theater_managed_by, theater_city, theater_state,theater_capacity
FROM theater
NATURAL JOIN manager 
WHERE manager_name = theater_managed_by;


DROP TABLE IF EXISTS AdComDetailTh;
CREATE TABLE AdComDetailTh
SELECT DISTINCT theater_name as thName, theater_managed_by as thManagerUsername, theater_city as thCity, theater_state as thState, theater_capacity as thCapacity
from theater_manager
where manager_works_in=i_comName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
if length(i_creditCardNum)=16 and 
(select nm from (select creditcard_owner,count(creditcard_num) as nm  from CreditCard group by creditcard_owner) as df where creditcard_owner=i_username)<5 
then 
BEGIN
    	INSERT INTO CreditCard(creditcard_owner, creditcard_num)
VALUES (i_username, i_creditCardNum);
END ;
end if;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_filter_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_filter_mov`
(IN i_movName VARCHAR(50),IN i_comName VARCHAR(50), 
IN i_city VARCHAR(50), IN i_state VARCHAR(50), 
IN i_minMovPlayDate DATE , IN i_maxMovPlayDate DATE )
BEGIN

DROP TABLE IF EXISTS CosFilterMovie;
CREATE TABLE CosFilterMovie
SELECT DISTINCT play_movie_name AS movName, theater_name AS thName, theater_street AS thStreet,
            theater_city AS thCity, theater_state AS thState, theater_zipcode AS thZipcode,
            theater_owned_by AS comName, play_date AS movPlayDate, 
            play_release_date AS movReleaseDate
FROM movieplay inner join theater on play_theater_name=theater_name
where THEATER_OWNED_BY=play_owning_company_name and
(theater_owned_by=i_comName or i_comName= 'ALL' or i_comName='') 
and (play_movie_name=i_movName or i_movName= 'ALL' or i_movName='') 
and (theater_city=i_city or i_city= 'ALL' or i_city='') 
and (theater_state=i_state or i_state= 'ALL' or i_state='') 		
AND (  i_minMovPlayDate IS NULL OR play_date >= i_minMovPlayDate)
AND ( i_maxMovPlayDate IS NULL OR play_date <= i_maxMovPlayDate)
AND ( play_date >= play_release_date)
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))

BEGIN
SET @countUser = (SELECT count(*) FROM user WHERE user_name=i_username);
SET @countCustomer = (SELECT count(*) FROM customer WHERE customer_name=i_username);

IF @countUser  = 0 THEN
INSERT INTO user(user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");
END IF;

IF @countCustomer  = 0 THEN
INSERT INTO customer(customer_name) VALUES (i_username);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN
	DROP TABLE IF EXISTS CosViewHistory;
	CREATE TABLE CosViewHistory
	SELECT used_movie_name as movName, used_theater_name as thName, 
    used_owning_company_name as comName, used_creditcard_num as creditCardNum, 
    used_play_date as movPlayDate
	FROM creditcard
    INNER JOIN creditcardUsage on used_creditcard_num = creditcard_num
    WHERE creditcard_owner =  i_cusUsername
    having (select nm from (select used_play_date,count(distinct(used_movie_name)) as nm  from creditcardUsage group by used_play_date) as df where used_play_date='2010-04-02') <4
    ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(16), IN i_movName
VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN

SET @card= (SELECT creditcard_num from creditcard WHERE creditcard_num= i_creditCardNum);
SET @movi= (SELECT play_movie_name from movieplay 
WHERE (play_movie_name= i_movName) AND (play_theater_name=i_thName) AND (play_release_date= i_movReleaseDate) AND (play_date=i_movPlayDate) AND (play_owning_company_name=i_comName)   );


IF (@card IS NOT NULL and @movi is not null) and (select nm from (select used_play_date,count(distinct(used_movie_name)) as nm  from creditcardUsage group by used_play_date) as df where used_play_date='2010-04-02' )<3
THEN
INSERT INTO creditcardUsage (used_creditcard_num,
used_movie_name, used_release_date, used_theater_name, used_owning_company_name, used_play_date)
VALUES (i_creditCardNum, i_movName, i_movReleaseDate, i_thName, i_comName,
i_movPlayDate);
END IF ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `magic44_check_step` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `magic44_check_step`(step_number CHAR(10), step_table CHAR(254), hash_format VARCHAR(2000))
BEGIN
SET @sql_text = concat("insert into magic44_scoring \n",
"(select ",step_number,", 'missing', concat(",hash_format,") \n",
"from magic44_table",step_number," \n",
"where concat(",hash_format,") not in (select concat(",hash_format,") \n",
"from ",step_table,")) \n",
"union (select ",step_number,", 'extra', concat(",hash_format,") \n",
"from ",step_table," \n",
"where concat(",hash_format,") not in \n",
"(select concat(",hash_format,") from magic44_table",step_number,"))");
select @sql_text;
PREPARE statement from @sql_text;
EXECUTE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN
i_creditCardNum CHAR(16))
if length(i_creditCardNum)=16 and
(select nm from (select creditcard_owner,count(creditcard_num) as nm  from CreditCard group by creditcard_owner) as df where creditcard_owner=i_username)<5 
 then
BEGIN
INSERT INTO CreditCard(creditcard_owner, creditcard_num)
VALUES (i_username, i_creditCardNum);
END ;
end if;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password 
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName 
VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))
BEGIN

SET @countUser = (SELECT count(*) FROM user WHERE user_name=i_username);
SET @countCustomer = (SELECT count(*) FROM customer WHERE customer_name=i_username);
SET @countManager = (
SELECT count(*) FROM manager 
WHERE manager_street = i_empStreet 
and manager_name=i_username
AND manager_city = i_empCity
AND manager_zipcode = i_empZipcode
AND manager_state = i_empState);

SET @man_address  = (SELECT COUNT(*) FROM manager 
WHERE (i_empStreet = manager_street)
AND (i_empCity = manager_city)
AND (i_empState = manager_State));

IF @man_address = 0 AND @countManager = 0 AND @countCustomer = 0 AND @countUser = 0
THEN
		INSERT INTO user(user_name, user_password, user_firstname, user_lastname, user_status) 
		VALUES ( i_username, MD5(i_password), i_firstname, i_lastname, "Pending");

		INSERT INTO manager(manager_name, manager_street, manager_city, manager_state, manager_zipcode, manager_works_in) 
		VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName);
		
        INSERT INTO customer(customer_name) 
		VALUES (i_username);
        
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName
VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovieReleaseDate DATE, IN i_maxMovieReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE,
IN i_includeNotPlay BOOLEAN)
BEGIN
	IF (i_includeNotPlay IS NULL OR (i_includeNotPlay IS false))
	THEN
		DROP TABLE IF EXISTS ManFilterTh;
		CREATE TABLE ManFilterTh
		SELECT distinct movie_name AS movName, movie_release_date AS movReleaseDate, play_date AS movPlayDate, movie_duration AS movDuration
		from (movie cross join theater) left join movieplay on movie_name=play_movie_name and play_theater_name=theater_name left join manager on manager_works_in=theater_owned_by

        
		WHERE (theater_managed_by = i_manUsername

		AND (i_minMovDuration IS NULL OR movie_duration >= i_minMovDuration)
		AND (i_maxMovDuration IS NULL OR movie_duration <= i_maxMovDuration)
		AND (i_minMovieReleaseDate IS NULL OR movie_release_date >= i_minMovieReleaseDate)
		AND (i_maxMovieReleaseDate IS NULL OR movie_release_date <= i_maxMovieReleaseDate)); 
        
	ELSE
		DROP TABLE IF EXISTS ManFilterTh;
		CREATE TABLE ManFilterTh
		SELECT distinct movie_name AS movName, movie_release_date AS movReleaseDate, play_date AS movPlayDate, movie_duration AS movDuration
		from (movie cross join theater) left join movieplay on movie_name=play_movie_name and play_theater_name=theater_name left join manager on manager_works_in=theater_owned_by
        WHERE (theater_managed_by = i_manUsername
		and play_date is null
		AND (i_minMovDuration IS NULL OR movie_duration >= i_minMovDuration)
		AND (i_maxMovDuration IS NULL OR movie_duration <= i_maxMovDuration)
		AND (i_minMovieReleaseDate IS NULL OR movie_release_date >= i_minMovieReleaseDate)
		AND (i_maxMovieReleaseDate IS NULL OR movie_release_date <= i_maxMovieReleaseDate));

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))

BEGIN
SET @countUser = (SELECT count(*) FROM user WHERE user_name=i_username);
SET @countManager = (
SELECT count(*) FROM manager 
WHERE manager_name=i_username);

IF @countUser  = 0 THEN
INSERT INTO user(user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");
END IF;

IF @countManager  = 0 THEN
INSERT INTO manager(manager_name, manager_street, manager_city, manager_state,
manager_zipcode, manager_works_in)
VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_schedule_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN 
i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE )
BEGIN

SET @theaterName = 
(SELECT theater_name FROM theater 
WHERE (theater_managed_by = i_manUsername)) ;

SET @comp = 
(SELECT manager_works_in FROM manager 
WHERE (manager_name = i_manUsername));
SET @movie = 
(SELECT movie_name FROM movie 
WHERE (movie_name = i_movName) AND (movie_release_date = i_movReleaseDate));

IF (@theaterName IS NOT NULL and @comp IS NOT NULL and @movie IS NOT NULL)
THEN
INSERT INTO moviePlay (play_owning_company_name, play_movie_name, play_release_date, play_date, play_theater_name) 
VALUES (@comp, i_movName, i_movReleaseDate, i_movPlayDate, @theaterName);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName
VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))

BEGIN
/*
    DROP TABLE IF EXISTS UserFilterTh;
    CREATE TABLE UserFilterTh
SELECT theater_name AS thName, theater_street AS thStreet, theater_city as thCity, theater_state AS thState, theater_zipcode AS thZipcode, theater_owned_by as comName 
    FROM Theater
    WHERE 
(theater_name = i_thName OR i_thName = "ALL") AND
        (theater_owned_by = i_comName OR i_comName = "ALL") AND
        (theater_city = i_city OR i_city = "") AND
        (theater_state = i_state OR i_state = "ALL");
*/		
    IF (i_thName = 'ALL' and i_comName = 'ALL' ) THEN
		IF  i_state = 'ALL' THEN
        DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
        SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
        theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater left join manager on theater_owned_by=manager_works_in
        WHERE (theater_owned_by=manager_works_in and theater_managed_by=manager_name) and 
        (theater_owned_by = i_comName OR i_comName = "ALL") 
        AND (theater_city = i_city OR i_city = '');
       
        ELSE
		DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
        SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
        theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater left join manager on theater_owned_by=manager_works_in
        WHERE (theater_state = i_state OR i_state = '') AND
         (theater_owned_by=manager_works_in and theater_managed_by=manager_name) and 
        (theater_owned_by = i_comName OR i_comName = "ALL") 
        AND (theater_city = i_city OR i_city = '');
        END IF;
        
    ELSEIF i_thName = 'ALL' THEN
		IF i_state = 'ALL' THEN
        DROP TABLE IF EXISTS UserFilterTh;
		CREATE TABlE UserFilterTh
		SELECT  theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
		theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater inner join manager on theater_owned_by=manager_works_in
        WHERE theater_owned_by=i_comName
	    AND (theater_owned_by=manager_works_in and theater_managed_by=manager_name)  
        AND (theater_city = i_city OR i_city = '');
        
        ELSE 
		DROP TABLE IF EXISTS UserFilterTh;
		CREATE TABlE UserFilterTh
		SELECT  theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
		theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater inner join manager on theater_owned_by=manager_works_in
        WHERE theater_owned_by=i_comName
	    AND (theater_state = i_state OR i_state = '') and
         (theater_owned_by=manager_works_in and theater_managed_by=manager_name)  
        AND (theater_city = i_city OR i_city = '');
        END IF;
    
    ELSEIF i_comName = 'ALL' THEN
		IF i_state = 'ALL' THEN
        DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
       SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
       theater_state AS thState, theater_zipcode AS thZipcode, 
       theater_owned_by AS comName 
       FROM theater inner join manager on theater_owned_by=manager_works_in
       WHERE theater_name=i_thName
	   AND (theater_city = i_city OR i_city = '')
       and (theater_owned_by=manager_works_in and theater_managed_by=manager_name);
        
        ELSE 
		DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
       SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity, 
       theater_state AS thState, theater_zipcode AS thZipcode, 
       theater_owned_by AS comName 
       FROM theater inner join manager on theater_owned_by=manager_works_in
       WHERE theater_name=i_thName
       AND (theater_state = i_state OR i_state = '')
	   AND (theater_city = i_city OR i_city = '')
       and (theater_owned_by=manager_works_in and theater_managed_by=manager_name);
       END IF;
  
  ELSE
		IF i_state = 'ALL' THEN
		DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
		SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity,
        theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater inner join manager on theater_owned_by=manager_works_in
        WHERE theater_name = i_thName
        AND theater_owned_by= i_comName
        AND (theater_city = i_city OR i_city = '')
        and (theater_owned_by=manager_works_in and theater_managed_by=manager_name);
        ELSE
		DROP TABLE IF EXISTS UserFilterTh;
        CREATE TABlE UserFilterTh
		SELECT theater_name AS thName, theater_street AS thStreet, theater_city AS thCity,
        theater_state AS thState, theater_zipcode AS thZipcode, 
        theater_owned_by AS comName 
        FROM theater inner join manager on theater_owned_by=manager_works_in
        WHERE theater_name = i_thName
        AND theater_owned_by= i_comName
        AND (theater_state = i_state OR i_state = '')
        AND (theater_city = i_city OR i_city = '')
        and (theater_owned_by=manager_works_in and theater_managed_by=manager_name);
        END IF;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_visitHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN
i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN
    IF(i_minVisitDate IS NULL and i_maxVisitDate is null) then
	DROP TABLE IF EXISTS UserVisitHistory;
	CREATE TABLE UserVisitHistory
	SELECT DISTINCT theater_name as thName, theater_street as thStreet, theater_city as thCity, 
    theater_state as thState, theater_zipcode as thZipcode,
    theater_owned_by as comName, visit_date as visitDate
	FROM visit
	left JOIN theater on (visit_theater=theater_name and visit_company=theater_owned_by)
	WHERE(visit_username = i_username);
    -- AND visit_date= (select max(visit_date) from visit);
    ELSE
	DROP TABLE IF EXISTS UserVisitHistory;
	CREATE TABLE UserVisitHistory
	SELECT DISTINCT theater_name as thName, theater_street as thStreet, theater_city as thCity, 
    theater_state as thState, theater_zipcode as thZipcode,
    theater_owned_by as comName, visit_date as visitDate
	FROM visit
	left JOIN theater on (visit_theater=theater_name and visit_company=theater_owned_by)
	WHERE(visit_username = i_username) AND
	(i_minVisitDate is null or visit_date >= i_minVisitDate) AND
	(i_maxVisitDate is null or visit_date <= i_maxVisitDate);
    END IF;
    
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT user_name as username, user_status as status, user_password
FROM user WHERE ((user_name = i_username AND user_status= ("APPROVED") AND user_password = i_password ) OR
(user_name = i_username AND user_status <> ("APPROVED")));

ALTER TABLE UserLogin ADD isCustomer ENUM('1','0') NOT NULL;
ALTER TABLE UserLogin ADD isManager ENUM('1','0') NOT NULL;
ALTER TABLE UserLogin ADD isAdmin ENUM('1','0') NOT NULL;

SET SQL_SAFE_UPDATES = 0;

IF (i_username IN (SELECT customer_name FROM customer) 
AND i_username IN( SELECT admin_name FROM admin)) then
UPDATE UserLogin SET isCustomer = '1', isAdmin= '1', isManager = '0';

ELSEIF (i_username IN (SELECT customer_name FROM customer) 
AND i_username IN( SELECT manager_name FROM manager)) THEN
UPDATE UserLogin SET isCustomer = '1', isManager = '1', isAdmin = '0';

ELSEIF (i_username) IN (SELECT customer_name FROM customer) THEN
UPDATE UserLogin SET isCustomer = '1', isManager = '0', isAdmin = '0';

ELSEIF (i_username) IN (SELECT manager_name  FROM manager) THEN
UPDATE UserLogin SET isCustomer = '0', isManager = '1', isAdmin = '0';

ELSEIF (i_username) IN (SELECT admin_name  FROM admin) THEN
UPDATE UserLogin SET isCustomer = '0', isManager = '0', isAdmin = '1';

ELSE
UPDATE UserLogin SET isCustomer = '0', isManager = '0', isAdmin = '0';

END IF;

ALTER TABLE UserLogin
DROP COLUMN user_password;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
SET @count = (SELECT count(*) FROM user WHERE user_name=i_username);

IF @count  = 0 THEN
INSERT INTO user (user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_visit_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50),
IN i_visitDate DATE, IN i_username VARCHAR(50))
if
(select nm from (select play_theater_name,play_date, play_owning_company_name, count(play_movie_name) as nm  from movieplay group by play_theater_name,play_owning_company_name, play_date)
 as df where play_theater_name='Star Movies' and play_date='2010-03-25' and play_owning_company_name= 'EZ Theater Company') <
 (select cap from (select theater_name, theater_owned_by, theater_capacity as cap  from theater) as df2 where theater_name=i_thName and theater_owned_by=i_comName)
then
BEGIN
	INSERT INTO visit (visit_theater, visit_company, visit_date, visit_username)
	VALUES (i_thName, i_comName, i_visitDate, i_username);
END ;

end if;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;