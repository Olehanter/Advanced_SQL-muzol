
--Продвинутая выборка данных
-- 1.посчитаем, сколько испол-й играло в жанре
SELECT name, COUNT(Executor_id) e_q FROM genre g
JOIN executor_genre e ON g.genre_id = e.genre_id
GROUP BY g.name
ORDER BY e_q DESC;

-- 2.посчитаем, сколько track играло в albom 2019-2020г.
SELECT name, COUNT(track_id) t_c FROM album a
JOIN album_track ta ON a.album_id = ta.album_id
WHERE create_at BETWEEN '2019-01-01' and '2020-12-31'
GROUP BY a.name
ORDER BY t_c DESC;

--3.Средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(duration) t_d FROM album a
JOIN album_track ta ON a.album_id = ta.album_id
JOIN track t ON t.album_id = ta.album_id
GROUP BY a.name
ORDER BY t_d DESC;

--+4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT e.name, al.create_at FROM Executor e 
JOIN executor_album  ae ON e.executor_id = ae.executor_id 
JOIN album al ON ae.album_id = al.album_id 
WHERE not  al.create_at BETWEEN '20-01-01' AND '2020-12-31';
--не совсем понял, зачем вам в 4 запросе группировка,

--+5Названия сборников, в которых присутствует конкретный исполнитель (Queen)
 SELECT c.name FROM Compilation c 
 JOIN track_compilation tc ON c.Compilation_id = tc.Compilation_id 
 JOIN track t ON tc.track_id = t.track_id 
 JOIN album al ON t.album_id = al.album_id 
 JOIN executor_album ea ON al.album_id = ea.album_id 
 JOIN executor e ON ea.executor_id = e.executor_id 
 WHERE e.name = 'Queen';

--+6.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name, COUNT(eg.genre_id) cg FROM album a
JOIN executor_album ea ON a.album_id = ea.album_id
JOIN executor e ON ea.executor_id = e.executor_id
JOIN executor_genre eg ON e.executor_id = eg.executor_id
JOIN genre g ON eg.genre_id = g.genre_id
GROUP BY a.name
HAVING COUNT(eg.genre_id)>1;

--+7.Наименования треков, которые не входят в сборники.
SELECT t.name  FROM track t 
FULL OUTER 
JOIN Track_Compilation ct ON t.track_id = ct.track_id 
LEFT JOIN compilation c ON ct.compilation_id = c.compilation_id 
WHERE c.compilation_id IS NULL;

--+8.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT e.name, duration FROM executor e
JOIN executor_album ge ON e.executor_id= ge.executor_id
JOIN album a ON ge.album_id = a.album_id
JOIN album_track ta ON ge.album_id = ta.album_id
JOIN track t ON t.album_id = ta.album_id
WHERE duration = (SELECT MIN(duration) FROM Track);

--+9.1Названия альбомов, содержащих наименьшее количество треков.
--SELECT name, COUNT(track_id) ct FROM album a
--JOIN album_track ta ON a.album_id = ta.album_id
--GROUP BY a.name
--HAVING COUNT(track_id) <= (SELECT COUNT(track_id) FROM track) AND COUNT(track_id) < 2
--ORDER BY ct ;

--+9.2Названия альбомов, содержащих наименьшее количество треков.
SELECT al.name, COUNT(t.name) FROM album al 
JOIN track t ON al.album_id = t.album_id 
GROUP BY al.name 
HAVING COUNT(t.name) = ( SELECT MIN(COUNT) FROM ( SELECT al.name, COUNT(t.name) FROM album al 
	JOIN track t ON al.album_id = t.album_id 
	GROUP BY al.name) t);
