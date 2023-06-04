SELECT * FROM pg_extension WHERE extname = 'xml2'; -- проверим не было ли расширение установлено ранее
-- (0 строк)
CREATE EXTENSION xml2; -- выполним установку
-- CREATE EXTENSION
SELECT * FROM pg_extension WHERE extname = 'xml2'; -- снова проверим информацию
/*-[ RECORD 1 ]--+------
oid            | 17546
extname        | xml2
extowner       | 10
extnamespace   | 2200
extrelocatable | f
extversion     | 1.1
extconfig      |
extcondition   |*/