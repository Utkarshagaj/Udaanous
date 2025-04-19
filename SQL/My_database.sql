create database My_database;
use my_database;
alter database My_database
	character set = utf8mb4
    collate = utf8mb4_unicode_ci;
drop database my_database;
create table Utkarsha(
Id int,
Name varchar(20)
);
show tables;
alter table Utkarsha
modify Id int not null;
alter table utkarsha
add constraint unique_id unique (Id);
insert into utkarsha(Id, Name)
values(1, "UT");
select * from Utkarsha;
insert into utkarsha(Id, Name)
values(2, "Imu");
delete from utkarsha
where id=2;
truncate table utkarsha;
alter table utkarsha
add last_name varchar(20);
alter table utkarsha
change name first_name varchar(20);
alter table utkarsha
drop column last_name;
insert into utkarsha(Id, first_name)
values(1, "UT");
insert into utkarsha(Id, first_name)
values(2, "Imu");
insert into utkarsha(Id)
values(3);
alter table utkarsha
add last_name varchar(20);
update utkarsha
set first_name = "Jungkook", last_name = "Jeon"
where Id=3;
select last_name from Utkarsha
where last_name is null;
select last_name, id from Utkarsha
where last_name is null and id is null;
select last_name from Utkarsha
where last_name is not null;
select * from Utkarsha
where last_name is not null and id is not null;
alter table utkarsha
add constraint pk_Id primary key (Id);

select * from gajbhiye;
alter table gajbhiye
change idgajbhiye Id int not null;
alter table gajbhiye
add mobile_no int not null;
alter table gajbhiye
add email_id varchar(20);
insert into gajbhiye(Id, mobile_no, email_id)
values(1, 23456, 'xyz@gmail.com'), (2, 12345, 'abc@gmail.com'), (3, 34567, 'pqr@gmail.com'), (4, 56789, 'mno@gmail.com');
ALTER TABLE gajbhiye
RENAME COLUMN mobile_no TO phn_number;
RENAME table gajbhiye to jeon;

-- 15/04/2025 -- 
insert into drop_idx_tab (StudentID, StudentNames, Age)
value (1, 'Alex', 18),
	(2, 'Akash', 27),
    (3, 'Ramisha', 21);
create index idx_unique
on drop_idx_tab (StudentID);
drop index idx_unique on drop_idx_tab;

-- 16/04/2025 --
CREATE TABLE exam_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer
);
INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80),
('Alice', 'Smith',  75),
('Bob', 'Johnson',  78),
('Emily', 'Brown',  60),
('Michael', 'Davis', 86),
('Sarah', 'Wilson', 90),
('David', 'Lee', 75),
('Jessica', 'Taylor', 75),
('Chris', 'Evans',  55),
('Emma', 'Thompson',  67);
select * from exam_info;
alter table exam_info
add CubeScores int;
UPDATE exam_info
SET CubeScores = POWER(Scores, 3);

CREATE TABLE exam_info_2 (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores float
);
-- Insert 10 values for each variable
INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80.345544),
('Alice', 'Smith',  75.6355),
('Bob', 'Johnson',  78.5364565),
('Emily', 'Brown',  60.3565),
('Michael', 'Davis', 86.5353656),
('Sarah', 'Wilson', 90.535464),
('David', 'Lee', 75.567765),
('Jessica', 'Taylor', 75.34242),
('Chris', 'Evans',  55.09098),
('Emma', 'Thompson',  67.34535);
-- Write necessary code to round up the values of Scores column up to 2 decimal points. Store the output in RoundedScores.
select * from exam_info_2;
alter table exam_info_2
add RoundedScores float;
UPDATE exam_info_2
SET RoundedScores = round(Scores, 2);

-- 17/04/2025 --
-- Create the table
CREATE TABLE purchases (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
-- Insert values
INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');

select datediff(ReturnDate,PurchaseDate) from purchases;
select day(PurchaseDate) from purchases;
select month(PurchaseDate) from purchases;
select year(PurchaseDate) from purchases;
select date_format(ReturnDate, '%y-%M-%d') from purchases;

-- Write necessary code to format the dates in PurchaseDate column like this "24-January-1st". Store the output in FormatedDate.
select * from purchases;
alter table purchases
add FormatedDate varchar(50);
UPDATE purchases
SET FormatedDate = CONCAT(
    DATE_FORMAT(PurchaseDate, '%y-%M-'),
    CASE
        WHEN DAY(PurchaseDate) IN (1, 21, 31) THEN CONCAT(DAY(PurchaseDate), 'st')
        WHEN DAY(PurchaseDate) IN (2, 22) THEN CONCAT(DAY(PurchaseDate), 'nd')
        WHEN DAY(PurchaseDate) IN (3, 23) THEN CONCAT(DAY(PurchaseDate), 'rd')
        ELSE CONCAT(DAY(PurchaseDate), 'th')
    END)
    -- OR --
    
UPDATE purchases SET FormatedDate = date_format(PurchaseDate, '%y-%M-%D');   

-- Write necessary code to find the difference between PurchaseDate and ReturnDate columns. Store the output in DateDifference.
select * from purchases;
alter table purchases
add DateDifference varchar(50);
UPDATE purchases
SET DateDifference = datediff(ReturnDate,PurchaseDate);

-- Write necessary code to extract the years from the column ReturnDate. Store the output in YearsData.
select * from purchases;
alter table purchases
add YearsData varchar(50);
UPDATE purchases
SET YearsData = year(ReturnDate);


















