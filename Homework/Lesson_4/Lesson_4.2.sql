DROP TABLE IF EXISTS temp_users_table;
CREATE TEMPORARY TABLE temp_users_table(
    user_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    main_photo_id INT
);

INSERT INTO temp_users_table
        SELECT id, first_name, last_name, main_photo_id FROM users;

DROP TABLE IF EXISTS temp_photo_table;
CREATE TEMPORARY TABLE temp_photo_table(
    photo_id INT,
    main_photo_url VARCHAR(250)
);

INSERT INTO temp_photo_table(
        SELECT id, url FROM photo
);

SELECT
    video.id AS video_id,
    first_name,
    last_name,
    temp_photo_table.main_photo_url,
    video.url,
    size
    FROM
        video,
        temp_users_table,
        temp_photo_table
    WHERE owner_id = user_id
      AND main_photo_id = photo_id
ORDER BY size DESC LIMIT 10;