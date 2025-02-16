---------------------------------------------------------------

В первом запросе треков с максимальной одинаковой продолжительностью может быть несколько.
Тут необходимо использовать вложенный запрос и функцию MAX;


SELECT name_trek,
lehght_trek 
FROM trek 
WHERE lehght_trek = (SELECT MAX(lehght_trek ) FROM trek);


------------------------------------------------------------------------

ваша реализация 9 запроса отвечает на вопрос “кто выпустил хоть что-то,
кроме того, что выпустил в 2020”, а не на вопрос: “кто не выпустил альбомы в 2020 году”.

Чтобы решить поставленную задачу нужно сначала найти тех исполнителей,
кто выпустил альбом в 2020 (вложенным запросом), а потом их исключить из общего списка исполнителей.


SELECT name_musician 
FROM musician 
WHERE name_musician NOT IN (
SELECT name_musician FROM musician
JOIN albummusician ON musician.id = albummusician.musician_id 
JOIN album ON albummusician.album_id = album.id 
WHERE album.year_of_release = 2020);
-------------------------------------------------------------------------


в 13 запросе может быть ситуация, что самих коротких по продолжительности треков будет несколько
(с одинаковой длиной), а в вашем случае мы всегда получим один. Тут без вложенного запроса не обойтись;


SELECT name_musician, 
lehght_trek  AS mintrek
FROM musician
JOIN albummusician ON albummusician.musician_id = musician.id
JOIN album ON albummusician.album_id = album.id 
JOIN trek ON trek.album_id = album.id
WHERE trek.lehght_trek = (SELECT min(lehght_trek) FROM trek);

----------------------------------------------------------------------------------

и по результатам вашего 14 запроса вы всегда будете получать только один альбом.
А если альбомов с одинаковым наименьшим количеством треков несколько?Тут логика может быть следующая.
Во внешнем запросе вам нужно объединить таблицы треков и альбомов и сгруппировать их по альбомам. 
Условие по HAVING с подсчетом количества треков позволит сделать отбор. 
Правой частью отбора должен быть вложенный запрос, в котором и надо определять минимальное количество треков в альбоме.
В нем вы так же объединяете треки и альбомы, группируете по альбомам, делаете сортировку по количеству треков (при помощи count)
и используете LIMIT.
Так вы получите корректный результат :)


SELECT title_album,
count(name_trek)
FROM album
JOIN trek ON album.id = trek.album_id 
GROUP BY title_album
HAVING count(name_trek) = (SELECT count(name_trek) cnt
FROM album
JOIN trek ON album.id = trek.album_id 
GROUP BY title_album 
ORDER BY cnt 
LIMIT 1);



