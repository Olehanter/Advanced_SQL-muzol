
INSERT INTO Genre
VALUES(1, 'Folk'),
(2, 'Country'),
(3, 'Blues'),
(4, 'Jazz'),
(5, 'Rock'),
(6, 'Disko');

INSERT INTO Executor
VALUES (1, 'The Beatles'),
(2, 'AC~DC'),
(3, 'Майкл Джексон'),
(4, 'Элвис Пресли'),
(5, 'Элтон Джон'),
(6, 'Led Zeppelin'),
(7, 'Pink Floyd'),
(8, 'Queen'),
(9, 'The Rolling Stones'),
(10, 'ABBA');

INSERT INTO Executor_Genre
VALUES (1, 2),
(2, 5),
(3, 4),
(4, 2),
(5, 3),
(6, 1),
(7, 3),
(8, 5),
(9, 3),
(10, 6);

INSERT INTO Album(album_id, create_at, name,trek_list ) 
VALUES(501, '1970-06-06','Yellow Submarine',''),
(502, '1980-06-06','Back in Black ',''),
(503, '2018-06-06','Love Never Felt So Good',''),
(504, '2019-06-06','If I Can Dream',''),
(505, '2016-06-06','Wonderful Crazy Night',''),
(506, '1973-06-06','Houses of the Holy',''),
(507, '1979-06-06','The Wall',''),
(508, '2019-06-06','The Umbrella Academy',''),
(509, '2020-06-06','Exile on Main St',''),
(510, '2020-06-06','Voyage','');

-- проверим
SELECT * FROM Album;

INSERT INTO Track
VALUES(1, 'Yellow Submarine','3:15', 501, 'Маккартни'),
(2,  'All Together Now', '3:15', 501, 'Маккартни'),
(3,  'Hells Bells', '5:09', 502, 'Джонсон'),
(4,  'Shoot to Thrill', '5:14', 502, 'Янг'),
(5,  'Bad', '4:05', 503, 'Джексон'),
(6,  'If I Can Dream', '3:12', 504, 'Walter Earl Brown'),
(7,  'Fever', '3:13', 504, 'John Davenport'),
(8,  'Wonderful Crazy Night', '3:12', 505, 'Берни Топин'),
(9,  'The Rain Song', '3:15', 506, 'Page, Plant'),
(10,  'Dancing Days', '3:15', 506, 'Page, Plant'),
(11, 'D’yer Mak’er', '3:15', 506, 'Bonham, Jones, Page, Plant'),
(12,  'Mother', '5:15', 507, 'Уотерс, Гилмор'),
(13,  'Hey You', '4:35', 507, 'Уотерс, Гилмор'),
(14,  'Nobody Home', '3:12', 507, 'Гилмор'),
(15,  'Bohemian Rhapsody', '5:55', 508, 'Фредди Меркьюри'),
(16,  'I’m in Love with My Car', '3:05', 508, 'Роджер Тейлор'),
(17,  'Paint It, Black', '3:22', 509, 'Джаггер — Ричардс'),
(18,  'Living in a Ghost Town', '3:15', 509, 'Джаггер — Ричардс'),
(19,  'Little Things', '3:08', 510, 'Бенни Андерссон');

INSERT INTO Track
VALUES(20, 'Soldier Of Fortune', '3:12', 510, 'Deep Purple ');
-- проверим
SELECT * FROM Track;

INSERT INTO Album_Track
VALUES (1, 501),
(2, 501),
(3, 502),
(4, 502),
(5, 503),
(6, 504),
(7, 504),
(8, 505),
(9, 506),
(10, 506),
(11, 506),
(12, 507),
(13, 507),
(14, 507),
(15, 508),
(16, 508),
(17, 509),
(18, 509),
(19, 510);

INSERT INTO Compilation(compilation_id, name, year_issue ) 
	VALUES(61,'Yellow-14', '2014-01-02'),
	(62,'Queen-20', '2020-08-09'),
	(63,'AC\DC-15', '2015-02-03'),
	(64,'ЭлвисДжексон-16', '2016-03-04'),
	(65,'ХитРоск-17', '2017-04-05'),
	(66,'Rock-Hit-18', '2018-05-06'),
	(67,'Satisfaction-19', '2019-06-07'),
	(68,'Zeppelin-19', '2019-07-08');
-- проверим
SELECT * FROM Compilation;

INSERT INTO Track_Compilation
VALUES (1, 61),
(2, 62),
(3, 63),
(4, 64),
(5, 65),
(6, 66),
(7, 67),
(8, 68),
(9, 65),
(11, 61),
(12, 62),
(13, 63),
(14, 64),
(15, 65),
(16, 66),
(17, 67),
(18, 68),
(19, 65);

INSERT INTO executor_album
VALUES (1, 501),
(2, 502),
(3, 503),
(4, 504),
(5, 505),
(6, 506),
(7, 507),
(8, 508),
(9, 509),
(10, 510);

-- проверим
SELECT * FROM executor_album;

