SELECT
    video.id AS video_id,
    users_selection.first_name AS first_name,
    users_selection.last_name AS last_name,
    photo_selection.url AS main_photo_url,
    video.url,
    size
    FROM
        video,
        (SELECT id, first_name, last_name, main_photo_id FROM users) AS users_selection,
        (SELECT photo.id, photo.url FROM photo) AS photo_selection
    WHERE video.owner_id = users_selection.id
      AND main_photo_id = photo_selection.id
ORDER BY size DESC LIMIT 10;