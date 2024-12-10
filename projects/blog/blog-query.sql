
-- get all users 
-- SELECT * FROM users;

-- find user by  email
-- SELECT * FROM users WHERE email = 'karimislam@gmail.com' AND password='12345678';

-- get all categories
-- SELECT name FROM categories;

-- get all posts
-- SELECT * FROM posts;

-- get all posts by category
-- SELECT * FROM posts WHERE category_id = 1;

-- get all posts by user
-- SELECT * FROM posts WHERE user_id = 1;

-- get all posts by user and category
-- SELECT * FROM posts WHERE user_id = 1 AND category_id = 1;

-- get all posts by user and category and date
-- SELECT * FROM posts WHERE user_id = 1 AND category_id = 1 AND created_at = '2022-01-01';

-- Get all active posts with user and category details
-- SELECT 
--     p.title, 
--     p.slug, 
--     p.content 
-- FROM posts p
-- JOIN users u ON p.user_id = u.id
-- JOIN categories c ON p.category_id = c.id;
-- -- WHERE p.status = 'Active';

-- SELECT p.title, u.name,c.name FROM posts p
-- JOIN users u ON p.user_id = u.id
-- JOIN categories c ON p.category_id = c.id
-- WHERE p.status = 'Active';

-- get category base all post
SELECT 
    c.name AS category_name, 
    p.title AS post_title 
FROM categories c
JOIN posts p ON c.id = p.category_id;
