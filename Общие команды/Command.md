# Переключение на пользователя postgres
sudo su - postgres

# Запус консольного клиента 
psql

# Создание пользователя
postgres=# CREATE USER gb_user WITH PASSWORD 'gbsecurity';

# Создание базы данных
postgres=# CREATE DATABASE test;

# Предоставление прав пользователю
postgres=# GRANT ALL PRIVILEGES ON DATABASE test to gb_user;

# Создание резервной копии
pg_dump vk > vk.dump.sql

# Восстановление из резервной копии
psql vk_test < vk.dump.sql

# Удаление таблицы
DROP TABLE имя_таблицы

# Удаление вторичного ключа
ALTER TABLE имя_таблицы DROP CONSTRAINT имя_вторичного_ключа;

# Приведения типа 
SELECT created_at, CAST (created_at AS VARCHAR(4)) FROM users WHERE id = 1;

# Приведения типа в PostgreSQL
SELECT created_at, created_at::CARCHAR(4) FROM users WHERE id = 1;

# Создание своего типа
CREATE TYPE likes_stat_type AS (likes INTEGER, dislikes INTEGER);