SELECT name_trek,
MAX(lehght_trek) AS lenght
FROM trek
GROUP BY name_trek
ORDER BY lenght DESC 
LIMIT 1;

SELECT name_trek
FROM trek
WHERE lehght_trek > 3.5;

SELECT name_collection
FROM collection
WHERE year_of_release BETWEEN 2018 AND 2020;

SELECT name_musician
FROM musician
WHERE name_musician NOT LIKE '%.%'
AND name_musician NOT LIKE '% %'
AND name_musician NOT LIKE '%-%'
AND name_musician NOT LIKE '%/_%';

SELECT name_trek
FROM trek
WHERE name_trek LIKE '%мой%' 
OR name_trek ILIKE '%my%';


------------- Задание 3 ---------------------------


SELECT genre.title_genre,
count(musician_id)
FROM genre
JOIN genremusician ON genre_id = genre.id
GROUP BY genre.title_genre;


SELECT COUNT(name_trek) AS cnt_trek
FROM trek
JOIN album ON album_id = album.id
WHERE year_of_release BETWEEN 2019 AND 2022; 


SELECT title_album,
AVG(lehght_trek)
FROM trek
JOIN album ON trek.album_id = album.id
GROUP BY title_album;


SELECT name_musician
FROM musician
JOIN albummusician ON musician.id = albummusician.musician_id 
JOIN album ON albummusician.album_id = album.id 
WHERE album.year_of_release != 2020;

SELECT collection.name_collection
FROM collection
JOIN trekcollection ON collection.id = trekcollection.collection_id
JOIN trek ON trekcollection.trek_id  = trek.id 
JOIN album ON trek.album_id = album.id 
JOIN albummusician ON album.id = albummusician.album_id 
JOIN musician ON albummusician.musician_id = musician.id 
WHERE musician.name_musician = 'К.Лель';



-------------------------- Задание 4 ----------------


SELECT title_album 
FROM album 
JOIN albummusician ON album.id = albummusician.album_id 
JOIN musician ON albummusician.musician_id = musician.id 
JOIN genremusician ON musician.id = genremusician.musician_id 
JOIN genre ON genremusician.genre_id = genre.id 
GROUP BY album.title_album 
HAVING COUNT(title_genre) > 1;


SELECT trek.name_trek 
FROM trek 
LEFT JOIN trekcollection ON trek.id = trekcollection.trek_id 
LEFT JOIN collection ON collection.id = trekcollection.collection_id 
WHERE trekcollection.collection_id IS NULL;


SELECT name_musician, 
min(trek.lehght_trek ) AS mintrek
FROM musician
JOIN albummusician ON albummusician.musician_id = musician.id
JOIN album ON albummusician.album_id = album.id 
JOIN trek ON trek.album_id = album.id
GROUP BY musician.name_musician
ORDER BY mintrek
LIMIT 1;


SELECT title_album,
count(name_trek) AS cnt
FROM album
JOIN trek ON album.id = trek.album_id 
GROUP BY title_album
ORDER BY cnt 
LIMIT 2;























