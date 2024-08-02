
DELIMITER //
CREATE PROCEDURE getTrips(IN p_token varchar(100))
BEGIN
	DECLARE requestedUser int;
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN and isvalid = 1 into requestedUser; 
    
	IF requestedUser is null then
		signal sqlstate '45000'
        set message_text = 'Código de autenticação inválido.';
	ELSE
		SELECT idtrip, name, startDate, endDate from trip where id_user = requesteduser and isDeleted = 0;
        
	END IF;
END//
DELIMITER ;

call getTrips('4f3ec5d6-2de9-11ef-a92d-02507cb23404')
drop procedure getTrips
select * from trip
select * from meal
select * from tripday