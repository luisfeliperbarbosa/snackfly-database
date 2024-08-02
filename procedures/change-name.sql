DELIMITER //
CREATE PROCEDURE changeName (IN p_newName varchar(50), IN p_token VARCHAR(100))
BEGIN 
	DECLARE REQUESTEDUSER int;
	SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN AND ISVALID = 1 into requesteduser;
    
    
    IF requesteduser is NULL then 
		SIGNAL SQLSTATE '45000'
    	set message_text = "Você não tem permissão para fazer isso.";
	ELSE
    
		update user set name = p_newName where idUser = REQUESTEDUSER;
        SELECT p_newName as newName;
		SELECT 'Nome alterado com sucesso!' as message;
        
    END if;
END //
DELIMITER ;


call changeName('cachorro','4f3ec5d6-2de9-11ef-a92d-02507cb23404')

use snackfly;
select * from user;
drop procedure changeName

