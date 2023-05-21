-- Создание таблиц
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	phone VARCHAR(15) UNIQUE,
	main_photo_id INT,
	created_at TIMESTAMP
);

-- Таблица сообщений
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_user_id INT NOT NULL,
    to_user_id INT NOT NULL,
    body TEXT,
    is_important BOOLEAN,
    is_delivered BOOLEAN,
    created_at TIMESTAMP
);

-- Таблица дружбы
CREATE TABLE friendship (
	id SERIAL PRIMARY KEY,
	requested_by_user_id INT NOT NULL,
	requested_to_user_id INT NOT NULL,
	status_id INT NOT NULL,
	requested_at TIMESTAMP,
	confirmed_at TIMESTAMP
);

-- Таблица статусов дружбы
CREATE TABLE friendship_statuses (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE
);

-- Таблица сообществ
CREATE TABLE communities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(120) UNIQUE,
	creator_id INT NOT NULL,
	created_at TIMESTAMP
);

-- Таблица связи сообщества - пользователь
CREATE TABLE communities_users (
	community_id INT NOT NULL,
	user_id INT NOT NULL,
	created_at TIMESTAMP,
	PRIMARY KEY (community_id, user_id)
);

-- Таблица фотографий
CREATE TABLE photo (
	id SERIAL PRIMARY KEY,
	url VARCHAR(250) NOT NULL UNIQUE,
	owner_id INT NOT NULL,
	description VARCHAR(250) NOT NULL,
	uploaded_at TIMESTAMP NOT NULL,
	size INT NOT NULL
);

-- Таблица видео
CREATE TABLE video (
	id SERIAL PRIMARY KEY,
	url VARCHAR(250) NOT NULL UNIQUE,
	owner_id INT NOT NULL,
	description VARCHAR(250) NOT NULL,
	uploaded_at TIMESTAMP NOT NULL,
	size INT NOT NULL
);

-- Таблица подписки
CREATE TABLE subscriptions (
	id SERIAL PRIMARY KEY,
	on_user_id INT NOT NULL,
	on_community_id INT NOT NULL,
	is_subscribed BOOLEAN
);