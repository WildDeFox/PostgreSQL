-- не изменяемое представление
DROP VIEW ten_big_videos_users;
CREATE VIEW ten_big_videos_users AS
    SELECT u.id, first_name, last_name, url, size
        FROM video
            LEFT JOIN users u on u.id = video.owner_id
    ORDER BY size DESC LIMIT 10;

SELECT * FROM ten_big_videos_users;

-- изменяемое представление
DROP VIEW IF EXISTS small_videos;
CREATE VIEW small_videos AS
    SELECT id, url, size
        FROM video
    WHERE size BETWEEN 10 AND 500
    ORDER BY size;

SELECT * FROM small_videos;
SELECT id, size FROM small_videos WHERE id = 108;
UPDATE small_videos SET size = 167 WHERE id = 108;
SELECT id, size FROM small_videos WHERE id = 108;