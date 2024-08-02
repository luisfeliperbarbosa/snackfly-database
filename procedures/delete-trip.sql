DELIMITER //
CREATE PROCEDURE deleteTrip(IN p_token varchar(100),IN p_tripId int)
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
		update trip set isDeleted = 1 where idTrip = p_tripId and id_user = requesteduser;
        SELECT 'Viagem apagada com sucesso!' as message;
	END IF;
END//
DELIMITER ;

call deleteTrip('4f3ec5d6-2de9-11ef-a92d-02507cb23404','3')
drop procedure deleteTrip
select * from trip;
select * from auth;
