	use mydb;
    create table student(
    id int primary Key,
    name varchar(50),
    marks int,
    city varchar(20));
    
    select * from student;
    insert into student(id,name,marks,city)values(11,"sam",85,"chennai");
    insert into student values(3,"virat",91,"delhi"),(4,"musk",86,"mumbai");
    INSERT INTO student (id, name, marks, city) VALUES
(5, 'Rahul', 85, 'Mumbai'),
(6, 'Anjali', 92, 'Delhi'),
(7, 'Suresh', 89, 'Chennai'),
(8, 'Rohit', 87, 'Mumbai'),
(9, 'Priya', 88, 'Chennai');-- inserting multiple values


select max(marks) from student where city="delhi";
select avg(marks) from student;-- using avg function
select avg(marks) from student where city="mumbai";
select name from student where city="mumbai" group by name;
select * from student where marks>90 and city="mumbai";
select * from student where city=(select city from student where id=9);
select * from student where marks between 80 and 90;
select * from student where id in(2,4,6,8,10);
select * from student where id%2=0;-- retrive all user with even id number
select * from student where id%2!=0 and city="mumbai";-- retrive all users where id is not even and came from mumbai

select city from student group by city having avg(marks)>90;
-- group by
select count(id),city from student group by city;
-- group by having
select city,count(id) from student group by city having max(marks)>90;
select city,count(id) from student group by city having max(marks)>80;
select city,count(id) from student group by city having count(id)%2=0;

-- noof students in each city by even digit id's
select city,count(*) as noofstudents from student where id%2=0 group by city;
select city,count(*)as noofstudents from student where marks>90 group by city;
-- highest marks in each city
select city,max(marks) from student group by city;

select * from student where city is null;
select * from student where marks between 80 and 90;
-- show top fifteen students 
select * from student order by marks desc limit 5;
-- offset 1 means first row of the result wont be come 
-- to retrive the second or third or nth highest or lowest data
select * from student order by marks desc limit 1 offset 1;

select * from student where name like 'gupta';
select count(*) as numbero from student where name='gupta';

-- difference b/w noof city entries and distinct city entries
select (select count(*) from student)-(select count(DISTINCT city) from student);
-- diff b/w length of longest name city and smallest name city
(select city,length(city) from student order by length(city) DESC limit 1)
union 
(select city,length(city) from student order by length(city) limit 1);

select city,char_length(city) from student;


-- hacker solution for city,city length from station and first and last city if two small exist or large then output will come by name alphabets
select CITY,char_length(CITY) from STATION order by length(CITY),CITY limit 1;
select CITY,char_length(CITY) from STATION order by length(CITY) DESC ,CITY limit 1;

-- select city satrts with vowels using like clause
select DISTINCT(city) from student where city like 'd%' or city like'm%' or city like 'c%';
-- select city starts with vowel using regexp
select distinct city from student where city regexp '^[a,e,i,o,u,d,c]';

select distinct city from student where city regexp '[a,e,i,o,u,d,c]$';
-- retrive cities which starts with vowel and ends with vowel
select distinct city from student where city REGEXP '^[a,e,i,o,u]' and city regexp '[a,e,i,o,u]$';
-- retrive citites  which starts with vowels and does not end with vowel
select distinct city from student where city regexp '^[aeiou]' and city not regexp '[aeiou]$';
-- retrive cities with not starting with vowels and ending with vowels
select distinct city from student where city not regexp '^[aeiou]' and city regexp '[aeiou]$';
-- select cities which not starting and ending with vowels
select distinct city from student where city not regexp '^[aeiou]' and city not regexp '[aeiou]$';
/*retrives citites if it is not started with vowel or it is not ending with vowel so that
 citites w hich have not vowels at strating nad not vowels at ending and cities satifies bot*/
select distinct city from student where city not regexp '^[aeiou]' or city not regexp '[aeiou]$';

-- select distinct city from station where city not like 'a%' and not like 'e%' and not like 'i%' and not like 'o%' and not like 'u%';
select distinct city from station where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%';

select * from student order by marks desc, city;
insert into student values(12,"rohit",89,"delhi");
-- retriving the last three names of the name as substring
select substr(name,-3,3) from student;
-- order by substring and id
select name from student where marks>75 order by substr(name,-3,3),id;
select * from student where city = "mumbai" order by substr(name,3,1) ;
-- round function round(query,4(noof digit after point))
select round(max(marks)-min(marks),4) from student;

select name,round(marks,6) from student;
select name from student where marks>(select avg(marks)/4 from student);

select name from student where marks=(select max(marks) from student);

use mydb;
select * from user;

select email from user where email like '%gmail.com';
select * from student;

select city,count(*) as noofstudents from student group by city;