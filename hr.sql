-- This file is used to save all Oracle database commands in one file.

-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------SQL statement basic--------------------------------------------------------------------
-- SQL statements are not case sensitive.
-- SQL statements can be separtated in multiple lines.
-- keyword cannot be abbrevited or split.
-- The sql statements is termenated by semicolon";" or by forward slash "/", if we use the semicolon we could write in the 
--      same line of the statement, but when using th forward slash we have to write it in the new line.
-- To connect to sqlplus in the command termnail we use the next command 
--      sqlplus username/password.    or


-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Describe----------------------------------------------------------------
Describe employees;
desc employees;
/*
   * this command is used to describe the table. 
   * it's return the name of the columns and the data type of each column and if this column allow null value or not.
   * we could use this command by just use the "Desc + Table name" this is anther way to use it 
*/

/*
    * if you are using the Oracle sql developer app then you could get more information about a table by 
      write down the table name then select this name and then click "shift and f4".
    * by this way you colud get more informations.
    * it's also get the constranits and triggers.
*/

-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------Information--------------------------------------------------------

Information employees;
info employees;
Info+ employees;
/* 
   * the information command is used to get all informations about the selected table like the time of last analyzed
      , and the number of rows and the sample size and all informations that you need to know about the columns.
   * you have to know that this command used only in the Oracle sql developer app. 
   * also we could use info + table name to do the same.
   * the info+ command is used to get more informantion.
*/

------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------Select----------------------------------------------------------------------
select first_name, last_name from employees;
select * from employees;
/*
   * Select statement is used to retrieve data from the database.
   * The form of the select statement is    Select [column1name], [column2name],.......... from [tablename];
   * we could use the select statement to retrieve all data in the table by using astisk instead of using any columnsname.
         select * from [tablename];
    * in the first statement we will display the frist_name and the last_name from the employees table
    * the secand statement will display all data stored in the employees table. 
         "*" mean all date in the table.
    * it's bettter to select the needed columns, not all columns for better preformance.    
*/

-------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- Aliase name ----------------------------------------------------------------
select first_name name, last_name surname from employees;
select first_name as name, last_name as surnamr from employees;
/*
   * the column alise is used to rename the column heading in the command not in the metadate.
   * like in meny cases the name of the column or the name of the table is not descripitive enough and some time they are less
       readable and more difficult to understand, so we use aliase name to give the column temporary name.
    * the alise name is writen after the column name or the table name.
    * we could use the alise name directly after the column name or we could use "as" keyword to make the command more readalble.
*/
select first_name as "full name" from employees;
select email as "Employees * mail" from employees;
-- if the alise name has a space characters, special characters, or it is used to handling cas sensitivity then we have to put the 
--   alise name between double quotation.

-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Dual table------------------------------------------------------------------
select * from dual;
select 10 * 40 from dual;
select sysdate from dual;
select 'My name is Mahmoud Saadallah' from dual;
/*
   * Dual table is a build in table in oracle database.
   * it is a special one row and one column table that is created by the default with every oracle database installation.
   * it is owned by the system user and it used for a various purposed such as 
          - tseting sql queires 
          - evalutaing expressions.
          -preforming calculations.
   * when we run the first quere we will find that there is a single row in a single column.
   * this table is used only in oracle and it is used in the claclution like the secand quere.
   * the third quere is used to get the system date. 
   * the fourth quere is used to display the String which is 'my name is Mahmoud Saadallah'
*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Quot (q) operator--------------------------------------------------------------
-- the quotation mark is used to increase readability and useablility.
select q'[My name is Mahmoud Saadallah]' as name from dual;
/*
   * This quere will return th statement fo 'My name is Mahmoud Saadallah' 
   * To use quot operator it has a special order
       -letter q captial or small.
       -then single quote after the letter.
       -then square brackets.
       -then the string which will be displayed.
       -then square barckets.
       -then single quote.
*/
select 'I'm mahmoud saadallah' as name from dual;
select q'[I'm mahmoud saadallah]' as name from dual;
select 'I''m mahmoud saadallah' as name from dual;
/*
   * the differance between the single quote and the quot (q) operator is that 
   * in the  first quere there will be an error as there is a special character is the string so the engine will be confused 
      between the single quot of the operaters and the single quot of the string, but int the secand quere the engin know
      that any thing between the squere brackes is a string.
    * in the first quere we could solve this error by putting the single quot before the quot in the string to told 
       the engin that this quot is a string like in the third quere, but this way is not efficent for the lot of characters.
*/
select q'{my name is mahmoud saadallah}' from dual;
select q'A my name is mahmoud saadallah A' from dual;
select q'<my name is mahmoud saadallah>' from dual;
/*
   * we could use any character as quotion mark delimiter like [], {}, **, (), <>, AA and so on.
*/
-- we have to know that the alise name written between duble quot and the string written between the singl quot.

-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Distinct and unique operator-----------------------------------------------
select job_id from employees;
select distinct job_id  from employees;
select distinct job_id,  distinct first_name  from employees;
select distinct job_id,  first_name  from employees;
/*
   * They are used to eliminate the duplicate rows.
   * The keyward distinct is written between the select keyward and the column name, and we could use only one distinct keyward
       in the same quere so the secand quere will display an error, but the third one will be ok.
    * The output of the first quere will be 107 rows, and the output of the secand quere will be just 19 rows as all the duplicate
        rows will not displayed, only one copy of each data in each row will be displayed.
*/
select unique job_id from employees;
--in oracle database we could use unique keyward instead of the distinct keyward and get the same result.

-------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------Concatenation---------------------------------------------------------------
select q'[my name is:]' || 'mahmoud' from dual;
select first_name || last_name as "full name" from employees;
select first_name || ' ' || last_name as "full name" from employees;
select concat(first_name, last_name) as "full name" from employees;
select 'My name is: ' || first_name from employees;
 /*
    * Concatenates two or more strings or two or more columns and return as a sing row.
    * we have two ways to concate the strings and the columns by using the concatentation operator " || " or by using the concat command
    * in the first quere the output will by "my name is:mahmoud as the || operator concat the two strings.
    * in the secand quere the output will be the first name and the last name columns form the employees table as one row.
    * in the fourth quere we use the concat command instead of using the concatentation operator. the output will by the 
        same as the secand quere.
    *IN oracle we have to know that the concat command can concat only two cloumns or strings not like the other databases
       which could concat more than two columns. So if we need to concat more than two column we have to use the || operator.
    * concat with null value doesn't return null.
 */
  
-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Arithmetic expressions-------------------------------------------------------------------------
select salary + 100 * 12 from employees;
select (salary +100) * 12 from employees;
/*
   * the arithmetic expressions can contain colums, or numbers.
   * the basic arithmetic expressions are:
       +:  addition
       -:   subrtraction
       *:   multiplication
       /:   division
    * Multiplication and divison are preformed before the addition and subrtraction.
    * we have to use the parenteses to make the code more readable.
    * in the first quere the output will be the salary increased by 1200 as the multiplication will be preformed before the summation
        the result from the multiplication which is 1200 will be added to the salary.
    * in the secand quere the operation inside the parenteses will be preformed first which will then the operation out.
*/
select sysdate + 3 from dual;
-- we could use the arithmatic expressions with date.

select salary + COMMISSION_PCT from employees;
-- Any calculation with null value return null.

-----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------Where----------------------------------------------------------------------------

/*
   * where caulse limits the rows by a query.
   * we use where to put the condation whern we restric data from table.
   * where caulse be in  select [comlumnsname ....]
                                      from [tablename]
                                      where condations;
    * where caulse is used with 
        - comperation operators (=, <, >, <=, >=, <>, !=).
        - with between, in, like, and null.
        - logical operators like (and, or, not).
*/
select * from employees 
where salary >= 7000;
-- this query is used to get all employees that have salary greater than ot equal to 7000.

select * from employees 
where job_id = 'IT_PROG';
-- the output of this query is all employees that work as IT_PROG.

--<> this operator is called not equal.
select * from employees 
where Employee_id <> 5;
-- the output of this query is all employees except the one whoes id is 5;

--equal
select * from employees
where hire_date = '21-SEP-05';
-- the output of this query is all information about the employee whose hire date is '21-SEP-05';
-- we have to know that the date is always be between single quot.

--betweeen
select * from employees 
where salary between 7000 and 10000;
select * from employees 
where hire_date between '16-AUG-02' and '07-MAR-06';
-- Retrieves data between the specified lower limit and upper limit.
-- The lower and upper limit values are included!
-- Many data types like number, date, character values can be restricted with theBETWEEN ... AND operator.

--IN
select * from employees
where employee_id in (160, 107, 144, 100);
select * from employees
where hire_date in ('08-MAR-08', '30-JAN-05', '20-AUG-05');
--The IN operator is used to retrieve the restricted values in a specified list.
--Many data types like number, date, character values can be used with the INoperator.
--The order of the specified values is not important.
-- you can use up to 1000 in  the in list.

-------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------Like-----------------------------------------------------------------
select * from employees 
where job_id = 'SA_REP';
-- in this query the output will be all information about the employees work as an SA_REP, so we use the equel sign to get the 
--    output, but what about if you don't know the exacit name of the job possion, in this situation we could use like in 
--     the condation instead of using equal.

-- we could use like instead of using equal sign is the condation.
/* 
	the using of like is usfull when we dio not know all information about the row we have, 
	such as when we but the condation to search about a job_id called SA_REP, then we know the
	job_id so we use = to search(where job_id = 'SA_REP';)
	but if just know that the job_id has the section 'SA', then we can't use the = here as
	we don't know all information about the job_id so we use like which will search for 
	all job_id that contaion the section 'SA'
*/
select * from employees  -- here we know all information about the firstname
where job_id = 'SA_REP';

    
select * from employees 
where job_id like 'SA%';
/*
	-- here we know that the job_id contain section 'SA', but we have to use some oprator to help 
	compilor to search such as 
	'under score char'  "_" : mean that one char 
	"%" :mean that zero or more char
*/

-- 'ahm%' : mean that it start by section 'ahm' and had zero or  more char after that.
-- '%ed'  : mean that that end with section 'ed' and had zero or more char before it .
-- '%m%'  : mean that have m in somewhere in the word at start or medale or end.
-- '_a%'  : mean that the secand letter is a followed by zero or more char.
-- '%a-'  : mean that the secand letter from the end is a.
-- '[ahm]%' : mean that the word start with letter 'a' or 'h' or 'm' followed by zero or more letter.as the 
--             square bracket mean or.
-- '[^ahm]%' : mean that the word start with any letter except 'a' or 'h' or 'm'.  "^" mean not
-- '[a-h]%'  : mean that the word start with any letter beteen "a" and "h".
-- '[^a-h]%' :mean that the word start with any letter except the letters between "a" and "h".
-- '%[%]'   : mean that the word had % as a char in the end.
-- '%[_]%'  : mean that the word had _ as aletter in somewhere in the word .
-- '[_]%[_]': mean that start with _ and end with _ char.

-----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------IS NULL---------------------------------------------------------------
/*
   * Is null operater is used to search about null as we can't use equal '=' operater when dealing with null because null 
       is not a value to use = with it. so run this query 
                                                                                  select * from employee 
                                                                                  where manager_id = null;
        this query will get nothing in the output as the null is not a value to use = with it.
*/
select * from employees
where manager_id is null;
-- her after using the is null operator we find that this query is run and get an output.

select * from employees
where commission_pct is not null;
-- also we use in not null operator to get the rows that have values and not having null values.

--------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Logical Operator---------------------------------------------------------------

--Logical operators enable us to use more than one condition in the WHERE clause.
-- There are three logical operators 
  -- And: returns true if all the component conditions are true.
  -- Or: returns trun if at least one componect conditions is true.
  -- Not: returns true if all conditins are false.
  
  select * from employees 
where job_id = 'SA_REP' and salary >= 10000;
-- In this query the output will be all employees who work as SA_REP and must get salary greater than or equal to 10000. if one 
--   condition hasn't been trun then it will not be in the output. we could also add conitions as we need two, three or more.
select * from employees 
where job_id = 'SA_REP' and salary >= 10000 and first_name = 'Lisa';-- three conditions.

--OR
 select * from employees 
where job_id = 'SA_REP' or salary >= 10000;
-- In this query the output will be all employees who work as SA_REP or get salary greater than or equal to 10000.

--NOT
-- The NOT operator is used to negate a condition.
select * from employees 
where job_id not in ('SA_MAN', 'SA_REP', 'PU_MAN');
-- in this query the output will be all employees that not work as a SA_MAN, SA_REP, PU_MAN.
/*
   T e expressions In t e WHERE c ause are per orme
Int e o owing or er:
Order           |              Meaning.
1                   |              Arithmetic Operators.
2                   |              Concatenation Operator.
3                   |              Comparison Conditions.
4                   |              IS [NOT] NULL, LIKE, [NOT] IN
5                   |              [NOT] BETWEEN.                                                                                                    
6                   |              Not Equal To.                                                                              
7                   |              NOT Logical Operator.                                                                          
8                   |              AND Logical Operator                                                             
9                   |              OR Logical Operator.                                              
*/
--You should use parentheses to avoid logical order confusion or change the order specifically.  
SELECT first_name, last_name, job_id, salary
FROM employees
where job_id = 'IT_PROG'
OR job_id ='ST_CLERK'
 and salary > 5000;
 
SELECT first_name, last_name, job_id, salary
FROM employees
where (job_id = 'IT_PROG'
OR job_id ='ST_CLERK')
 and salary > 5000;
 /*
    * In these two query the first one has no parentheses so the and operation will excute first which mean that employees
        who work as ST_CLERK and must get salary more than 5000, then the or excute which mean the result of the and 
        operation is oring with employees who work as IT_PROG.
        
    * IN the secand query there are two parentheses so the condition inside the parentheses will excute first then the 
        condition out. so the or will excute before the and operation.which mean all employees who work as ST_CLERK or
        work ST_CLERK then and will excute which mean the output of the parentheses anding with the secand condition.
 */


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------Order by----------------------------------------------------------------------------

--The ORDER BY clause changes the returning rows' order by any column or alias or the numeric positions of the columns in the SELECT list.
--The ORDER BY clause can sort the retrieved rows in ascending (ASC) or descending (DESC) order.
-- ASC: mean from the lowest to the highest.
-- DESC: mean from the highest to the lowest.
-- The default order is ascending order.
-- The order by clause is the last clause in the query.

select * from employees
order by first_name;
--The output of this query is the employees table, but order by the first_name column.
select * from employees
where salary >=16000
order by salary;-- this query will get all employees whoes salary is greater than or equal to 16000, but the result will order by the salary.

--The ORDER BY clause can be used with the given alias in the SELECT statement.
select first_name, last_name, salary * 4 as "new_salary"
from employees
order by "new_salary";-- order by an alise name.
 
 -- The ORDER BY clause can also be used with the column position in the SELECT list or the column order in the database.
 select first_name, last_name, salary
 from employees
 order by 3;
 --As we use a number in the order by sentance this mean order by the column number three in the select statment which is salary
 --  so we will find that the output will be ordered by the salay column.
 
  select *
 from employees
 order by 2;
 -- this query will by ordered by the secand column in the employees table which is first_name column.
 
 
 -- order by colud be used with multiple columns.
 select first_name, last_name, salary 
 from employees
 order by first_name, last_name;
 -- this query is ordered by two columns first it will by ordered by first_name column, but if there are two rows have the same
 --  vlaues in this situation it will by ordered by last_name column.
 
  select first_name, last_name, salary 
 from employees
 order by first_name asc;
 
  select first_name, last_name, salary 
 from employees
 order by first_name desc;
 -- These two queries  are ordered by first_name column, but the first query is order by first_name in an ascending way
 -- the secand query is ordered by first_name in a descending way.
 -- if you didn't write any operator (asc, desc) the output will be ardered in an ascending by defult.
 -- The null values are displayed last in an ascending order.
 
 
 -- Nulls first  &  Nulls last
 --The NULLS FIRST or NULLS LAST operators are used for changing the order of the NULL values.
 select *
 from employees
order by commission_pct asc nulls first;-- the nulls values will come at the top of the commission_pct column.

 select *
 from employees
order by commission_pct asc nulls last;-- the null values will come at the bottom of commission_pct column.


--------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------RowID & RowNum----------------------------------------------------------------------
--ROWID
/*
   * The ROWID is a unique identifier that contains the physical address of a row.
   * Oracle automatically generates a unique ROWID at the time of insertion of a row.
   * The fastest way to access a single row is using its ROWID.
   * The ROWID is permanent, unique so each row has a unique rowid.
   * The ROWID doesn't change, when the data in the row change.
*/
--ROWNUM
/*
   *The ROWNUM is nothing but consecutive logical sequence number given to the rows fetched from the table.
   * To limit the returning rows in a table, you can use the ROWNUM pseudo column.
   * The ROWNUM is temporary.
   * If you change the query, the rownum number will refer to another row.
*/
-- ROWID: is the physical address in the memory.
-- ROWNUM: is the number of rows in the output of the query.

select employee_id, first_name, last_name, salary, rowid, rownum
from employees;
/*
   * AS we see when this query excuted the values in rowid column is consist of 16 digit hexadecimal number that include 
      the location of each row in the hard disk.
    * In rownum we see that the vaues in it is just a sequence of number start by one and end by the total number of returned rows.
 */
 
 -- We could use the rownum to litmit the output rows.
 select employee_id, first_name, last_name, salary 
 from employees
 where department_id = 80;
 -- As we could see this query returned 34 rows, but if need to get the top 10 of this output we could use rownum.
 select employee_id, first_name, last_name, salary 
 from employees
 where department_id = 80 and rownum < 11;-- this  query will return the top 10.
 
 -- if we need to get the top 10 rows from the previous query depend on the heghest amount of salay then 
     -- we have to use the rownum with subquery whic we will descise later.
 select employee_id, first_name, last_name, salary 
 from (select employee_id, first_name, last_name, salary 
 from employees
 where department_id = 80
 order by salary desc)-- This is a sub query.
 where rownum < 11; -- this query will return the top 10 salary.
 
 -------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------Fetch clause----------------------------------------------------------------------------
 /*
    * The FETCH clause is used in conjunction with the SELECT and ORDER BY clauses to limit the rows and retrieve 
        a portion of the returning rows.
    * Sentax of th fetch:
        [OFFSET   rows_to_skip ROW[S]]
            FETCH [FIRST || NEXT] [row_count || percent PERCENT] ROW[S] [ONLY || WITH TIES];
     -->OFFSET: specifies the number of rows to skip before the row limiting starts, its opional to write it, if you don't specifie
                           it then the defult offset values is zero and the row limit start from the first row.
     --> rows_to _skip: is the number of row rows that will be skipped, then if we put 5 in row_to_skip then it will skip the first
                                     five rows and start form the sixth row. if it is the number greater than the number of the rows or it is
                                     null then no rows will be retreved.
     --> ROW || ROWS: Both of them can be used based on the returning rows in order to increase the semantic clarity.
     --> FETCH: specifies the number of rows or percentage of rows to return.
     --> FIRST || NEXT: You can use any of them based on the situation.
     --> row count || percent PERCENT: the row count to specify the number of rows to return, the PERCENT specifies the 
                                                             percentage of the total number of selected rows to return.
      --> ONLY || WITH TIES: ONLY is used to return exactly the specified number of rows or percentage of rows. 
                                                        The WITH TIES returnsextra rows with the same value as the last row fetched.
                                                        If you specify WITH TIES, then you must specify the order_by_clause. 
                                                        If you do not specify the ORDER BY clause, then, no additional rows will be returned.
 */
 
 select employee_id, first_name, last_name, salary
 from employees
 order by salary desc;
 -- As we see when we excute this query the output is employees order by salary by ab desc way, and we notic 
      --that the first row include steven king.
 -- If we need to get the same result but without steven king then we colud use the offset.
 select employee_id, first_name, last_name
 from employees
 order by salary desc
 offset 1 row;-- The offset here mean skip and the number after it is the number of rows to be skipped.
 
 -- what about if we need just the top 10 employees depend on the amount of the salary include steven.\
 select employee_id, first_name, last_name, salary
 from employees
 order by salary desc
 fetch first 10 rows only;
 -- As we see the output is the top 10 employees who get the highest salary.
 
 --If we need to get the same result but without steven king then we colud use the offset.
 select employee_id, first_name, last_name, salary
 from employees 
 order by salary desc
 offset 1 row
 fetch first 10 rows only;
 -- we could use next instead of using first and get the same result.
  select employee_id, first_name, last_name, salary
 from employees 
 order by salary desc
 offset 1 row
 fetch next 10 rows only;
 -- The diferance between only and with ties
 -- only: mean get only the nuber of rows that we fetch 
 -- with ties: mean if there are any rows have the same amout that the last row in the fetch has in the order by column 
                    --then this row will be return with the fetch, so we can't use with ties without orderby.
 select employee_id, first_name, last_name, salary
 from employees 
 order by salary desc
 offset 1 row
 fetch first 10 rows with ties;
 -- This query will return 12 rows even we fetch just 10 rows, but as the row number 11 has the same amount of salar that 
     -- the row number 10  has so it returned and teh row number 12 too.

-- if we use null instead of number of offset or number of fetch then there is output will returned.
 select employee_id, first_name, last_name, salary
 from employees 
 order by salary desc
 offset null row
 fetch first 10 rows with ties;
 
  select employee_id, first_name, last_name, salary
 from employees 
 order by salary desc
 offset 1 row
 fetch first null rows with ties;