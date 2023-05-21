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
