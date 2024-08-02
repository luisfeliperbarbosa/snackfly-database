DELIMITER //
CREATE PROCEDURE getAllTripDays(IN p_token varchar(100),IN p_tripId int)
BEGIN
	DECLARE requestedTripUser int;
	DECLARE requestedUser int;
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN and isvalid = 1 into requestedUser; 
	SELECT ID_USER FROM TRIP WHERE idtrip = p_tripId into requestedTripUser;
    
    IF requestedUser is null then
		signal sqlstate '45000'
        set message_text = 'Código de autenticação inválido.';
        
	ELSEIF requesteduser <> requestedTripUser then
		signal sqlstate '45000'
        set message_text = 'Você não tem permissão para fazer isso.';
        
	ELSE 
		SELECT idTripDay, date from tripDay where id_trip = p_tripId;
	END IF;
END//
DELIMITER ;

call getAllTripDays('7d47c72c-2f3e-11ef-a92d-02507cb23404', '1')