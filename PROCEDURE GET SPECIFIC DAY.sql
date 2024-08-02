DELIMITER //
CREATE PROCEDURE getSpecificTripDay(IN p_token VARCHAR(100), IN p_tripDayId INT)
BEGIN
	DECLARE requestedTripUser int;
	DECLARE requestedUser int;
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN and isvalid = 1 into requestedUser; 
    
	SELECT trip.id_user 
    FROM tripDay 
    JOIN trip  ON tripday.id_trip = trip.idTrip
    WHERE tripday.idTripDay = p_tripDayId  INTO requestedTripUser;
    
    
   
  

  
    IF requestedUser IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Código de autenticação inválido.';
        
    
   ELSEIF requestedTripUser <> requestedUser then
		signal sqlstate '45000'
        set message_text = 'Você não tem permissão para fazer isso.';
        
        
    ELSE
    
    
		SELECT date from tripday where idtripday = p_tripdayid;
	
		SELECT 
		MEAL.ID_RESTAURANT as restaurantId,
		REVIEW.description as description,
		REVIEW.picture as imageURL
		FROM tripDay 
				
		JOIN MEAL
		 ON MEAL.idMeal = tripday.idbreakfast
			
		 JOIN REVIEW
		ON REVIEW.idReview = MEAL.id_review
        WHERE  idTripDay = p_TripDayId;
        
        
        
        SELECT 
		MEAL.ID_RESTAURANT as restaurantId,
		REVIEW.description as description,
		REVIEW.picture as imageURL
		FROM tripDay 
				
		JOIN MEAL
		 ON MEAL.idMeal = tripday.idlunch
			
		JOIN REVIEW
		ON REVIEW.idReview = MEAL.id_review
        WHERE  idTripDay = p_TripDayId;
        
        
        
        SELECT 
		MEAL.ID_RESTAURANT as restaurantId,
		REVIEW.description as description,
		REVIEW.picture as imageURL
		FROM tripDay 
				
		JOIN MEAL
		 ON MEAL.idMeal = tripday.iddinner
			
		 JOIN REVIEW
		ON REVIEW.idReview = MEAL.id_review
        WHERE  idTripDay = p_tripDayID;
        
    END IF;
END//
DELIMITER ;
drop procedure getSpecificTripDay
select * from meal
call getSpecificTripDay('7d47c72c-2f3e-11ef-a92d-02507cb23404','9')