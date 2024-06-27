CREATE TABLE `Users` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `full_name` VARCHAR(100),
  `address` TEXT,
  `phone_number` VARCHAR(15),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Products` (
  `product_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT,
  `price` DECIMAL(10,2) NOT NULL,
  `stock` INT NOT NULL,
  `category_id` INT,
  `image_url` VARCHAR(255),
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Categories` (
  `category_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT
);

CREATE TABLE `Orders` (
  `order_id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `order_date` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `total` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(50) DEFAULT 'Pending'
);

CREATE TABLE `OrderDetails` (
  `order_detail_id` INT PRIMARY KEY AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL
);

CREATE TABLE `Reviews` (
  `review_id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT,
  `comment` TEXT,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `Cart` (
  `cart_id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `CartItems` (
  `cart_item_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cart_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL
);

ALTER TABLE `Products` ADD FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE;

ALTER TABLE `OrderDetails` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);

ALTER TABLE `Reviews` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`) ON DELETE CASCADE;

ALTER TABLE `Reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `Cart` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `CartItems` ADD FOREIGN KEY (`cart_id`) REFERENCES `Cart` (`cart_id`) ON DELETE CASCADE;

ALTER TABLE `CartItems` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);
