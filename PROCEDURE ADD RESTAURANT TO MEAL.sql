DELIMITER //
CREATE PROCEDURE addRestaurantToMeal(IN p_token varchar(100), IN p_tripDayID int, IN p_mealType int, IN p_restaurantID varchar(100), IN p_restaurantLat float, IN p_restaurantLng float)
BEGIN
	DECLARE requestedTripId INT;
	DECLARE requestedRestaurantId varchar(100);
	DECLARE requestedMealId int;
	DECLARE requestedTripUser int;
	DECLARE requestedUser int;
    DECLARE requestedTripDayID int;
    
    SELECT ID_USER FROM AUTH WHERE TOKEN = P_TOKEN and isvalid = 1 into requestedUser; 
    SELECT id_trip from tripday where idtripday = p_tripdayID into requestedTripId;
    SELECT id_user FROM trip WHERE idTrip = requestedTripId into requestedTripUser;
    SELECT idrestaurant from  restaurant where idRestaurant = p_restaurantID into requestedRestaurantId;
    
    SELECT IDMEAL FROM MEAL 
        JOIN TRIPDAY
        ON idbreakfast = idmeal or idlunch = idmeal or iddinner =idmeal 
        where meal.id_mealType = p_mealtype and tripday.idtripday = p_tripDayID into requestedMealId;
    
  
    
    
	
    
    
    IF requestedUser is null then
		signal sqlstate '45000'
        set message_text = 'Código de autenticação inválido.';
        
	ELSEIF requestedTripUser <> requestedUser then
		signal sqlstate '45000'
        set message_text = 'Você não tem permissão para fazer isso.';
        
	ELSEIF requestedMealId is null then
		signal sqlstate '45000'
        set message_text = 'Essa refeição não existe.';
	
	END IF;
    
    IF requestedRestaurantId is null then
		
		insert into restaurant(idrestaurant,lat,lng) values(p_restaurantID, p_restaurantlat, p_restaurantlng);
	END IF;

	update meal set id_restaurant = p_restaurantId where idmeal = requestedMealId;
    SELECT 'Restaurante selecionado com sucesso.' as message;
END//
DELIMITER ;
		
		
		
call addRestaurantToMeal('7d47c72c-2f3e-11ef-a92d-02507cb23404','9','3','SmashKing','300.00','390.00')
       
	drop procedure addRestaurantToMeal
        
        
        select * from restaurant
        select * from tripday
        select * from meal