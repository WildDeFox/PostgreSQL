CREATE OR REPLACE FUNCTION update_profiles_main_photo_trigger()
RETURNS TRIGGER AS
$$
DECLARE real_owner INTEGER;
BEGIN
    real_owner := (SELECT owner_id FROM photo WHERE id = NEW.main_photo_id);
    IF NEW.user_id != real_owner THEN
        RAISE EXCEPTION 'User with ID: % has no photo from ID: %', NEW.user_id, NEW.main_photo_id;
    END IF;
    RETURN NEW;
END
$$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_profiles_on_update ON profiles;
CREATE TRIGGER check_profiles_on_update BEFORE UPDATE ON profiles
    FOR EACH ROW
EXECUTE FUNCTION update_profiles_main_photo_trigger();

SELECT user_id, main_photo_id FROM profiles WHERE user_id = 3;
UPDATE profiles SET main_photo_id = 45 WHERE user_id = 3;
SELECT user_id, main_photo_id FROM profiles WHERE user_id = 3;

SELECT user_id, main_photo_id FROM profiles WHERE user_id = 4;
UPDATE profiles SET main_photo_id = 23 WHERE user_id = 4;
SELECT user_id, main_photo_id FROM profiles WHERE user_id = 4;