CREATE TABLE `mealType` (
  `idMealType` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(40),
  `created_at` timestamp
);

CREATE TABLE `trip` (
  `idTrip` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `startDate` date,
  `endDate` date,
  `name` varchar(50),
  `publicCode` interger,
  `isDeleted` bit,
  `id_user` integer,
  `created_at` timestamp
);

CREATE TABLE `user` (
  `idUser` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `pin` varchar(40),
  `isDeleted` bit,
  `created_at` timestamp
);

CREATE TABLE `auth` (
  `idAuth` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `code` integer,
  `id_user` integer,
  `isDeleted` bit,
  `created_at` timestamp
);

CREATE TABLE `destination` (
  `idDestination` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `stay` integer,
  `idBreakfast` integer,
  `idLunch` integer,
  `idDinner` integer,
  `isDeleted` bit,
  `id_trip` integer,
  `created_at` timestamp
);

CREATE TABLE `review` (
  `idReview` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(200),
  `picture` varchar(70),
  `isDeleted` bit,
  `created_at` timestamp
);

CREATE TABLE `meal` (
  `idMeal` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `id_mealType` integer,
  `id_restaurant` integer,
  `id_review` integer,
  `isDeleted` bit,
  `created_at` timestamp
);

CREATE TABLE `restaurant` (
  `idRestaurant` integer UNIQUE PRIMARY KEY AUTO_INCREMENT,
  `lat` float,
  `lng` float,
  `isDeleted` bit,
  `created_at` timestamp
);

ALTER TABLE `trip` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`);

ALTER TABLE `auth` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`);

ALTER TABLE `destination` ADD FOREIGN KEY (`id_trip`) REFERENCES `trip` (`idTrip`);

ALTER TABLE `mealType` ADD FOREIGN KEY (`idMealType`) REFERENCES `meal` (`id_mealType`);

ALTER TABLE `restaurant` ADD FOREIGN KEY (`idRestaurant`) REFERENCES `meal` (`id_restaurant`);

ALTER TABLE `meal` ADD FOREIGN KEY (`id_review`) REFERENCES `review` (`idReview`);

ALTER TABLE `destination` ADD FOREIGN KEY (`idLunch`) REFERENCES `meal` (`idMeal`);

ALTER TABLE `destination` ADD FOREIGN KEY (`idDinner`) REFERENCES `meal` (`idMeal`);

ALTER TABLE `destination` ADD FOREIGN KEY (`idBreakfast`) REFERENCES `meal` (`idMeal`);
