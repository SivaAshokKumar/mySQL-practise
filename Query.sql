/*create database logicfirst;
drop database logicfirst;
create schema logicfirstvertwo;
drop schema if exists logicfirstvertwo; */
use logicfirst;
show tables;
create table student(
     id int primary key,
     name varchar(30),
     gpa decimal(3,2)
     );
	describe student;
    
    alter table student add department varchar(20);
    alter table student drop name;
    alter table student add column name varchar(100);
    describe student;
    
    insert into student values(1,7.6,"CSE","Ravi");
    insert into student values(2,5.6,"IT","Ravi");
    insert into student values(3,1.6,"EEE","Ravi");
    insert into student values(4,4,"ECE","Sundar");
    insert into student values(5,4.6,"CSE-AI&ML","Ravi");
    insert into student values(6,2,"MBA","Tyagu"),(7,5,"BBA","Kumar"),(8,3,"BCA","Ravi Kumar"),(9,5,"MCA","Vadivelu");   
    
    insert into student (id,name) values(10,"Raj");
    insert into student (id,dob) values(11,'2002-12-06'); 
    insert into student (id,dob) values(12,'1989-12-06'); 
    insert into student (id,name,dob) values(13,"Rajesh",'1989-12-06'); 
    insert into student (id,name,dob,gpa,department) values(14,"Rajesh KUmar",'1989-11-11',4,"B.sc"); 
    /*insert into student (id,name) values (11,"Raghu"),(12,"Akhil");*/
    alter table student add column dob date;
    select * from student;
    select id,name from student;
 /*   create table siva (primary key int(20) id, varchar(30) lastname); /*
 */
 create table employeee(
           emp_id int primary key,
           ename varchar(100),
           job_desc varchar(20),
           salary int
 );
 describe employeee;
 insert into employeee values(1,"Ram","ADMIN",1000000),(2,"Harini","MANAGER",2500000),(3,"George","SALES",2000000),(4,"Ramya","SALES",1300000),(5,"Meena","HR",2000000),(6,"Ashok","MANAGER",3000000),(7,"Abdul","HR",2000000),(8,"Ramya","ENGINEER",1000000),(9,"Raghul","CEO",8000000),(10,"Arvind","MANAGER",2800000),(11,"Akshay","ENGINEER",1000000),(12,"John","ADMIN",2200000),(13,"Abinaya","ENGINEER",2100000);
select emp_id, ename from employeee where ename = "Ramya";
 select * from employeee;
 /* WHERE USING TWO CONDITION */ 
 select * from employeee
  where salary < 2600000 and job_desc="Manager"; 
  select * from employeee where job_desc = "hr" or job_desc = "sales" or job_desc = "engineer";
  select * from employeee where job_desc NOT in ("hr","ceo");
  select emp_id,ename,job_desc from employeee where job_desc NOT in ("hr","ceo");
  /* select * from employeee where job_desc between 2000 ; */
  select * from employeee where salary between 2000000 and 3000000;
  select * from employeee where job_desc("HR","CEO","ADMIN") limit 10;
  select * from employeee where ename not like 'A%';
  select * from employeee where ename  like '%i%';
  select * from employeee where ename  like '__i  %';
  
  Update employeee set job_desc = "Analyst" where job_desc= "Engineer";
  select * from employeee;
  
  -- ORDER BY 
  
  select  * from employeee 
  Order by ename;
  select  * from employeee 
  Order by salary,ename desc;
  
  -- CUSTOM ORDERING
  
  select * 
  from employeee
  order by (case job_desc 
  when 'CEO' then 1
  when 'Manager' then 2
  when 'Analyst ' then 3
  when 'HR' then 4
  when 'salEs' then 5
  else 10 end
  ),ename;
  
  
  insert into employeee  values (12,"Muthukumar","Trainer",5000000);
  delete from employeee where emp_id = 12;
  
  -- FUNCTIONS TO PERFORM SPECIFIC TASK
  
  select count(*) total from employeee; 
  
  select count(*) no_of_managers from employeee where job_desc = "Manager";
  
  select sum(salary) Total_of_SAlary from employeee where job_desc = "Analyst";

  select max(salary) Max_of_SAlary from employeee;
  
  select min(salary) Min_of_SAlary from employeee;
  
  select avg(salary) Average_of_SAlary from employeee where job_desc = "Analyst"; 
  
  select ucase(ename) name,salary
 from employeee;  
 
 select ename,char_length(ename) char_count_name From employeee;
 
 select ename, concat('RS',format(salary,0)) from employeee;
 
 select ename, left(job_desc,2) from employeee;
 
 -- DATE FUNCTION
 
 alter table employeee add column hire_date date;
  update employeee set hire_date = "1997-05-22";
  update employeee set hire_date = "1997-05-2" where ename = "Ramya";
  select * from employeee;

 -- select distinct ename from employeee; 
   select now();
   select curdate()  TOday;
   select date_format(curdate(),"%d/%m/%y") date;
  /* SELECT CURDATE() 'start date',
 DATE_ADD(CURDATE(),INTERVAL 1 DAY) 'one day later',
 DATE_ADD(CURDATE(),INTERVAL 1 WEEK) 'one week later',
 DATE_ADD(CURDATE(),INTERVAL 1 MONTH) 'one month later',x
 DATE_ADD(CURDATE(),INTERVAL 1 YEAR) 'one year later';*/
 select curdate() 'start date',
 date_add(curdate(),interval 1 day) 'one day later',
 date_add(curdate(),interval 1 week) 'One wee',
 date_add(curdate(),interval 1 month) 'One month',
 date_add(curdate(),interval 1 year) 'One year';
 
 -- Group by
 select * from employeee;
  select job_desc,count(emp_id) from employeee group by job_desc;
-- select ename,count(hire_date) from employeee group by hire_date;
select lcase(job_desc),max(salary) from employeee group by job_desc;
select job_desc,count(emp_id) from employeee group by job_desc having count(emp_id) > 1;

-- where for fileters
-- group for ordering and filters 
--  Insert the values in 

create table employe4(
emp_id INT primary key,
ename varchar(10),
job_desc varchar(10),
salary int
);
use logicfirst;
create table empC(
emp_id INT primary key,
ename varchar(80),
job_desc varchar(50),
salary int
);
select * from empc;
alter table empc 
modify ename varchar(50) not null;
alter table empc
modify ename varchar(30);
-- drop table empc;
 -- dafault 
  alter table empc alter job_desc set default 'Unassigned';
  
  
  -- FOREIGN KEY  IT IS USED TO CONNECT TWO TABLES --
  
  use logicfirst;
CREATE TABLE Branch(
 branch_id int primary key auto_increment,
 br_name varchar(20) not null,
 address varchar(400));
 --  insert into employeee values(1,"Ram","ADMIN",1000000),(2,"Harini","MANAGER",2500000),(3,"George","SALES",2000000),(4,"Ramya","SALES",1300000),(5,"Meena","HR",2000000),(6,"Ashok","MANAGER",3000000),(7,"Abdul","HR",2000000),(8,"Ramya","ENGINEER",1000000),(9,"Raghul","CEO",8000000),(10,"Arvind","MANAGER",2800000),(11,"Akshay","ENGINEER",1000000),(12,"John","ADMIN",2200000),(13,"Abinaya","ENGINEER",2100000);
 use logicfirst;
 insert into branch values(1,"Adyar","Car str"),(2,"TBM","TBME MEtro"),(3,"CGL","CGL Bustand");
 select lcase(address)  from branch;
 select * from branch;
 use logicfirst;
 create table employ ( 
 emp_id int primary key auto_increment,
 ename varchar(40) not null,
 job_desc varchar (20),
 salary int,
 branch_id Int,
 Constraint BID_FK foreign key(branch_id) references branch(branch_id));
 insert into employ values(1,"Ram","ADMIN",1000000,3),(2,"Harini","MANAGER",2500000,1),
 (3,"George","SALES",2000000,1),(4,"Ramya","SALES",1300000,2),
 (5,"Meena","HR",2000000,2),(6,"Ashok","MANAGER",3000000,1),(7,"Abdul","HR",2000000,3),
 (8,"Ramya","ENGINEER",1000000,1),(9,"Raghul","CEO",8000000,2),
 (10,"Arvind","MANAGER",2800000,3),(11,"Akshay","ENGINEER",1000000,3),
 (12,"John","ADMIN",2200000,2),(13,"Abinaya","ENGINEER",2100000,1);
 select * from employ;
 
 -- );
 select * from employ;
 use logicfirst;
  create table employ1D ( 
 emp_id int primary key auto_increment,
 ename varchar(40) not null,
 job_desc varchar (20),
 salary int,
 branch_id Int,
 Constraint BIFK foreign key(branch_id) references branch(branch_id)
 on delete set null);
 insert into employ1D values(1,"Ram","ADMIN",1000000,3),(2,"Harini","MANAGER",2500000,1),
 (3,"George","SALES",2000000,1),(4,"Ramya","SALES",1300000,2),
 (5,"Meena","HR",2000000,2),(6,"Ashok","MANAGER",3000000,1),(7,"Abdul","HR",2000000,3),
 (8,"Ramya","ENGINEER",1000000,1),(9,"Raghul","CEO",8000000,2),
 (10,"Arvind","MANAGER",2800000,3),(11,"Akshay","ENGINEER",1000000,3),
 (12,"John","ADMIN",2200000,2),(13,"Abinaya","ENGINEER",2100000,1);
  
  delete from branch where brname = "TBM";
  create database joins;
  use joins;
  CREATE TABLE branch (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(30) NOT NULL,
addr VARCHAR(200) );
use logicfirst;
CREATE TABLE employee (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(30) NOT NULL,
job_desc VARCHAR(20),
salary INT,
branch_id INT,
CONSTRAINT FK_branchId FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

INSERT INTO branch VALUES(1,"Chennai","16 ABC Road");
INSERT INTO branch VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO branch VALUES(3,"Mumbai","25 XYZ Road");
INSERT INTO branch VALUES(4,"Hydrabad","32 10th Street");

INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000,2);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000,2);
INSERT INTO employee VALUES(3,'George','SALES',2000000,1);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000,2);
INSERT INTO employee VALUES(5,'Meena','HR',2000000,3);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000,1);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000,1);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000,2);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000,3);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000,3);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000,1);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000,1);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000,2);
INSERT INTO employee VALUES(14,'Vidya','ADMIN',2200000,NULL);
INSERT INTO employee VALUES(15,'Ranjani','ENGINEER',2100000,NULL);
use joins;
select * from branch;
select * from employee;
-- like
select * from employee where ename like  "%n%"; 
 -- INNER JOIN 
 select employee.emp_id,employee.ename,employee.job_desc,branch.br_name 
 from employee join branch 
 on employee.branch_id= branch.branch_id order by employee.emp_id;
 -- LEFT JOIN
 select employee.emp_id,employee.ename,employee.job_desc,branch.br_name 
 from employee left join branch 
 on employee.branch_id= branch.branch_id order by employee.emp_id;
 -- RIGHT JOIN 
 select employee.emp_id,employee.ename,employee.job_desc,branch.br_name 
 from employee right join branch 
 on employee.branch_id= branch.branch_id order by employee.emp_id;
 
 -- DISPLAYING THE OTHER VARIABLES IN THE JOIN USING WHERE CLASS
 
 select employee.emp_id,employee.ename,employee.job_desc,branch.br_name,branch.addr from employee,branch
 where employee.branch_id=branch.branch_id;
 select * from employee;
 select * from branch as b;
 
 select b.br_name, count(e.emp_id) from branch as b join employee as e
 on b.branch_id = e.branch_id group by e.branch_id;
 
 use logicfirst;
 create table u1( client_id int primary key auto_increment,b int, c varchar(200));
 insert into u1 values(1,2,"A"),(2,3,"B"),(3,4,"A");
 select * from u1;
 select * from branch UNIOn select * from u1;
 
  -- SUBQUERRIES
  use logicfirst; 
  select * from employee 
  where branch_id = (select branch_id from branch where br_name = "CGL");
  
  -- minimum salary
  
  select * from employee where salary = (SELECT min(salary) from employee); 
  
  -- EXISITS USED WITH SUB QUERY
  
  use joins;
  select * from branch;
  select * from employee;   
  use joins;
  select branch_id,br_name from branch where exists ( select *  from employee where job_desc = "ADMIN" and branch.branch_id=employee.branch_id);
  
  -- any 
  -- branch info in which any employee gets more than 25 Lack
  
  select * from branch where branch_id =any(
  select branch_id from employee
  where salary>2500000);
  
  -- all "ALL Should satisy" -- <> NOT SYMBOL IN MYSQL
  -- we are making query to employees not working in chenani or coimbatore
  
  select * from employee where branch_id <> ALL(
  select branch_id from branch where br_name in ("Chennai","Coimbatore"));
  
  -- VIEWS 
  
  create view emp_br as
  select employee.emp_id,employee.ename,employee.job_desc,branch.br_name 
 from employee join branch 
 on employee.branch_id= branch.branch_id order by employee.emp_id;
 
 select * from emp_br; 
 select * from emp_br where job_desc = "ADMIN";
 
 create or replace view emp_br as select* from branch;
 select * from emp_br;
