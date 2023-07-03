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
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------Substitution Variables------------------------------------------------------------------------------
-- A substitution variable can be thought as a user variable.
-- The substitution variables are placeholders in an SQL script where you want to substitute some values at runtime.
-- it's not built in sql but it's built in oracle and sqlplus

-- If we want to display the information about employees who work at depatrtment number 30 then we use this query
select first_name, last_name, salary, department_id 
from employees
where department_id = 30;
/*
    and if we want to sisplay the same information about employees who work at department 40 then we have to copy this 
      query and modify the condition to be = 40 and so on if we need to get the same result about employees who work
       at depatment 50 or 60, but we could use substitution variables to do that without modify the query.
*/
--Instead of writing the department idea in my query directly, I can use a variable which can take a different value each time
   --I run the query instead of havihg to modify the query every time. we can do that very easily using the substitution variables.
   
--The ampersand (&) character is used before the substitution variable in the query.
-- after the ampersand character we write down the name of the varible whic will apear in the pop up window.
select first_name, last_name, salary, department_id 
from employees
where department_id = &departmentNumber;
-- when we excut this query there is a pop up window will apear which say enter value of departmentnumber(variable name) after ampersand &
    -- after entring the value of the department id the output will be displayed ocording to this value.
-- The name of the variable is not important here, and it has to be in one word.

--when using the substitution variable with string or date parameter then we put the ampersand (&) and the variable name between
   -- single quote.
select * from employees
where first_name = '&firstName';-- we put the ampersand and the variable name between single quote as the first_name is a string.
-- we could also put the single quote in the pop up window instead of putting it in the query, but this is not a good paractice.
select * from employees
where first_name = &name;

--we can use more than one substitution variable at various places in an SQL statement like:
    --WHERE Condition.
    --ORDER BY Clause.
    --Column Expressions.
    --Table Names.
    --Entire SELECT Statements.
    select &columnName -- SV for the column name.
    from &table_name -- SV for table name.
    where &condition -- SV for condition.
    order by &order; -- SV for order.


select first_name, last_name, salary
from employees
where salary between &sal and &sal+1000;
/*
   *As we see in this query the subsitituation variable here has the same name, but when we excute this query we find that
     the sqlplus will ask the user to enter the value of the sal twice evin if the two varibles have the same name which is sal
     because SQL doesn't store the first value you entered and it will conceder thate these two variables are diffrant.
    * If we want to make SQL to store the value of the varible to use it again in the other variables which have the same
      name and the value just one time we have to use double ampersand(&&) befor the first substitution variable.
*/
select first_name, last_name, salary
from employees
where salary between &&sal and &sal+1000;
-- Here the SQL will ask to enter the value of the sal variable just one time and save the value you entered as we use double ampersand.
-- Even if you try to excute this query again the sql will never ask you to enter the value of the sal variable as its already saved in the memorey  form the first excution.


----------------------------------------------------- DEFINE   and     UNDEFINE.-----------------------------------------------------
-- Using a double ampersand in front of a substitution variable tells SQL Developer or SQL*Plus to define that variable
     --for the duration of the session.
--The DEFINE and UNDEFINE commands allow us to explicitly create and delete user variables.
-- The DEFINE command is used to define a new user-variable and assign it a value.
-- DEFINE can also be used to display the value of a specific user variable or to display the values of all user variables.
-- To use the define command we write 
--                                                              DEfine vairable_name = value;
-- This way of using the define command is used instead of using double ampersand to store the value of the variable to use it again.
define sala = 3000;-- this command will store the variable sala with the value of 3000.

select * from employees
where salary between &sala and &sala +2000;-- the output will be between 3000 and 5000.
-- here in this query the engin will nerve ask you to enter the value of the sala as we define it befor by the define command
-- We could modify the SV by define it again with a new value
define sala = 5000; -- This command will change the value of the sala variable from 3000 to 5000 and if we excute 
                                       --the privious query again the output will change depend on the new value.
-- This is the only way to modify the value of SV and we couldn't use the double ampersand to modify the variable.
select * from employees
where salary between &sala and &sala +2000;-- the output will be between 5000 and 7000.

-- If you need to delete(remove) the value of the SV we could use UNDEFINE command, so if we need to delete t
     --he vlaue of sala variable we use the next command.
undefine sala; -- this command will delete the value of the sala variable that we define it before.

-- You can see the defined substitution variables by executing the defined command without any parameter.
define;-- This command will show all SV variables that we created(by define commmand or ampersand) and the engine created and it's values and data type. 

-- if we want to check the value of a specfic variable we use define variableName
define sala;
-- We could use Def  and Undef instead of define and undefine.
undef sala;
def sala = 3000;


-----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------ACCEPT/ PROMPT
--The most reliable and robust method for getting input from the user is to explicitly prompt for values using 
    --the ACCEPT and PROMPT commands.
-- The way of using the accept and prompt comman is:
                                                                                        Accept user_variable prompt 'Comment_appeat_to_user';

--The ACCEPT command takes input from the user and stores it in a user variable.
--The PROMPT command is used to display a message to the user for supplying a brief explanation of what your script is going to accomplish.
Accept emp_id prompt 'please enter a vaid employee id';
--This command will pop up a window that ask the user to enter a vaid employee id
-- the message that writen in the prompt command is the message that apeare to the user.
select * from employees
where employee_id = &emp_id;
--This query will be excuted automaticly with the value that we accepted in the Accept command.
-- we use the ampersand character before the name of the variable in the select statement to make the engin know that this 
    -- this variable is a SV.
-- we have to know that the variable in the accept command stored in the memory so we could use it more than one time in a diffrant queries.
-- we could modify the value of the variable by repeat the accept command again or using define command.
-- also we could remove or delete the variable by undefine command.
Accept emp_id prompt 'please enter a vaid employee id';
define emp_id = 120;
undefine emp_id;

--example
Accept min_salary prompt 'enter the minimum value of salary';
Accept max_salary prompt 'enter the maximum value of salary';
select * from employees
where salary between &min_salary and &max_salary;

------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------verify on/off-------------------------------------------------------------------------
--The VERIFY command displays the status of the Variable before and after the substitution.
-- The VERIFY command can be used in two ways which are: 
                                                                                                set verify on;-- turn verification.
                                                                                                set verify off;-- turn off verifcation.
 -- when we set verify on and use an SV then in this case the verification message will be apeare.
 set verify on;
select * from employees
where employee_id = &employee_id;
-- after  excute these queries and put value to employee_id variable the verifiection message will apear like that:
/*
    old:select * from employees
     where employee_id = &employee_id
     new:select * from employees
     where employee_id = 200
     >>Query Run In:Query Result
*/
set verify off; --this command will turn off the verification message;


-- Suppose that we have a department named R&D, which stands for research and development departments
select * from departments
where department_name = 'R&D';
-- if we excute this query the engin will consider that D is a SV and the engin will ask the user to enter the value of D, but this
    -- not what i want. i want to use R&D as name of department not as a SV, so we have to use 
                                                                                                                                                        set define off;
     -- before excute this command to make SV off.
set define off;
select * from departments
where department_name = 'R&D';
-- after setting define off we could use ampersand as a part of string.
-- we could set the sustitation variable again bya:
set define on;
-- we have to know that the define is on by default, and if we set it off it will be off all th session not just for one query.


-----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Functions--------------------------------------------------------------------------------
--You can think of the functions like some little machines that run specific tasks in a factor.
-- A function is a subprogram that is used to return a single value.
/*
   * What is the function?
   * It's a little or a Small group of code that run a Specific tasks. 
   * The SQL provide Some functions that provide more power and flexibility.
   * functions are created for manipulating the data and returding valve
   * The functions must be created before calling them.
   * ance I create functions I Could call it when I want and where I want.
   
   # In oracle database there are two types of functions:
      1- Single-row Functions.
      2- Maltiple-row functions.
      
    * The Single-Row functions: get only one row as an input and return only one result.
    * Multiple-Row Functions: get more than one row as an input and turn one result & os an output.
*/

------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Single-Row Functions---------------------------------------------------------------------------
--The single row functions operate on single rows and return only one result per row.
-- Accept one or more arguments and return one value.
-- Return value for each row returned.
-- Can be used alone or nested.
-- A column or an expression can be used as arguments.
-- The returning data type can be different than the input data types.
-- Can be used in SELECT, WHERE or ORDER BY clauses.

/*
   * There are five types of Single-row functions:
      1- Character Functions
      2- Numeric functions.
      3- date functions.
      4- Conversion functions.
      5- Genral functions.
*/
-- Functions are categorized by the data types of their input parameters.
/*
    Character Functions: Accept character values as input, and return character or numeric values.
    Number Functions: Accept numeric values as input and return numeric values as an output.
    Date Functions: Operate on values of the DATE data type.
    Conversion Functions: Used to convert one data type to another.
    General Functions: These functions take in any data type. But, they are mainly used to handle the NULL values.
*/
    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Character Functions--------------------------------------------------------------------
--Character functions take in character data as input and return character or numeric data as output.
/*
   * There are two different types of character functions:
    1- Case Conversion functions: Convert characters to upper case or lower case.
        1- UPPER function.
        2- LOWER function.
        3- INITCAP function.
    
     2- Character Manipulation functions:
        1- SUBSTR function.
        2- LENGTH function.
        3- CONCAT function.
        4- INSTR function.
        5- TRIM function.
        6- REPLACE function.
        7- LPAD I RPAD function.
*/
----------------------------------------------------Case conversion------------------------------------------------------------------------------
-- Case conversion functions are used to convert the characters to uppercase or lowercase characters.
-- LOWER Function: Converts all the input characters to lowercase characters.
-- UPPER Function: Converts all the input characters to uppercase characters.
-- INITCAP Function: Converts first letters of each word to uppercase and rest of them to lowercase.

select upper(first_name), lower(last_name), initcap(email)
from employees;
/*
      this query will return first_name column in a lowercase letter, last_name column in an uppercase letter, and email column
      in an initcap which mean the first letter of each word will be upper and the rest of letters are in lower case.
*/

-- What if i want to find the employee whoes last_name is king?
select * from employees
where last_name = 'king';-- it return nothing.
/*
   this query is not cprrect as the employee may insert his last nam in a diggrant formate lke insert it in a lowercase 'king',
   or insert it in an uppercaee 'KING', or insert it in a cobination of upper and lowe case 'KiNg', so this query is not correct in this 
   case as the data is case sensetive.
*/
-- There is a way to deal with unstructured data, by convert the column to he same formate that we use inth condition.
select * from employees
where lower(last_name) = 'king';
--OR
select * from employees
where upper(last_name) = 'KING';
--OR
select * from employees
where initcap(last_name) = 'King';
-- All of the above queries will get the same result  which is the employees whoes last name is king.


----------------------------------------------------Character Manipulation functions------------------------------------------------------------------------------
--They re used to extract change formate or alter a character strength, one or more character or words are passed into 
    -- a character mainipulation functions.
    
/*
    * There are 10 type of character mainipulation functions:
       1- substr( String, position_of_strating, [length_of_sub])
       2- length(String)
       3- concat(String1, String2)
       4- instr(String, substring, [position], [occurrence])
       5- Trim([[leading || tralling || both], trim_character from] String)
       6- Ltrim(String, [trim_of_substring])
       7- Rtrim(String, [trim_of_substring])
       8- Replace(String, String_to_replaced, [replacement_string])
       9- Lpad(String, target_length, padding_expression)
       10- Rpad(String, target_length, padding_expression)
*/

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------substr & length--------------------------------------------------------------
-- The substring function uses for get a sub string from a given string 

substr( String, position_of_strating, [length_of_sub])
/*
    * it takes three parameters two are mandatory and one is optional
       - the first parameter is the givin string.
       - the secand parameter is the position of starting character in the given string
       - the third parameter is the length of substring(the length of the output string)
*/
select first_name, substr(first_name, 2,3), substr(first_name, 2)
from employees;

/*
-- As we see when we excute this query the output will be three column  
    -- The first column is the first_name column 
    -- The secand column is the substring from the first_name column, as we see we need the substring to start form the 
        secand letter and the length of the substring is 3, so we find that in the fist row at the result the first_name of the 
        employee is ellen and the first row in the secand column is lle as the substring start form the secand lette and end 
        after the length of the substring get tree 
    --The third column is the substring from the first_name column, as we see we didn't spacifie the length of the substring
        so the third column has the first_name column start from the secand letter and end with the end of each string, as 
        we didn't spacifie the length of the substring.
*/
-- We have to know that the coumt of the character in sql start by one not zero like other programing language.

-- LENGTH FUNCTION:
-- The lenght function is uses to get the length of the given string . 

length(String)
select length(last_name) from employees;
-- it get the length of each row in the last_name column.


--------------------------------------------------------------concat function--------------------------------------------------------------
-- Concat function uses to concat two strings and display them as one string.
-- We have to know that the concate function can't concat more than two strings, but we could concat more than two string
    -- by using a concat operator || or by using a nested function(function inside function). 
select concat(first_name, last_name) from employees;
-- The output is the first_name column and the last_name column as one column.

-- we could conncate more than two strings by using a neasted function.
select concat(concat(first_name, last_name), email) from employees;
--we using a neasted function to concate more than two strings by concat function


-----------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------Instr function--------------------------------------------------------------
-- instr function uses to check if a spacific substring is in a givin string and return the position of the firs character of the 
    -- substring in the givien string
    
    instr(String, substring, [position], [occurrence])
/*
    * it takes four parameter two of them are mandatory and other two are opetional
      - the first parameter is givin string that we want to search in.
      - the secand parameter is the substring that we need to search for.
      - the third parameter is the position of starting character. If the position value is possitve say like 5 then the engin will start 
         searching from th letter number 5 in the string to the end of that string, and if the position value is negtive say like -3
         then the engin will start searching the third letter form the end of the string and search backward to the first letter of the string.
      - the fourth parameter is the occurence which mean which occurence of substring it should search. if it 3 for example
         it will return the position of the third occurrence of that substring.
*/
select instr('I am learnning function in oracle', 'o', 10, 2), instr('I am learnning function in oracle', 'o')
from dual;--28     22
-- in this query we use the instr to search for litte 'o' in the sentance 'I am learnning function in oracle' by two ways
/*
    * the first way we want to search for the letter o in that sentence and we need the search start form the letter number 10
       and end when get the secand occurance of the lettr o and return the position of it.
*/
/*
    * the secand way we want to search for the letter o in that sentence, but we didn't spacifie the starting position or the number
       of occurance, so the engin will retrun the first o from the first letter and return it's position.
*/

-- if the starting position value is negative then the engin will start search from the backward of the string.
select instr('I am learnning using functions in  oracle', 'o', -2, 2) 
from dual;   -- 28
--in this query we use the instr function to search for letter o in the sentance 'I am learnning using function in oracle'
   -- but we set starting position as a negative number -2 and we want to get the secand occurance in the sentance
   -- As the starting position is a negative number so the engin will start search from the secand number form the end
   -- of the string and search backward until get the secand match letter with the substring and return its possition.

select instr('I am learnning using functions in oracle', 'os', 1, 1) 
from dual; -- 0 
-- it return 0 as there is no substring with 'os' pattern in the givin string.


-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------trim function--------------------------------------------------------------
-- The trim function uses to remove all the spacified charcter, eigther from the beginning or the end or both from givin string.
Trim([[leading || trailing || both], trim_character from] String)
/*
      -  When using the trim function we first spacifie the place of removing which include:
                                                                                                    - leading: mean from the beginning.
                                                                                                    - trailing: mean from the end.
                                                                                                    - both: mean from both side.
           then we write the charcter that we want to remove,
           then write down the from keyword,
           then we the givin string.
*/
select trim(leading 'm' from 'my name is mahmoud'), trim(trailing 'd' from 'my name is mahmoudddd')
from dual; -- y name is mahmoud        my name is mahmou.
/*
    * here we use the trim function to remove the letter 'm' from the beginnig of the sentence 'my name is mahmoud' and
          remove the letter 'd' from the end of the sentance 'my name is mahnoudddd'. 
    * as we use leading so the removing start form the begining, but when we used trailing the removing start form the end of the sentance.
    * in the secand function we find that the output of this function has no letter 'd' at the end of the sentance, because 
          the engin start removing all the matching character from the end until get unmatch character.
*/

select trim(both ' ' from '      my name is mahmoud      '), trim('        my name is mahmoud     ')
from dual; --my name is mahmoud     |   my name is mahmoud.
/*
    * here we use the trim function in two ways the first one with both keyword and spacifie space as a trim character
        the secand with nothing we didn't spacifie the place of removing or the trim character, but we get the same result
    * the result is the sentance 'my name is mahmoud' with no spaces in the both side, so if we didn't spiacifie the trim 
       character the engine will remove all spaces charcter, and if we didn't spacifie the place of the trim the engin will remove
       from both sides.
*/
select trim(leading from '            my name is mahmoud     ')
from dual;  -- my name is  mahmoud        with spacies at the end.
select trim(trailing from '                     my name is mahmoud          ')
from dual;--                   my name is mahmoud  with spacies at the beginning.

-- WE HAVE TO KNOW THAT THE TRIM FUNCTION CAN'T REMOVE SUBSTRING(SEQUANCE OF MORE THAN ON CHARACTER ).
-- so there are another two functions that used to remove substrings.


----------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------Ltrim & Rtrim function--------------------------------------------------------------

 Ltrim(String, [trim_of_substring])
 Rtrim(String, [trim_of_substring])
 /*
    * they take two parmeter one is mandatory and the other is optional.
      - the first parameter is the givin string.
      - the secand parameter is the substring that we need to remove from the left side or the right side.
 */
       -- The differance between the trim fumction and ltrim and rtrim is the trim function remove and deal with single character, but
    -- the ltrim and rtrim remove and deal with muiltiple character (substrin).
    
-- Ltrim stands for left trim removes all speicifed character from the left side of the givin string.
-- Rtrim stands for right trim removes all speicifed character form the right side of th givin string.

-- if you don't specifie a substring for these function they will remove spaces for the left if the function is ltrim or form the right if the function is rtrim.

select ltrim('           my  name is mahmoud        ') 
from dual;  -- my name is mahmoud            with all strings in the left side removed.
select rtrim('           my  name is mahmoud        ') 
from dual;  --                my name is mahmoud with all strings in the right side removed.
-- as we didn't specifie the substring it remove the spaces.

select ltrim('my name is mahmoud', 'my')
from dual;--name is mahmoud.
-- here we specifie the substring that will be removed as 'my' form the left side so the engine remove all the matched character until get the unmatched character.

select rtrim('my name is mahmoud', 'ud')
from dual;--myname is mahmo.
-- here we specifie the substring that will be removed as 'ud' form the right side so the engine remove all the matched character until get the unmatched character.
select ltrim('my name is mahmoud', 'mn')
from dual;-- y name is mahmoud.
-- here we specifie the substring that will be removed as 'mn' form the left side so the engine remove all the matched character until get the unmatched character.
-- as we see here the engine remove only on character 'm' which match with on of the character in the substring.
/*
    *THE WAY OF REMOVING IS THAT THIS FUNCTION CONSIDER THE SUBSTRING 'mn' AS AS ARRAY OF CHARCTER 
      AND THE ENGINE START REMOVING A;; MATCHED LETTER IN TEH STRING WWHICH MATCH WITH ANY LETTER IN THE ARRAY OF CHARACTER
*/
select ltrim('my name is mahmoud', 'ngm')
from dual;-- y name is mahmoud.

select rtrim('my name is mahmoud', 'mdynu')
from dual;-- my name is mahmo.

--FAMILIAR EXAMPLE
-- in your work you may need to remove 'www' and '.com' from the URL of the web sites that stored to do so we use:
select Ltrim(Rtrim('www.name_of_website.com', '.com'), 'www.') as website
from dual;-- 'name_of_website'
-- we use here an instead function the inner function will remove '.com' from the right side and the outer function ill remve 'www.'
    -- from the left side;
    
select ltrim('656569895774213206560021www.name_of_site.com', '0123456789')
from dual;--www.name_of_site.com.

-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------Replace function--------------------------------------------------------------
