DELIMITER //
CREATE PROCEDURE logOff(IN p_token varchar(100))
BEGIN
	DECLARE requestedUser int;
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN  into requestedUser;
    
    IF requestedUser is null then
		signal sqlstate '45000'
        set message_text = 'Código de autenticação inválido.';
    ELSE
		
		update auth set isvalid = 0 where id_user = requesteduser and isvalid = 1;
	END IF;
END//
DELIMITER ;

select * from user;
call logOff('972bfce9-2f2f-11ef-a92d-02507cb23404')