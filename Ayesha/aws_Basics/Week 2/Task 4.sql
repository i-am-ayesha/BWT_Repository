Create table employee(
empno int not null ,
ename varchar (50) null,
salary numeric (7,2) null ,
deptno int null ,
status int  );

insert into employee values (101,'Ravi',5000,10,1),
(102,'Karishma',4000,20,1),
(103,'Mohan',6000,10,1),
(104,'Anand',3000,30,1);
---------------------

Create schema stg;
Create table stg.employee(
empno int not null ,
ename varchar (50) null,
salary numeric (7,2) null ,
deptno int null )

insert into stg.employee values (102,'Karishma',7000,20),
(105,'Parveen',4000,30),
(103,'Mohan',6000,20);

------------------------------------------
--step1 : -- Update existing records status with 0
Merge employee as target 
using stg.employee as source 
on target.empno = source.empno 
when matched and status =1 
then  update 
set status =0 ;

--Step2--insert whole data from source to destination with status 1 
insert into employee (empno,ename,salary,deptno,status)
select empno,ename,salary,deptno,1 from stg.employee;

------------------------------------------