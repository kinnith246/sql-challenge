# sql-challenge
### Challenge 9 - SQL Challenge


Repo contains the ERD diagram, SQL query for creating tables/schemas and SQL query for the data analysis (questions required)

During the creation of the tables and importing the data I found there was an issue with the date formatting in the csv files where SQL was unable to read some values because the dates were in the wrong order (YYYY/MM/DD) so I needed to create a staging table and hold the dates as a text format then convert into the right date format that SQL could read (into MM/DD/YYYY format).
