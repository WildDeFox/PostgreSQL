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

CREATE TABLE subscriptions (
	id SERIAL PRIMARY KEY,
	on_user_id INT NOT NULL,
	on_community_id INT NOT NULL,
	is_subscribed BOOLEAN
);