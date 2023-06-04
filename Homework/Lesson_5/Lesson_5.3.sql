DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(120),
    phone VARCHAR(15),
    main_photo_id INT,
    created_at TIMESTAMP
) PARTITION BY RANGE (main_photo_id);

ALTER TABLE users
    ADD CONSTRAINT main_photo_id_fk
    FOREIGN KEY (main_photo_id)
    REFERENCES photo (id)
    ON DELETE CASCADE;

DROP TABLE IF EXISTS profile;
CREATE TABLE profile
    PARTITION OF users
    FOR VALUES FROM ('1') TO ('151');
	
INSERT INTO users VALUES (1,'Amery','Troy Hogan','consequat@protonmail.couk','(254) 796-1770',1,'06/06/2022');

SELECT * FROM profile;