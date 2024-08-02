DELIMITER //
CREATE PROCEDURE autoLogin (IN p_token varchar(100))
BEGIN
	DECLARE requestedUser int;
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN and isvalid = 1 into requestedUser; 
    IF requestedUser is null then
		signal sqlstate '45000'
        set message_text = 'Código de autenticação inválido.';
	ELSE
		SELECT PUBLICCODE FROM USER WHERE IDUSER = REQUESTEDUSER;
        SELECT 'Login realizado com sucesso!' as message;
    
	END IF;
END //
DELIMITER ;

call autoLogin('96b594a1-2f6b-11ef-a92d-02507cb23404')
select * from auth;
select * from user;
select * from user

