-- 1. Query all of the entries in the Genre table
 --SELECT id,
	--   Label
 --FROM Genre;

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist(ArtistName, YearEstablished) VALUES ('Lizzo', 2010)

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, GenreId, ArtistId) VALUES ('Cuz I Love You', 2019, 33, 'Atlantic', 6, 29)

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.
--INSERT INTO Song(Title, AlbumId, ArtistId, ReleaseDate, SongLength, GenreId) VALUES ('Truth Hurts', 24, 29, 2019, 3, 6)
--INSERT INTO Song(Title, AlbumId, ArtistId, ReleaseDate, SongLength, GenreId) VALUES ('Juice', 24, 29, 2019, 3, 6)

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--SELECT s.Title, 
--	   al.Title,
--	   ar.ArtistName
--FROM Song s
--	LEFT JOIN Album al on s.AlbumId = al.Id
--	LEFT JOIN Artist ar on s.ArtistId = ar.Id
--WHERE ArtistName = 'Lizzo' and al.Title = 'Cuz I Love You'

-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--SELECT COUNT(s.Title) NumberOfSongs,
--       a.Title
--FROM Song s
--	LEFT JOIN Album a on s.AlbumId = a.Id
--GROUP BY a.Title

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--SELECT COUNT(s.Title) NumberOfSongs,
--       a.ArtistName
--FROM Song s
--	LEFT JOIN Artist a on s.ArtistId = a.Id
--GROUP BY a.ArtistName

-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function 
-- and the GROUP BY keyword sequence.
--SELECT COUNT(s.Title) NumberOfSongs,
--       g.Label
--FROM Song s
--	LEFT JOIN Genre g on s.GenreId = g.Id
--GROUP BY g.Label

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should 
-- display the album title and the duration.
--SELECT Title,
--	AlbumLength
--FROM Album
--WHERE AlbumLength IN (SELECT MAX(AlbumLength)
--FROM Album)

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. 
-- The result should display the song title and the duration.
--SELECT Title,
--	SongLength
--FROM Song
--WHERE SongLength IN (SELECT MAX(SongLength)
--FROM Song)

-- 11. Modify the previous query to also display the title of the album.
SELECT s.Title,
	s.SongLength,
	a.Title
FROM Song s
	LEFT JOIN Album a on s.AlbumId = a.Id
WHERE s.SongLength IN (SELECT MAX(s.SongLength)
FROM Song s)
