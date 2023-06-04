CREATE ROLE fedor_serov LOGIN; -- создаем роль Федор Серов
ALTER ROLE fedor_serov WITH PASSWORD ''; -- задаем пароль для подключения к бд
CREATE ROLE roman_belov LOGIN; -- создаем роль Роман Белов
ALTER ROLE roman_belov WITH PASSWORD ''; -- задаем пароль для подключения к бд
CREATE ROLE analysts; -- создаем роль аналитики
CREATE ROLE testers; -- создаем роль тестировщики
SELECT rolname FROM pg_roles; -- просматриваем список ролей
GRANT analysts TO fedor_serov; -- помещаем роль Федор Серов в роль-группу аналитики
GRANT testers TO roman_belov; -- помещаем роль Роман Белов в роль-группу тестировщики
-- \c vk переключаемся на бд vk
GRANT ALL ON ALL TABLES IN SCHEMA public TO testers; -- даем все права в бд vk
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers; -- даем права на последовательности
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts; -- даем права только на чтение
-- \z проверим права на таблицы бд

-- psql -U fedor_serov -d vk -h 127.0.0.1 -W подлючаемся к бд как fedor_serov
SELECT first_name FROM users WHERE id = 1; -- делаем простой запрос на выборку
/*first_name
------------
 Fritz
(1 строка)*/
UPDATE users SET first_name = 'Joy' WHERE id = 1; -- делаем простой запрос на изменение
-- ERROR:  permission denied for table users получаем ошибку на изменение

-- psql -U roman_belov -d vk -h 127.0.0.1 -W подлючаемся к бд как roman_belov
SELECT first_name FROM users WHERE id = 1; -- делаем простой запрос на выборку
/*first_name
------------
 Fritz
(1 строка)*/
UPDATE users SET first_name = 'Joy' WHERE id = 1; -- делаем простой запрос на изменение
-- UPDATE 1
SELECT first_name FROM users WHERE id = 1; -- проверим изменение
/*first_name
------------
 Joy
(1 строка)*/