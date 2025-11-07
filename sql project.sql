use Netflix1

CREATE TABLE Genre_Details (
    GenreID VARCHAR(10) PRIMARY KEY,
    Genre VARCHAR(50) NOT NULL
);

INSERT INTO Genre_Details (GenreID, Genre) VALUES
('G1', 'Documentary'),
('G2', 'Thriller'),
('G3', 'Science Fiction'),
('G4', 'Mystery'),
('G5', 'Action'),
('G6', 'Comedy'),
('G7', 'Drama'),
('G8', 'Musical'),
('G9', 'Horror'),
('G10', 'Romance'),
('G11', 'Anime'),
('G12', 'Supernatural'),
('G13', 'Interviews'),
('G14', 'Historical'),
('G15', 'Biopic'),
('G16', 'Concert Film'),
('G17', 'Rom-Com'),
('G18', 'Variety Show'),
('G19', 'Satire');

CREATE TABLE Netflix_Originals (
    Title VARCHAR(255),
    GenreID VARCHAR(10),
    Runtime FLOAT,
    IMDBScore FLOAT,
    Language VARCHAR(50),
    Premiere_Date VARCHAR(20)
);

--- 1. Average IMDb scores for each genre
SELECT gd.Genre, AVG(no.IMDBScore) AS Avg_IMDB
FROM Netflix_Originals no
JOIN Genre_Details gd ON no.GenreID = gd.GenreID
GROUP BY gd.Genre;

--- 2. Genres with average IMDb score higher than 7.5
SELECT gd.Genre, AVG(no.IMDBScore) AS Avg_IMDB
FROM Netflix_Originals no
JOIN Genre_Details gd ON no.GenreID = gd.GenreID
GROUP BY gd.Genre
HAVING AVG(no.IMDBScore) > 7.5;

--- 3. Titles in descending order of IMDb scores
SELECT Title, IMDBScore
FROM Netflix_Originals
ORDER BY IMDBScore DESC;

--- 4. Top 10 longest Netflix Originals by runtim
SELECT top 10 Title, Runtime
FROM Netflix_Originals
ORDER BY Runtime DESC

--- 5. Titles with their respective genres
SELECT no.Title, gd.Genre
FROM Netflix_Originals no
JOIN Genre_Details gd ON no.GenreID = gd.GenreID;

--- 6. Rank Netflix Originals by IMDb score within each genre
SELECT Title, GenreID, IMDBScore,
RANK() OVER (PARTITION BY GenreID ORDER BY IMDBScore DESC) AS Rank_in_Genre
FROM Netflix_Originals;

--- 7. Titles with IMDb scores higher than the average
SELECT Title, IMDBScore
FROM Netflix_Originals
WHERE IMDBScore > (SELECT AVG(IMDBScore) FROM Netflix_Originals);

--- 8. Count of Netflix Originals per genre
SELECT GenreID, COUNT(*) AS Total_Titles
FROM Netflix_Originals
GROUP BY GenreID;

--- 9. Genres with more than 5 titles having IMDb > 8
SELECT GenreID, COUNT(*) AS High_Rated_Count
FROM Netflix_Originals
WHERE IMDBScore > 8
GROUP BY GenreID
HAVING COUNT(*) > 5;

--- 10. Top 3 genres with highest average IMDb scores and their counts
SELECT top 3 gd.Genre, AVG(no.IMDBScore) AS Avg_IMDB, COUNT(*) AS Title_Count
FROM Netflix_Originals no
JOIN Genre_Details gd ON no.GenreID = gd.GenreID
GROUP BY gd.Genre
ORDER BY Avg_IMDB DESC