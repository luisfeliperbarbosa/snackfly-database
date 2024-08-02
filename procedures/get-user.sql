DELIMITER //
CREATE PROCEDURE getUserData (IN p_token varchar(100))
BEGIN
	DECLARE requesteduser int;
    SELECT id_user from auth where token = p_token into requesteduser;
    
    IF 	requesteduser is null then
		signal sqlstate '45000'
		set message_text = 'Esse usuário não existe.';
	ELSE  
		SELECT name,username,pin FROM USER WHERE IDUSER = REQUESTEDUSER;
        
	END IF;
END //
DELIMITER ;


call getuserdata('21c438ff-2de9-11ef-a92d-02507cb23404')
drop procedure getUserData


