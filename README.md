# Netflix-Movies-and-Shows-SQL![64c094dfadb3a3e2ba7ad1b86afe04d8](https://github.com/user-attachments/assets/18d79b3b-fb60-4077-9ccc-46fc314b5f27)
## 🧰Tools Used: 
Excel, Microsoft SQL Server (SSMS)
[Datasets Used](https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies?select=titles.csv)
## 📌 Problem Definition
Digital streaming platforms generate massive volumes of data in order to evaluate the performance of their content and strategically expand their libraries. For a global platform like Netflix, failing to analyze this data effectively can lead to inaccurate assessments of content quality, overlooked audience preferences, and inefficient investment decisions.

Data such as ratings, genres, release years, number of seasons, and cast information for movies and TV shows are inherently multi-dimensional. On their own, these attributes provide limited insight. The real challenge lies in integrating multiple data sources to produce comprehensive, comparable, and meaningful insights about the overall content ecosystem.

---

## 🛠️ Analytical Strategy
The goal of this project is to examine Netflix’s content library from a data-driven perspective and build an analytical framework to evaluate content performance. To achieve this, SQL is used to systematically query movie and TV show data, establish relationships between tables, and derive summary metrics through analytical queries.

## 🔍 Analytical Questions Explored in This Project

### 1. Which movies and TV shows rank among the top 10 and bottom 10 based on their IMDb ratings?

#### 🎬 Top 10 Movies
```sql
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score >= 8.0 
AND type = 'MOVIE'
ORDER BY imdb_score DESC;
```
<img width="460" height="226" alt="Ekran görüntüsü 2025-12-23 101216" src="https://github.com/user-attachments/assets/f10bbead-17b0-4d1f-b940-105df8fbae27" />

#### 🎬 Top 10 Shows
```sql
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score >= 8.0 
AND type = 'SHOW'
ORDER BY imdb_score DESC;
```
<img width="377" height="226" alt="Ekran görüntüsü 2025-12-23 101604" src="https://github.com/user-attachments/assets/e1af429e-4817-4747-90ce-e318b182098c" />

#### 🎬 Bottom 10 Movies
```sql
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score IS NOT NULL 
AND type = 'MOVIE'
ORDER BY imdb_score ASC;
```
<img width="424" height="230" alt="Ekran görüntüsü 2025-12-23 101853" src="https://github.com/user-attachments/assets/a5582353-0dab-4321-863d-1c0561e8d36b" />

#### 🎬 Bottom 10 Shows
```sql
SELECT TOP 10 title,type, imdb_score from titles
WHERE imdb_score IS NOT NULL 
AND type = 'SHOW'
ORDER BY imdb_score ASC
```
<img width="428" height="231" alt="Ekran görüntüsü 2025-12-23 102018" src="https://github.com/user-attachments/assets/5ad48568-c69d-4f38-9ebe-e27e4aa501e5" />

IMDb ratings are commonly used as an indicator of how audiences perceive the quality and overall appeal of movies and TV shows. In this analysis, the top 10 titles distinguish themselves through consistently high IMDb scores, suggesting strong viewer approval and widespread positive reception. These productions tend to reflect compelling storytelling, strong performances, and higher production standards, making them attractive choices for audiences seeking well-regarded content within the Netflix library.

Conversely, the bottom 10 movies and TV shows exhibit noticeably lower IMDb ratings, indicating weaker audience reception. Such outcomes may result from a variety of factors, including narrative limitations, inconsistent acting, or production quality issues. However, audience ratings are inherently subjective, and individual taste can significantly influence these scores.

By examining both the highest- and lowest-rated titles, this analysis provides a balanced view of content performance on Netflix. The findings help identify productions that resonate strongly with viewers, as well as those that may benefit from further evaluation or improvement. These insights can support content discovery for viewers and inform data-driven strategies for enhancing recommendation systems and future content development.

### 2.Which genres are the most common on Netflix?
#### 🎬 Most Common Movie Genres
```sql
SELECT TOP 10 genres,
COUNT(*) AS title_count FROM titles
WHERE type = 'MOVIE'
GROUP BY genres
ORDER BY title_count DESC;
```
<img width="300" height="232" alt="Ekran görüntüsü 2025-12-23 102753" src="https://github.com/user-attachments/assets/1640be93-eee6-4a10-a999-a149fdf00c6e" />

#### 🎬 Most Common Shows Genres
```sql
SELECT TOP 10 genres,
COUNT(*)AS title_count FROM titles
WHERE type = 'Show'
GROUP BY genres
ORDER BY title_count DESC;
```
<img width="274" height="230" alt="Ekran görüntüsü 2025-12-23 102911" src="https://github.com/user-attachments/assets/c5831095-1177-4104-ae0d-42b386c46c89" />

#### 🎬 Top 3 most common genres OVERALL
```sql
SELECT TOP 3 t.genres, 
COUNT(*) AS genre_count 
FROM titles t
WHERE t.type = 'MOVIE' or t.type = 'SHOW'
GROUP BY t.genres
ORDER BY genre_count DESC;
```
<img width="359" height="99" alt="Ekran görüntüsü 2025-12-23 103649" src="https://github.com/user-attachments/assets/6b2ca18d-62f3-482d-894a-c9d6f44109f2" />


An examination of genre frequencies provides clear insight into the types of content that are most prevalent on Netflix and the viewing preferences reflected in its catalog. Focusing first on movies, the analysis of the top ten most frequent genres shows that Comedy dominates the platform with 384 titles, highlighting its broad and consistent appeal to audiences. This is followed by Documentary with 230 movies and Drama with 224 movies, underscoring the strong presence of both informative and narrative-driven content within Netflix’s film library.

Genre combinations play a notable role in the movie dataset. Categories such as Comedy–Documentary and Comedy–Drama rank prominently, demonstrating Netflix’s tendency to offer hybrid content that appeals to multiple audience interests simultaneously. Additional combinations including Drama–Romance, Drama–Comedy, and Comedy–Romance further indicate a clear preference for films that blend emotional storytelling with entertainment value. These results emphasize both the diversity of Netflix’s movie offerings and the platform’s strategic focus on cross-genre productions.

Turning to TV shows, the genre distribution presents a slightly different pattern. Reality emerges as the most frequent category with 113 titles, reflecting strong viewer engagement with unscripted and lifestyle-based content. Drama follows closely with 104 shows, while Comedy and Documentary each account for 100 titles, illustrating a balanced mix of entertainment, storytelling, and informational programming. As observed in the movie analysis, genre combinations such as Comedy–Drama and Drama–Romance also appear among the most common, reinforcing the popularity of multi-genre formats in serialized content.

When movies and TV shows are analyzed together, the overall results confirm Comedy as the most dominant genre on Netflix with 484 total entries. Documentary ranks second with 329 titles, highlighting sustained audience interest in factual and educational content, while Drama closely follows with 328 entries. Collectively, these findings demonstrate that Netflix’s content library is strongly centered around a core set of genres, while still maintaining variety through genre blending to accommodate diverse viewer preferences.




