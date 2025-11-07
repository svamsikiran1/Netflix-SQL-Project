# Netflix-SQL-Project
SQL project from Internshala analyzing Netflix Originals dataset using MySQL — exploring IMDb scores, genres, and runtime insights.

# 🎬 Netflix SQL Project — Data Analysis (Internshala)

This project is based on an **Internshala SQL assignment** analyzing Netflix Originals using **MySQL**.  
It focuses on exploring IMDb scores, genres, and runtime trends using SQL queries and database operations.

---

## 🧠 Objective
Analyze the **Netflix Originals** dataset to:
1. Find the average IMDb score per genre  
2. Identify genres with IMDb > 7.5  
3. List all titles by descending IMDb score  
4. Get the top 10 longest Netflix Originals  
5. Rank shows within each genre  
6. Retrieve shows with scores above the overall average  
7. Count total titles per genre  
8. Find genres with 5+ highly rated shows  
9. Display top 3 genres by IMDb score  

---

## 🗂️ Dataset Files
- **Netflix_Originals.xlsx** → Netflix Originals information (Title, Genre ID, Runtime, IMDb Score, Language, Premiere Date)
- **Genre_Details.xlsx** → Mapping of Genre IDs to their respective genres  
- **sql project.sql** → MySQL script containing schema creation and analysis queries  
- **SQL Final Project.pdf** → Project documentation with objectives and problem statements  

---

## 🛠️ How to Run in MySQL Workbench
1. Create and open a new database:
   ```sql
   CREATE DATABASE Netflix1;
   USE Netflix1;
