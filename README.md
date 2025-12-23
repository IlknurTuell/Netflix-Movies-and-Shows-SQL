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

<img width="460" height="226" alt="Ekran görüntüsü 2025-12-23 101216" src="https://github.com/user-attachments/assets/0543bc30-8d2b-43c9-b762-97a33390693e" />

