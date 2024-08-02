DELIMITER //
CREATE PROCEDURE updateReview (IN p_token varchar(100), IN p_tripdayID INT, IN p_mealType INT, IN p_imageURL varchar(100),IN p_description varchar(100))
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
    
		UPDATE review 
        SET picture = p_imageURL, 
            description = p_description 
        WHERE idReview = (
            SELECT CASE 
                WHEN p_mealType = 1 THEN idBreakfast
                WHEN p_mealType = 2 THEN idLunch
                WHEN p_mealType = 3 THEN idDinner
                ELSE NULL
            END 
            FROM tripDay
            WHERE idTripDay = p_tripdayID);
    END IF;


		SELECT 'Review finalizada com sucesso!' as message;
    
    
END//
DELIMITER ;

call updateReview('7d47c72c-2f3e-11ef-a92d-02507cb23404','6','2','xyz','Comi bem muito maneiro.')
    drop procedure updateReview
    select * from review
    select * from meal
    select * from auth