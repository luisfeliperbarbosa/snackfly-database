DELIMITER //
CREATE PROCEDURE changeTripName(IN p_token varchar(100), IN p_newTripName varchar(50),IN p_tripId int)
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
		update trip set name  = p_newTripName where id_user = REQUESTEDUSER and idTrip = p_tripId and isDeleted = 0;
        SELECT p_newTripName as newTripName;
        SELECT 'Nome alterado com sucesso!' as message;
	END IF;
END//
DELIMITER ;


call changeTripName('ae749629-2eb0-11ef-a92d-02507cb23404','Rolezin  uga buga','4')
select * from trip;
drop procedure changeTripName
