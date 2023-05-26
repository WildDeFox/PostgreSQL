CREATE OR REPLACE PROCEDURE check_owner_main_photo()
LANGUAGE plpgsql AS
$$
    DECLARE real_owner RECORD;
    BEGIN
       FOR real_owner IN
           SELECT profiles.user_id
                FROM profiles
                    JOIN photo p on p.id = profiles.main_photo_id
           WHERE p.owner_id != profiles.user_id
        LOOP
           UPDATE profiles SET main_photo_id = NULL WHERE user_id = real_owner.user_id;
        END LOOP;
       COMMIT;
    END;
$$

ALTER TABLE profiles ALTER COLUMN main_photo_id DROP NOT NULL;

CALL main_photo_id_cleanup();

SELECT main_photo_id FROM profiles;