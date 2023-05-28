SELECT
    video.id AS video_id,
    first_name,
    last_name,
    photo.url AS main_photo_url,
    video.url,
    video.size
    FROM video
        JOIN users
        ON video.owner_id = users.id
        JOIN photo
        ON users.main_photo_id = photo.id
ORDER BY video.size DESC LIMIT 10;