CREATE SCHEMA `osbb` DEFAULT CHARACTER SET utf8 ;
USE osbb;

CREATE TABLE `buildings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NOT NULL,
  `flats_count` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `flats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` TINYINT NOT NULL,
  `square` FLOAT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `buildings_to_flat` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `building_id` INT NOT NULL,
  `flat_id` INT NOT NULL,
  FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
  FOREIGN KEY (`flat_id`) REFERENCES `flats` (`id`)
);

CREATE TABLE `owners` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL default 'default@example.com',
  `has_right` BOOLEAN NOT NULL,
  `ownership_count` INT NOT NULL
);

CREATE TABLE `ownership_rights` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `owner_id` INT NOT NULL,
  `flat_id` INT NOT NULL,
  FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  FOREIGN KEY (`flat_id`) REFERENCES `flats` (`id`)
);

CREATE TABLE `residents` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL default 'default@example.com',
  `has_right` BOOLEAN NOT NULL,
  `owner_id` INT,
  FOREIGN KEY (`owner_id`) REFERENCES `owners`(`id`)
);

CREATE TABLE `osbb_members` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL default 'default@example.com',
  `roles` SET('Учасник ОСББ', 'Працівник ОСББ', 'Член правління ОСББ', 'Голова ОСББ') NOT NULL DEFAULT 'Учасник ОСББ',
  `owner_id` INT,
  FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`)
);


CREATE TABLE `residence` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `flat_id` INT NOT NULL,
  `resident_id` INT NOT NULL,
  FOREIGN KEY (`flat_id`) REFERENCES `flats`(`id`),
  FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`)
);




