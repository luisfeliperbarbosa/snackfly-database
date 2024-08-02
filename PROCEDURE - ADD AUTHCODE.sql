use snackfly
DELIMITER //
CREATE PROCEDURE authenticateUser (IN p_username VARCHAR(50), IN p_pin VARCHAR(50))
BEGIN
    DECLARE requestedUserPin VARCHAR(50);
    DECLARE userToken VARCHAR(100);
    DECLARE requestedUser INT;

    
    SELECT IDUSER 
    INTO requestedUser 
    FROM USER 
    WHERE USERNAME = p_username;

    
    IF requestedUser IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Usuário não encontrado.';
    ELSE
      
        SELECT PIN 
        INTO requestedUserPin 
        FROM USER 
        WHERE IDUSER = requestedUser;

       
        IF requestedUserPin <> p_pin THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Senha incorreta.';
        ELSE
           
            INSERT INTO AUTH (ID_USER, TOKEN, isValid) 
            VALUES (requestedUser, UUID(), 1);

            
            SELECT TOKEN 
            INTO userToken 
            FROM AUTH 
            WHERE ID_USER = requestedUser AND isValid = 1 
            ORDER BY created_at DESC 
            LIMIT 1;

            
            SELECT userToken AS token;
            SELECT 'Login feito com sucesso!' AS message;
        END IF;
    END IF;
END//
DELIMITER ;

drop procedure authenticateUser
call authenticateUser('pevss','123456')
select * from auth;
select * from user



