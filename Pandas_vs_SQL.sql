use all_movies;

-- renaming our table name 

alter table `imdb-top-1000` rename to imdb_top_1000;

-- selecting single column

select series_title from imdb_top_1000;

-- selecting multiple columns or all columns 

select * from imdb_top_1000;

-- filtering rows 

select * from imdb_top_1000 
where Released_Year > 2000;

-- filtering distinct rows

select distinct Genre from imdb_top_1000;

-- Sorting data(single columns ascendin order)

select Genre from imdb_top_1000
order by Genre;

-- Sorting data(two or multiple columns desc,asc order)

select Series_Title,Genre from imdb_top_1000
order by Series_Title desc,Genre asc;

-- grouping and aggregating
-- which actor have the highest gross?

select star1,sum(Gross) total from imdb_top_1000
group by star1
order by total desc;

-- find the top 5 combo of actor and director who have the highest gross?

select star1,director,sum(Gross) as total from imdb_top_1000
group by star1,Director
order by total desc;

-- Jioning table 

use employees_two;

-- inner join 

select * from employee_name e1
join employee_salary e2 on e2.ID = e1.ID;

-- right join 

select * from employee_name e1
right join  employee_salary e2 on e2.ID = e1.ID;

-- left join

select * from employee_name e1
left join  employee_salary e2 on e2.ID = e1.ID;

-- outer join or full outer join (outer join doesnt exist in mysql so have to perform as given below)

select * from employee_name e1
right join employee_salary e2 on e2.ID = e1.ID
UNION 
select * from employee_name e1
left join  employee_salary e2 on e2.ID = e1.ID;

-- cross join (Cartesian Product)

select * from employee_name
join employee_salary;

-- concat() to concat different table can use UNION ALL

select * from employee_name
UNION ALL
select * from employee_salary;

-- Pivot (mysql doesnt have pivot functionality instead will use case statement)
-- find the distribution of gross earning for each movies across different release years?

select released_year,
sum(case when gross between 0 and 1000000 then 1 else 0 END) as '0-1M',
sum(case when gross between 1000001 and 5000000 then 1 else 0 END) as '1-5M',
sum(case when gross between 5000001 and 10000000 then 1 else 0 END) as '5-10M',
sum(case when gross > 10000000 then 1 else 0 END) as 'Above 10M'
from 
(select released_year,gross from imdb_top_1000) as M
group by released_year
order by released_year desc;

-- Handling missing values

select No_of_Votes from imdb_top_1000
where No_of_Votes is null;

















