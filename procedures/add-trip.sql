DELIMITER //
CREATE PROCEDURE addTrip (IN p_token varchar(100), IN p_tripname varchar(50), IN p_startDate date, IN p_endDate date)
BEGIN
	DECLARE generatedReviewID int;
	DECLARE LUNCHID int;
    DECLARE DINNERID int;
	DECLARE BREAKFASTID int;
	DECLARE generatedTripId int;
	DECLARE tripDayDate date;
	DECLARE DAYCOUNTER int default 0;
	DECLARE TRIPDAYS int;
	DECLARE REQUESTEDUSER int;
	SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN AND ISVALID = 1 into requesteduser;
    
		IF requesteduser is NULL then 
			SIGNAL SQLSTATE '45000'
			set message_text = "Você não tem permissão para fazer isso.";
        
		ELSE 
			
			insert into trip(name, startDate, endDate, id_user,isDeleted) values (p_tripname, p_startDate, p_endDate, requestedUser,0);
            SELECT idTrip from trip where id_user = requesteduser order by idtrip desc limit 1 into generatedTripId;
            
            
            
			SELECT DATEDIFF(p_endDate, p_startDate) INTO TRIPDAYS;
            WHILE DAYCOUNTER <= TRIPDAYS DO
            
				insert into review() values();
                SELECT last_insert_id() INTO generatedReviewId;
                
				insert into meal(id_mealType,id_review) values (1,generatedReviewId);
                SELECT last_insert_id() INTO breakfastID; 
                
                insert into review() values();
                SELECT last_insert_id() INTO generatedReviewId;
                
                insert into meal(id_mealType,id_review) values (2,generatedReviewId);
                SELECT last_insert_id() INTO lunchID;
                
                insert into review() values();
                SELECT last_insert_id() INTO generatedReviewId;
                
                insert into meal(id_mealType,id_review) values (3,generatedReviewId);
                SELECT last_insert_id() INTO dinnerID;
                
                
                
				SELECT DATE_ADD(p_startDate, interval daycounter day) into tripDayDate;
                INSERT INTO TRIPDAY(date, id_trip,idbreakfast,idlunch,iddinner) values (tripDayDate, generatedTripID,BREAKFASTID,LUNCHID,DINNERID);
                SET DAYCOUNTER = DAYCOUNTER + 1;
                
			END WHILE;
            
            
            
			SELECT generatedTripId AS tripId;
            SELECT 'Nova viagem criada com sucesso!'as message;
		END IF;		
END//
DELIMITER ;
    use snackfly
    
    call addTrip('7d47c72c-2f3e-11ef-a92d-02507cb23404','Role na italia','2024-09-24','2024-09-29')
    select * from auth
    drop procedure addtrip
    select * from tripday;
    select * from meal
    select * from trip;
    select * from review