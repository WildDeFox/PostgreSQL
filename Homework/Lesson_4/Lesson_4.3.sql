WITH users_owners AS (
    SELECT users.id, first_name, last_name, main_photo_id FROM users
), photos AS (
    SELECT photo.id, photo.url FROM photo
)
SELECT
    video.id AS video_id,
    users_owners.first_name AS first_name,
    users_owners.last_name AS last_name,
    photos.url AS main_photo_url,
    video.url,
    size
    FROM
        video,
        users_owners,
        photos
    WHERE owner_id = users_owners.id
      AND main_photo_id = photos.id
ORDER BY size DESC LIMIT 10;