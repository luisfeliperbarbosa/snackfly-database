DELIMITER //
CREATE PROCEDURE changePin (IN p_newPin varchar(50), IN p_token varchar(100))
BEGIN 
    DECLARE REQUESTEDUSER int;
	SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN AND ISVALID = 1 into requesteduser;
    
    IF requesteduser is NULL then 
		SIGNAL SQLSTATE '45000'
    	set message_text = "Você não tem permissão para fazer isso.";
        
	ELSE
		
		update user set pin = p_newPin where idUser = requesteduser;
        SELECT p_newPin as newPin;
        SELECT 'Senha alterada com sucesso!'as message;
	END IF;
        
END //
DELIMITER ;

drop procedure changePin;
call changePin('12345','972bfce9-2f2f-11ef-a92d-02507cb23404')

select * from user
select * from auth

