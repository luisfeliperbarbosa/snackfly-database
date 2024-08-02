use snackfly;

DELIMITER // 
 CREATE PROCEDURE addUser (IN name varchar(50), IN p_username varchar(50), IN pin varchar(50))
 BEGIN

  declare usernameCount int;
  
  SELECT COUNT(*) FROM USER WHERE username = p_username INTO usernameCount;
  
    IF usernameCount > 0 then
      signal sqlstate '45000'
      set message_text = '[{"message":"Esse apelido já existe tente outro.","path" :"username"}]';
	
     ELSE

		INSERT INTO user (name, username, pin, publicCode, created_at) VALUES (name, p_username, pin, uuid(),now());
    
		SELECT publicCode from user where username = p_username ;
    
		SELECT 'Usuário adicionado com sucesso.' AS message;
	END IF;
 END //
DELIMITER ;

call adduser('chao','salsicha','123')
select * from user;
drop procedure adduser