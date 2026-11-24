-- DATA ANALYTICS WITH SQL-- 
-- TASK_1--

#1_ Database Setup
# CREATING STUDENT DATABASE
create database student_management;

#CREATE TABLE DATA(Student_ID,NAME,GENDER,AGE,GRADE,SCORES
create table students
(Student_id int primary key auto_increment,
Name varchar(30), Gender char(10), Age int, Grade varchar(10),
MathScore int, ScienceScore int, EnglishScore int);

#table structure
describe students;

#2_insert data -- Student_id is in auto_increment---
Insert into Students
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) 
Values
('Arun', 'Male', 18, 'A', 85, 90, 88),
('Priya', 'Female', 17, 'A+', 95, 92, 96),
('Karthik', 'Male', 19, 'B', 72, 78, 75),
('Divya', 'Female', 18, 'A', 88, 85, 91),
('Rahul', 'Male', 17, 'C', 55, 62, 58),
('Sneha', 'Female', 19, 'B+', 80, 82, 79),
('Vijay', 'Male', 18, 'A+', 96, 94, 92),
('Anitha', 'Female', 17, 'B', 75, 70, 78),
('Suresh', 'Male', 20, 'C+', 65, 68, 60),
('Meena', 'Female', 18, 'A', 89, 91, 87);

#3_SQL Queries
-- 1_Show all data
select * from Students;

-- 2_AVG score in each subject
select avg(MathScore) as Maths,
avg(ScienceScore)as Science,
avg(EnglishScore)as English from Students;

-- 3_Top Performance(Highest Score)
select
    (select Name from Students order by MathScore DESC LIMIT 1) as Maths_Topper,
    (select MAX(MathScore) from Students) as Math_Highscore,
    (select Name from Students order by ScienceScore DESC LIMIT 1) as Science_Topper,
    (select MAX(ScienceScore) from Students) as Science_Highscore,
    (select Name from Students order by EnglishScore DESC LIMIT 1) as English_Topper,
    (select MAX(EnglishScore) from Students) as English_Highscore;
    
-- 3_Count students per Grade
select Grade,count(Student_id) as Total_Student 
from Students
group by Grade
order by Grade;

-- 4_Average Score by Gender
select Gender, avg(MathScore) as Maths,
avg(ScienceScore)as Science,
avg(EnglishScore)as English from Students
group by Gender;

-- 5_students Score > 85
#In Maths
select Name, MathScore from Students
where MathScore > 85;

#In Science
select Name,ScienceScore from Students
where ScienceScore > 85;

#In English
select Name, EnglishScore from Students
where EnglishScore > 85;

#For all 3 Subjects
select Name, MathScore, ScienceScore, EnglishScore  from Students
where MathScore > 85 and
ScienceScore > 85 and
EnglishScore > 85;

-- 6_update Student Grade
update Students
set Grade = "A+"
where Student_id = 4;



