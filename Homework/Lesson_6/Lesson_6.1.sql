DROP FUNCTION IF EXISTS get_id_active_interlocutor(user_id INTEGER); -- удаляем функцию, если она уже существует
CREATE FUNCTION get_id_active_interlocutor(user_id INTEGER) -- создаем функцию с параметром идентификатора пользователя
RETURNS INTEGER AS -- возвращаемое значение, ид искомого пользователя
$$
    SELECT messages.from_user_id
        FROM messages,
         (SELECT to_user_id,
                 from_user_id
            FROM messages
            WHERE to_user_id = user_id) AS selection_id -- выбираем получателя, где ид получателя равен параметру ид получателя
    WHERE messages.from_user_id = selection_id.from_user_id AND messages.to_user_id = user_id -- выбираем всех отправителей получателя 
    GROUP BY messages.from_user_id -- группируем сообщения отправителей получателя
    ORDER BY COUNT(*) DESC -- сортируем по количеству отправленных сообщений отправителем получателю
    LIMIT 1 -- ограничиваем одним элементом
$$
LANGUAGE SQL;

SELECT
    id,
    first_name,
    last_name,
    email,
    phone
    FROM users
    WHERE id = get_id_active_interlocutor(16); -- выводит данные искомого пользователя
	-- в данном случае выводится пользователь, который больше всего писал пользователю с ид 16