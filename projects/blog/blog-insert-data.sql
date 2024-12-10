USE `blog_db`;


-- insert users data
INSERT INTO `users`(`name`,`email`,`password`)  
VALUES 
('Halim Islam', 'halimislam@gmail.com', '12345678'),
('Karim Islam', 'karimislam@gmail.com', '12345678');


-- insert category data
INSERT INTO `categories`(`name`)
VALUES
('Programming'),
('Travel'),
('Food'),
('Health'),
('Sports');


-- insert post data
INSERT INTO `posts`(`title`,`slug`,`content`,`user_id`,`category_id`,`status`)
VALUES
('Post 1','post-1', 'This is post 1', 1, 1,'Active'),
('Post 2','post-2', 'This is post 2', 1, 2,'Inactive'),
('Post 3','post-3', 'This is post 3', 2, 3,'Active'),
('Post 4','post-4', 'This is post 4', 2, 4,'Inactive');