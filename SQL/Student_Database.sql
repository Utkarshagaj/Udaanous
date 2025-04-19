use student_course;
select `Course ID`,`Course Name`
from courses_data;
select distinct `Course Level`
from courses_data;
show tables;
select * from courses_data;
select Semester as Sem
from enrollments_data;
select `Enrollment ID` as E_Id
from enrollments_data;
select * from enrollments_data;
select `Student ID`,Grade
from enrollments_data
where grade in ('A', 'B','C','D');
select `Student ID`,Grade
from enrollments_data
where grade between 'A' and 'D';
select `First Name`, `Last Name`, Age, GPA
from student_information where Age >= 22 or GPA >=3.5;
select `First Name`, `Last Name`
from student_information where `First Name` like 'j%' and `Last Name` like '%s';
select `First Name`, Department, Year, GPA
from student_information where not GPA <= 2;

select * from student_information;

drop tables data_,department_data, employiess_data, employiess_data_;

select t1.`Course Name`, t2.Semester, t3.`First Name`
from courses_data as t1, enrollments_data as t2, student_information as t3;

create index course
on courses_data (`Course ID`);
create index course1
on courses_data (`Course Name`(20));
drop index course1 on courses_data;
create unique index enroll_id
on enrollments_data (`Enrollment ID`);

-- Important String Functions --
select lower("HELLO WORLD!!!");
select upper("hello world!!!");
select trim("HELLO WORLD!!!");
select char_length("Hello World!!!") as LengthofString;
select replace("Hello World!!!", "World", "Guys");
select concat("Hello"," ", "World") as ConcatenatedString;

select lower(`First Name`) as LcaseFirstName from student_information;
select upper(`First Name`) as LcaseFirstName from student_information;
select char_length(`First Name`) as LengthOfString from student_information;
select concat(`First Name`," ", `Last Name`," ", Department) as NewColumn from student_information;

-- Arithmetic Functions --
select min(GPA) from student_information;
select max(GPA) from student_information;
select avg(GPA) from student_information;
select sum(GPA) from student_information;
select count(GPA) from student_information;
select abs(-7) as result;
select abs(GPA) from student_information;
select 8 div 4 as result;
select GPA div 2 from student_information as result;
select power(GPA, 3) from student_information;
select round(power(GPA, 3), 2) from student_information;
select sqrt(GPA) from student_information;

-- Grouping and Sorting Data --
select * from  student_information order by GPA asc;
select `Course Name` from courses_data order by Credits desc;
select * from  student_inmation order by GPA desc limit 5;
select count(*) from enrollments_data group by `Course ID`;
select sum(Credits) from courses_data group by `Course Level`;
select avg(Credits) from courses_data group by `Course Level`;
select round(avg(Credits)) from courses_data group by `Course Level`;
select sum(Credits) from courses_data group by `Course Level`;

-- Joins for Data Retrieval --
select * from student_information s
inner join enrollments_data e on s.`Student ID` = e.`Student ID`;
select `First Name`,`Last Name`, Age, Gender, Semester, Grade from student_information s
inner join enrollments_data e on s.`Student ID` = e.`Student ID`;

select `First Name`,`Last Name`, Semester, Grade from student_information s
cross join enrollments_data e on s.`Student ID` = e.`Student ID`;
select c.`Course ID`,c.`Course Name`,c.`Course Level`,e.Semester, e.Grade from courses_data c
cross join enrollments_data e on c.`Course ID` = e.`Course ID`;
select `Course Name`,`Course Level`,Semester, Grade from courses_data c
join enrollments_data e on c.`Course ID` = e.`Course ID`;

select * from enrollments_data e
left join courses_data c on e.`Course ID` = c.`Course ID`;
select `First Name`,`Last Name`,Gender from enrollments_data e
left join student_information s on e.`Student ID` = s.`Student ID`; 

select * from enrollments_data e
right join courses_data c on e.`Course ID` = c.`Course ID`;
select `First Name`,`Last Name`,Gender from enrollments_data e
right join student_information s on e.`Student ID` = s.`Student ID`;



