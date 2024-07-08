CREATE TABLE `books`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL,
    `isbn` VARCHAR(20) NOT NULL,
    `published_at` DATE NOT NULL,
    `stock` INT NOT NULL,
    `author_id` BIGINT NOT NULL
);
ALTER TABLE
    `books` ADD UNIQUE `books_isbn_unique`(`isbn`);
CREATE TABLE `customers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL
);
CREATE TABLE `purchases`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` INT NOT NULL,
    `purchase_at` DATE NOT NULL
);
CREATE TABLE `purchase_Items`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `purchase_id` INT NOT NULL,
    `book_id` INT NOT NULL,
    `quantity` INT NOT NULL
);
CREATE TABLE `authors`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `purchase_Items` ADD CONSTRAINT `purchase_items_book_id_foreign` FOREIGN KEY(`book_id`) REFERENCES `books`(`id`);
ALTER TABLE
    `books` ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `authors`(`id`);
ALTER TABLE
    `purchases` ADD CONSTRAINT `purchases_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`id`);
ALTER TABLE
    `purchase_Items` ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY(`purchase_id`) REFERENCES `purchases`(`id`);