
-- 1.посчитаем, сколько испол-й играло в жанре
SELECT name, COUNT(Executor_id) e_q FROM genre g
JOIN executor_genre a ON g.genre_id = a.genre_id
GROUP BY g.name
ORDER BY e_q DESC;

-- 2.посчитаем, сколько track играло в albom 2019-2020г.
SELECT name, COUNT(track_id) t_a FROM album a
JOIN album_track ta ON a.album_id = ta.album_id
WHERE create_at BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY a.name
ORDER BY t_a DESC;

--3.Средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(duration) t_d FROM album a
JOIN album_track ta ON a.album_id = ta.album_id
JOIN track t ON t.album_id = ta.album_id
GROUP BY a.name
ORDER BY t_d DESC;

--4.Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT e.name FROM album a
JOIN executor_album  ge ON a.album_id = ge.album_id
JOIN Executor e ON ge.executor_id = e.executor_id
WHERE not a.create_at = '2020-06-06'
GROUP BY e.name;

--5.Названия сборников, в которых присутствует конкретный исполнитель (Queen).
SELECT name FROM compilation co
WHERE name LIKE '%Queen%'
GROUP BY name;

--6.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name, COUNT(eg.genre_id) cg FROM album a
JOIN executor_album ea ON a.album_id = ea.album_id
JOIN executor e ON ea.executor_id = e.executor_id
JOIN executor_genre eg ON e.executor_id = eg.executor_id
JOIN genre g ON eg.genre_id = g.genre_id
GROUP BY a.name
HAVING COUNT(eg.genre_id)>1;

--7.Наименования треков, которые не входят в сборники.
SELECT co.name FROM Track co
left JOIN Track_Compilation t_co ON co.track_id = t_co.track_id
left JOIN compilation t ON t_co.compilation_id = t.compilation_id
WHERE co.track_id > 19
GROUP BY co.name;

--8.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT e.name, duration FROM executor e
JOIN executor_album ge ON e.executor_id= ge.executor_id
JOIN album a ON ge.album_id = a.album_id
JOIN album_track ta ON a.album_id = ta.album_id
JOIN track t ON t.album_id = ta.album_id
WHERE duration = (SELECT MIN(duration) FROM Track)
GROUP BY e.name, duration;

--9.Названия альбомов, содержащих наименьшее количество треков.
SELECT name, COUNT(track_id) tm FROM album a
JOIN album_track ta ON a.album_id = ta.album_id
GROUP BY a.name
ORDER BY tm; 
HAVING tm = MIN(SELECT tm FROM track);
