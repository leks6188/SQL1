INSERT INTO genre(title_genre)
VALUES('rock'),('pop'),('punk')

INSERT INTO musician(name_musician)
VALUES('В.Цой'),('Ю.Хой'),('К.Лель'),('Е.Летов'),('Queen'),('Slipknot')

INSERT INTO genremusician(genre_id, musician_id)
VALUES(1,1),(3,2),(3,4),(2,3),(1,2),(1,5),(3,6)

 INSERT INTO album(title_album, year_of_release)
 VALUES ('Джага-Джага', 2004),('Апельсин.ч1',2006),('Ленинград',1984),('Колхозный Панк', 1991),
 ('Made in Heaven', 1995),('The End, So Far', 2022)
 
 INSERT INTO albummusician(album_id, musician_id)
 VALUES (1,3),(2,4),(3,1),(4,2),(5,5),(6,6)
 
 INSERT INTO trek(name_trek, lehght_trek, album_id)
 VALUES ('Утопленник', 4.48, 4), ('Муси-Пуси', 3.14, 1 ), ('Мы - лёд', 1.55, 2),
 ('Мне насрать на моё лицо', 3.12, 2),('Троллейбус', 2.32, 3), ('Камчатка', 3.08, 3),
 ('My Life Has Been Saved', 3.15, 5), ('The Chapeltown Rag', 4.51, 6)
 
 INSERT INTO collection(name_collection, year_of_release)
 VALUES ('Цой и Хой', 2000), ('Катя и Егор', 2005), ('Хоровод', 2012), ('Бедные мои Ухи', 2020),
 ('Bohemian Rhapsody: The Original Soundtrack', 2018)
 
 INSERT INTO trekcollection(trek_id, collection_id)
 VALUES (1,1),(5,1),(6,1),(2,2),(3,2),(4,2),(1,3),(2,3),(3,3),(5,3),
 (1,4),(2,4),(7,5)
 
