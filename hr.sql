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
-- Replace function uses to replace old substring with another from the givin string
Replace(String, String_to_replaced, [replacement_string])
/*
    * It takes three parameer two of them are mandatory and one is optional.
       - the first parameter is the string that will be processed.
       - the secand parameter is the string or substring that we need to change.
       - the third parameter is the string that will be insert instead of the secand parameter.
*/

select replace('my name is mahmoud', 'a', '*'),  replace('my name is mahmoud', 'a')
from dual; -- 'my n*me is m*hmoud'  |  'my nme is mhmoud'
/*
    * as we see here we use the replace function twice 
      - the first one to replace letter 'a' from the givin string with letter '*'
      - the secand one to replace letter 'a' from the givien string, but we didn't specifie any character to insert instead of the removed one.
    * the output of the first function is the 'my n*me is m*hmoud' as each letter a replaced by '*'.
    * the output of the secand function is the 'my nme is mhmoud' as each letter a removed.
    -- SO IF WE DIDN'T SPECIFIE THE REPLACEMENT CHARACTER THE ENGIN WILL REMOVE THE SUBSTRING AND RPLACE IT WITH NOTHING
*/

select replace('my name is mahmoud', 'a', '#')
from dual; -- 'my n#me is m#hmoud'

select replace('my name is mahmoud', 'am', '_')
from dual;  -- 'my n_e is mahmoud'
-- here we use replace function to replace 'am' with underscore _
/*
    * IN THE REPLACE FUNCTINO THE STRING_TO_BE_REPLACED MUST MATCH ALL OF IT WITH THE SAME PATTERN OF CHARACTER 
        IN THE STRING THIS MEAN TH REPLACE FUNCTION DOESN'T WORK LIKE LTRIM OR RTRIM WHICH MATCH TEH STRING
        OR INDIVUAL CHARACTEROF SUBSTRING.
    
    * replace match and comparing the substring with the same pattern. so we find that the 'm' and athe letter 'a'  in 
        the word 'mahmoud' not removed efen if they are part of the string_to_be_replaced, but they are not in the same pattern.
*/


----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------Lpad & Rpad function--------------------------------------------------------------
-- Lpad is stands for left pad and Rpad stands for right pad
-- it pass the left side of my string with specified character or character addup to th especified lentgth
       9- Lpad(String, target_length, padding_expression)
       10- Rpad(String, target_length, padding_expression)
/*
    * it take three parameter 
       - string: the givien string that will be processed.
       - target_length: it's the length of th eresult or the output of these functions after padding 
                                this mean how many characters this string will be after the function useage.
        - padding exprission: the character that will be padding.
*/

-- IF THE TARGET_LENGTH IS LESS THAN TEH LENGTH OF THE ORIGINAL STRING, THE ORIGINLA STRING WILL BE TRUNCATE
    -- UNTIL THAT LENGTH OF CHARACTERS REMAINS.

select lpad('mahmoud', 12, '*')
from dual; -- '*****mahmoud'.
-- in this query we use lpad function to make the length of the string 'mahmoud' = 12 by adding number of characters '*'
     -- to the left side of the string until get the target_length.
    
select rpad('mahmoud', 12, '#')
from dual;  --'mahmoud#####'
-- in this query we use rpad function to make the length of the string 'mahmoud' = 12 by adding number of characters '#'
     -- to the right side of the string until get the target_length.

select rpad('mahmoud', 4, '*')
from dual;  --'mahm'.
-- in this query the target_length is less than the length of the character so the engine will trancate the string until get the target_length.
-- The trancate process start from the end of the the string even if we use lpad or rpad.
select lpad('mahmoud', 4, '*')
from dual;  --'mahm'.

-- we could put the string to these functions as a compination string
select lpad('my name is:' || first_name, 20, '_')
from employees;
-- here the givien string is the compination string.
select ceil(2) from dual;


--------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Numeric Functions--------------------------------------------------------------------
--numeric functions accept numberic value at the input and return numeric value at the output.
/*
    * Round: take in a number an rounds it to the specified number of decimal places.
    * trunct: take in a numbr and truncate it to the specified number of decimal placees.
    * ceil: stands for ceiling return the smallest integer number greater than or equal to the specified number.
    * floor: return the highest intger number less than or equal to the specified number.
    * mod: return the rminder if division which mean returns to left over of a dicision of two number.
*/

round(number,[decimal])
select round(126.5465, 3)
from dual;--126.547
select round(24.32, 1)
from dual;-- 24.3
select round(24.32)
from dual;--24
select round(24.75)
from dual; -- 25
--IF WE DON'T SPECIFIE THE NUMBER OF DECIMAL NUMBE THE ALL DECIMAL NUMBER WILL BE AROUNDED.

TRUNC(NUMBER, [DECIMAL])
select trunc(124.64, 1)
from dual; --124.6
select trunc(124.6465, 3)
from dual; --124.646
select trunc(124.69, 1)
from dual; --124.6
select trunc(124.64)
from dual;--124
select trunc(124.12)
from dual;-- 124
--IF WE DON'T SPECIFIE THE NUMBER OF DECIMAL NUMBE THE ALL DECIMAL NUMBER WILL BE truncated.

CEIL(NUMBER)
select ceil(2.75)
from dual; -- 3
select ceil(2.1)
from dual; --3
select ceil(2)
from dual; --2
--IF THERE IS ANY DECIMAL NUMBER GTEATER THAN 0 THEN THE CEIL FUNCTION WILL INCREASE THE INTEGER PART OF NUMBER
   -- BY ONE AND DELETE THE DECIMAL PART, IF NOT THE NUMBER DOESN'T CHANGE.

FLOOR(NUMBER)
select floor(2.75)
from dual; --2
select floor(2.71)
from dual; --2
select floor(2)
from dual;--2
--IF THERE IS ANY DECIMAL NUMBER GTEATER THAN 0 THEN THE FLOOR FUNCTION WILL DELETE THE DECIMAL PART, IF NOT THE NUMBER DOESN'T CHANGE.  

MOD(NUMBER1, NUMBER2)
select mod(8, 5)
from dual; --3
select mod(10, 5)
from dual; --0
select mod(6, 5)
from dual; --1
select mod(3, 5)
from dual; --3
--IF THE NUMBER1 IS LESS THAN THE NUMBER2 THEN THE REMENDER IS EQUAL TO THE NUMBER1.


------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Nested Function----------------------------------------------------------------------------------------------------
-- Functions can be nested within each other. This is called Nesting functions.
-- Nested functions are evaluated starting from the innermost function and executed
-- one by one toward the outermost one.
-- The result of the innermost function becomes the input of the outer function.
-- We can use as many nested functions as we want.

--EXAMPLE
select 'mahmoud saadallah'
from dual; -- mahmoud saadallah
-- this function get the string 'mahmoud saadallah'
-- suppose that we want to get the last name(sur name) of the this string, we could do so by using nested functions
select substr('mahmoud saadallah', instr('mahmoud saadallah', ' ')+1, length('mahmoud saadallah')) as output
from dual; -- 'saadallah'
/*
    * here we use the nested function to get the last name of the 'mahmoud saadallah' the engine will start excuteion from the 
        most inner function which is length and get the length of the string then put the length in  the substr function as the length of substring
        then the instr function excute to get the position of the space that sperate the first name and last name then we add 
        one to output of the isntr function to get the position of the first lettter in the lastname, then the outer function excute
        to get the substring which start form the output of the instr function plus one and end with last letter in the string
*/
select substr('mahmoud saadallah', instr('mahmoud saadallah', ' ')+1) as output
from dual; -- 'saadallah'
-- here we get the same result even if we didn't use the lenght function to get the position of the last chracter at the substr
    -- function, as we say before in the substr function if didn't specifie the length of substring it stop at the end of the string.
 
 -- we could applay the pervious function with the input from user using substitutin variables.   
Accept name prompt 'please enter your full name';
select substr('&name', instr('&name', ' ') + 1, length('&name')) as output
from dual; -- return the last name of the name of user.

-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Date values & fromate---------------------------------------------------------------------
-- DATE is the main datatype used in Oracle for storing the date values.
-- Oracle Database stores the date values in an internal numeric format.
-- It stores a seven-byte number that contains the century, year, month, day, and hour, minute, and second.
-- There are many different date representations in Oracle like ('DD-MON-RR' 'DD-mm-YY' CDD/mm/YYYY',etc.)
-- The default date formate in oracle is 'DD- MON-RR'.
/*
    * DD: is a two digits numeric representation of the day of the month it must be an numeric value between 1 and 31 
    * MM: means abbreviated name of month such as June may etc.
    * YYYY: mean four digit like 2024.
    * YY & RR : they represent the year of that date like 24 in 2024 however they shall only two digits of the year
       so what is the difference between the Oracle double YY and double RR date.
       
 ----->>> double y shows the last two years of a year for example 99 for 1999 depending on which year we are in the present
 ----->>> the double RR date format is a different time format element that allows us to show 20th century days but 
                 in the 21st century by specifying only the last two digits of the Year.
        -->> the last simple converts 2 digits into four digits by rounding but it measure different data values 
                  depending on which date you are in or which date you are interested this might seem with complicated or difficult to 
                  understood at first please try to understand as much as possible because this might be a question in job interviews.
                  * first of all please keep in mind that the last digits in both representations never change only the first two digits change
                     I mean only the century may change depending on the year you are in and the year you are looking for
        -->> the centure( the first to digits) change depending on what year you are living in while excutin that query and when 
                  the year that you are liikin gfor 
            -> if the specified year the year in th equery is in th first half of the century (if the last two digits in the year in 
                 the first half of the centure), like 22 in 1922 then the first half mean between 00 and 49 and the curren tyoar now is in 
                 the first half tooo then the centure ( the first two difits in the year) like 19 in 1922 will be the same don't change.
            -> if the spcified year in the query in the first half of th cntur and th current year now is in th secand half and the current
                 year now is in teh secand half then teh century two digits increases by one.
            -> if the specified year the year in the query is inth secand half and current year is in teh same half(the secand half)
                 then the centure digits the first two digits don't change.
            -> if th specified year the year in teh quey is in th secan dhalf beytween 50 and 99  and the curren tyear is in the 
                 first half theb th century digits decrease by one/
 --EXAMPLES     CURRENT YEAR           ||               SPECIFIED YEAR            ||         RR                 ||          YY
                                1990                                         15-Jun-95                             1995                         1995   
                                1990                                         15-Jun-24                             2024                         1924   
                                2024                                         15-Jun-24                             2024                         2024         
                                2024                                         15-Jun-95                             1995                         2095          
              
              --> the double yy always use the same current centure.
              
    # by the way the data values do not have to be in this order I mean this one first followed by month then years 
        now they don't have to be like that all the time if you type month first you will see month first or if you 
        type it at the end of date value you will see the month at the end of the date.
*/


---------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------Date Datatype-------------------------------------------------------------------------
-- Date: the stander data type that stores date values in oracle. It's also stores time.
-- Timestamp: is the data type that stores year, month, dat, hor, minute, secands as well as fractional secand.
-- timestamp with time zone: this data type is the same as time stamp, butit tores the time zone along with it.
-- timestamp with local time zone: this datatype is similar to Time stamp with time zone, but the sstored time zone is databses's time zone

--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------Oracle Date Functions------------------------------------------------------
-- SYSDATE: returns the current date and time of the OS where the Oracle Database is installed.
-- CURRENT DATE : returns the current date and time of the place where the user's session is logged in from.
-- SESSIONTIMEZONE: returns time zone of the user's session.
-- SYSTIMESTAMP: returns the date and time of the database.
-- CURRENT TIMESTAMP: returns current date and time from user's session.

--# if there is a word fcurrent or session in the name of function this mean the current time zone of the user(his location)
--# if the function name includes the word sus, it means the date and time od the system where the data base installed.
Select current_date, sessiontimezone, systimestamp, sysdate, systimestamp, current_timestamp 
from dual;

select current_date 
from dual;
select sysdate 
from dual;
select sessiontimezone 
from dual;
select systimestamp 
from dual;
select current_timestamp 
from dual;

-----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Arithmatic operation with date----------------------------------------------------------
--We can add or subtract a number from a date, and the result of this operation will also be a date.
-- for example if we add 2 to the sysdate the output will be a date which is two days after the systems
-- Any time we add the numbet to a date value or subtract form it, oracle assumes that number represents the number of days.
select sysdate + 4 from dual; -- it return 4 days after today.
select sysdate - 4 from dual; -- it return 4 days before today.

-- SO WHAT IF WE WANT TO ADD HOURS OR MINUTES OR SECANDS TO THE SYSDATE?
/*
    * it's depend on math, so if you want to add an hour later then as we know the number tehat we add represents days so 
      we could divide teh day to 24 hours so to add an hour we could add 1/24.
    --> and to add one minute we could add 1/(24*60)
*/
select sysdate+1/24 
from dual;
select sysdate + 1/(24*60)
from dual;

-- by subtraction we could get how many days or years that the employees work in the company 
select sysdate -  hire_date as number_of_days
from employees;
/*  
    * here this quey will return the number of days that each employees work in teh company, but if we see the ouput we will find that
       the ouput has a decimal numbers as it also subtract hours, minuts, and secands from the hire_date until now.
    * we could use a trunc function to get the ingteger number or use round function.
*/
select trunc((sysdate - hire_date)/360)
from employees;--here we will get th number of years that each employeee working in the company.  


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------Date manipulation functions------------------------------------------------------------------------------------
--Date functions operate on dates and return dates, numbers or texts.


 ADD_Months(Date, n): 
-- This function add a specified number of months to a specified date.
-- This parameter N is an integer number.
-- The value returned from this function is the input data value, plus the number of months you provide.
select Add_months('18 -sep-23', 3)
from dual;-- 15-SEP-22
-- this query add three months to the specified date.
/*
    - if you pass in the 18th of September 2023 as the date parameter,and add three months to it, the function will return.
         The 18th of December 2019 three, which is three months after the input date.
    * if the month exists December, it will increase the year as well.
    * By the way, if the specified day is the last day of the month, the Edmans function may also change the day as well.
        In such situations, it changes the day to the last day of the target month.
    * the ADD_Months function accept negative values in the numbe of months to be added, but in thsi xase the date will 
       be subtracted by the number of months
*/
select add_months('30-jun-20', 2)
from dual; -- 31-AUG-20
select add_months('30-dec-23', 2) 
from dual; --29-FEB-24
select add_months('30-dec-23', -2) 
from dual; --30-OCT-23
 --So we can add or subtract any number of months from a date using the Add-months function.
                                                --------------------------------------------------

Months_between(date1, date2)
--It accepts two arguments in data format and returns to monts between them.
-- If date one is greater than date two, the value will be positiv, Otherwise, it will be negative.
-- So months between returns, how many months have passed between two given dates?

select months_between('30-jun-20', '31-aug-20')
from dual;--     -2

select months_between( '31-aug-20' ,'30-jun-20')
from dual;--     2

                                                --------------------------------------------
Round(date, [formate])
-- round a date/time value to a specified element.
-- This function accepts two parameters, which are a date value and a format.
-- The first parameter must be added value or an expression returns a date.
-- And the second parameter is the format.
/*
    * The format argument is a text that specifies which unit of the date it should be rounded.
    * It can be a day, month or a year, etc., or it can be augmented as well, since it's an optional parameter.
    * If you don't specify in a format parameter here, the date is rounded to the nearest day by default.
    * usually the round function is used with month or a year parameter.
*/
select hire_date, Round (hire_date, 'month') as rounded
from employees;
/*
    * if I want to round the specific date by month, the return date will be the first day of the nearest month.
    * If the day is greater of Fifteen, the returning date will be rounded to the first day of the next month.
       Otherwise, the move will be the same, But the day will be around to the first day of the present month.
    * If I use the round function with the year parameter this time, the month and the day will be rounded to the 
           first day of the existing year or the first day of the next year, depending on the specified date you provide.
    * If the specified date is about half of the year, it will be rounded to the first day of the next year, Otherwise it will be 
          rounded to the first day of the current year.
    * For example, if the month is July or any month after that, it will be around to the 1st of January at next year,
         otherwise it will be around to the 1st of January, But this time, the year will be this year I mean, the year 
         in the specified date.
*/

                                                        -------------------------------
Trunc(date, [format])
-- truncate a date/time value to specific element.
-- if you don't specify a format, then the function will truncate the value to the nearest day.
select trunc(sysdate, 'month')
from dual;
select trunc(sysdate, 'Year')
from dual;
/*
    * if the formate is a month then it return the first day of the current month no matter what is the value of the day.
    * if the formate is a year then it return teh first day of the current year no matter what is teh value of days or month
*/
select employee_id, hire_date, trunc(hire_date, 'month') as truncte, round(hire_date, 'month') as rounded
from employees;

                                                    ----------------------------------------
Extract(date_component form date)
-- extracts a specific part of a date and returns it.
--The extract function except one parameter, But this time that parameter is a bit different than the others.
--For this parameter, we first write the date component, And then from and then the date, But notice that these are
    --all one parameter because there is no common between them.
-- The date component is a keyword that represents the part of the day to extract, such as day, month,year, etc..
select extract(month from hire_date)
from employees;
-- if the extracted is month then it return the number of that month in the specified date.
select extract(year from hire_date)
from employees;-- return the year.
select extract(day from hire_date)
from employees;

                                                    --------------------------------------------
 next_day(date, day_of_week)
 --return the date of th next specified weekday.
 -- It accepts two parameters which are date is a date to start form and the day of week which is the name of the day you are looking for.
 select next_day(hire_date, 'tuesday')
 from employees;
 
                                                            ---------------------------------
last_day(date)
-- return teh last day of the month.
select last_day(sysdate)
from dual;



-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------Conversion Functions---------------------------------------------------
--Oracle Conversion Functions convert one data type into another.
-- there are two type of conversion functios:
/*
    * Implicit Conversion: Oracle server automatically converts some data type to the required one.
        Although implicit conversion converts some data types automatically, it is recommended to use
        the explicit conversion functions to ensure the reliability of SQL statements.
    * Explicit Conversion: Explicit conversions are done using the conversion functions explicitly.
*/
                                                                            --------------------------------------
 Implicit conversion
 -- A VARCHAR2 or CHAR value is converted to a NUMBER or a DATE by the Oracle server automatically.
-- A NUMBER or a DATE value is automatically converted to character data by the Oracle server.
-- The implicit conversions are performed only if the characters match with a valid number or date.
select * from employees 
where  salary > '15000';
-- here as we see the value 15000 is between single quots so it's a string, but the oracle server convert it to a numeric 
    -- data type to match with salary column data type which is a number. this process of conversions happen automaticly 
    -- to preform the condition.

select * from employees
where hire_date = '17- jun-03';
-- as we see here the value '17- jun-03' is a string value which be converted to a date by oracle server.
/*
    * THE WAY OF CONVERSION IS THE ENGIN CHECK THE DATA TYPE OF COLUMN HIRE_DATE AND FIND THAT IT'S
       A DATE AND CHECK THE DATA TYPE OF THE VALUE WHICH IS STRING SO IT'S CONVERT IT TO DATE TO MATCH TEH DATATYPE OF COLUMN.
*/
select first_name || employee_id
from employees;
-- here we concate a string column with numeric column so the oracle server convert the data type of numeric column to a character column.

select first_name || hire_date
from employees;
--  convert dateinto string.

---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------Explicit conversion-----------------------------------------------------
-- Used for converting data type of a value to another data type explicitly.
-- There are 3 functions for explicit data type conversion which are:
TO_CHAR()                                           TO_NUMBER()                                                             TO_DATE()
                                                                    
                                                                    -----------------------------
                                                                    ------------------------------
TO_CHAR()
-- used to converts the number and date data type into a varchar2 data type in a specified format.
-- SYNTAX
    TO_CHAR(date || number, [format_model], [nls_parameters])
/*
    * this function accept three parameter:
     - date || number: the value that to be converted into varchar2 type. it can be a date or a number.
     - format_model The input value is converted to the VARCHAR2 data type in the specified format model.
       if you don't specifie the format then the engin will use the defult format
     - nls_parameter Specifies the language for the names and abbreviations of the days and months
            (E.g., Monday Mon, January Jan, etc.).
           if you don't specifie the nls the engine will use the default language.
*/
--THE TO_CHAR FUNCTION IS CASE SENSITIVE.
select to_char(hire_date, 'YYYY')
from employees;
-- AS we see here teh format si the year in th full stander so the output is the year of hireing for each employee.

=====================================================================================
==================================================================================
--DATE _FORMAT                                                                                                                   |                                                                                                                                     
'YYY'=>> Four digit representation of a year (2021 ).                                                                                                                             
'YY || RR'=>>The last two digits of a year (21).                                                                                                                            
'year'=>> Full spelling of a year in English (Twenty twenty-one).                                                                                                                           
'MM'=>>Two digits of the month (11).                                                                                                                         
'MON'=>>Three letter representation Of month ('SEP').                                                                                                                        
'MONTH'=>>The full name of the month in English ('SEPTEMBER').                                                                                                                        
'DD'=>>Numeric day of the month (27).                                                                                                                        
'DY'=>>Three letter representation of the days of the week ('SAT').                                                                                                                        
'DAY'=>>Full names of the days of the week in English ('SATURDAY').                                                                                                                        
'HH'(HH12 || HH24)=>>Two-digit hour in 12-24 format (07),(22).                                                                                                                      
'MI'=>>Two-digit minute (48).                                                                                                                       
'SS'=>>Two-digit second (52).                                                                                                
'TH'=>>Ordinal Number (DDTH 5TH).                                                                                                                        
'SP'=>>The spelling of a number (DDSP -> FOUR).                                                                                                                         
'spth || thsp' =>>The spelling of an ordinal number (DDSPTH FOURTH).                                                                                                                            
=================================================================================================================
========================================================================================

SELECT to_char(to_date('10-jun-23'), 'dd-Month-yyyy')
from dual; --'10-Jun      -2023'
-- In this query we want to convert the date'10-may-23' to a varchar2 using to_char() function with 'dd-mon-yyyy' format.
select to_char(to_date('10-jun-23'),'YY')
from dual;--23
select to_char(to_date('10-may-23'),'RR')
from dual;--23
select to_char(to_date('10-jun-23'),'Year')
from dual;--23
select to_char(to_date('10-jun-23'),'mm')
from dual;--06
select to_char(to_date('10-jun-23'),'mon')
from dual;--'may'
select to_char(to_date('10-jun-23'),'month')
from dual;--'june     '
select to_char(to_date('10-jun-23'),'Month')
from dual;--'May      '
select to_char(to_date('10-jun-23'),'DD')
from dual;--'10'
select to_char(to_date('10-jun-23'),'Dy')
from dual;--'Sat'
select to_char(to_date('10-jun-23'),'Day')
from dual;--'Saturday '
select to_char(to_date('10-jun-23'),'HH')
from dual;--'12'
select to_char(to_date('10-jun-23'),'MI')
from dual;--'00'
select to_char(to_date('10-jun-23'),'SS')
from dual;--'00'
select to_char(to_date('10-jun-23'),'DDTH')
from dual;--'10TH'
select to_char(to_date('10-jun-23'),'DDSP')
from dual;--'TEN'
select to_char(to_date('10-jun-23'),'DDspth')
from dual;--'TENTH'
select to_char(to_date('10-jun-23'),'ddthsp')
from dual;--'tenth'

-----------------------------------------------------
select to_char(hire_date,'Day/Month/Year')
from employees;
select to_char(hire_date,'Month')
from dual;
select to_char(hire_date,'yyyy')
from dual;
select hire_date, to_char(hire_date, 'Mon-YYYY')
from employees;
select hire_date, to_char(hire_date, 'Dy-Mon-YYYY')
from employees;
select hire_date, to_char(hire_date, 'Day-Mon-YYYY')
from employees; 
select hire_date, to_char(hire_date, 'Day-Month-YYYY')
from employees;
select hire_date, to_char(hire_date, 'Day-Month-Year')
from employees;
select hire_date, to_char(hire_date, 'Day-Month-Year  HH12')
from employees;
select hire_date, to_char(hire_date, 'Day-Month-Year  HH24')
from employees;
select hire_date, to_char(hire_date, 'Day-Month-Year  HH-MI')
from employees;
select hire_date, to_char(hire_date, 'Day-Month-Year  HH-MI-SS')
from employees;
select hire_date, to_char(hire_date, 'DDTH-Month-YY  HH-MI-SS')
from employees;
select hire_date, to_char(hire_date, 'DDTH-MMTH-yy  HH-MI-SS')
from employees;
select hire_date, to_char(hire_date, 'DDsp-MMTH-yy  HH-MI-SS')
from employees;
select hire_date, to_char(hire_date, 'DDthsp-MMspth-yy  HH-MI-SS')
from employees;

======================================================================================
======================================================================================
--NUMBER FORMAT
'9'==>specifie the number of digits.
'0'==>specifie leading or trailing zeros.
'$'==>display dollar sign.
'L'==>display local currency symbol.
'.'==>display a decimal point.
','==>display comma as indicator.
======================================================================================
======================================================================================

select to_char(27479632, '$999,999,999.99')
from dual;--'  $27,479,632.00'
-- In this query we want to convert 27479632 this numirc value to a varchar2 value in the format '$999,999,999.99' as 
   --we add comma sign and adding a decimal point and adding dollor sign to get the output as astrin gin this format.

select to_char(27479632.6584, '$999,999,999.99')
from dual;--'  $27,479,632.66'
-- here we add some decimal number in our given number and we want o display just two numbers so it rounded it.
select to_char(27479632, 'L999,999,999.99')
from dual;--'           $27,479,632.00'
-- if there is no decimal number it display zeros
select to_char(27479632.6584, '$999,999,999.00')
from dual;--'  $27,479,632.66'
-- here we use the 00 in the decimal place in our format so if there is any number in the decimal place in the givien number
   -- it will be displayed if not it display 00.
select to_char(27479632, '$999999999.99')
from dual;--'  $27479632.00'

-- we could this function to display the new salary for employees.
select salary as "old salary", commission_pct, to_char(salary + salary * commission_pct, '$99,999.99') as "new salary"
from employees;
-- here we find that the output has alot of null values as commission_pct is null and any arthimatic operation with null value gets null.
   --we will solve this problem in the comming function, but until now we will display the employees whoes commission_pct is not null;
select salary as "old salary", commission_pct, to_char(salary + salary * commission_pct, '$99,999.99') as "new salary"
from employees
where salary + salary * commission_pct  is not null
order by "new salary" desc;


                                                                        ====================
                                                                        ====================
TO_NUMBER()
-- It's used to convert a text to a number.
-- syntax
to_number(char, [format_model])
-- THE SAME NUMBER OFRAMT_MODEL APPLYED HERE WITH THE SAME RULE
select to_number('$64,646,363,656', '$999,999,999,999.00')
from dual; --64646363656
-- In this we need to convert from varchar2 the value'$64,646,363,656' to a number, so we have to write the format
   -- of the givien number to convert it.
-- The formate of the givien number must match with the format we use in the function. if the two format are not the same
   -- then it returns an error
select to_number('64,646,363,656', '$999,999,999,999.00')
from dual; --error as the doller sign is not in the givin characters

                                                                ===============================
                                                                ===============================
TO_DATE()
--It's used to convert a varchar2 data to a date in aspecifie format.
-- syntax
TO-DATE(CHAR, [FORMAT_MODEL])
-- FORMAT MOFDEL IS THE SAME AS DATE FORMAT_MODEL THAT WE USE BEFOR.

select first_name, to_char(hire_date, 'day-month-YYYY')
from employees
where hire_date > to_date('jun-25-07', 'mon, dd, YY');


--------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------NVL function--------------------------------------------------------------------
 -- preforming some operations with the null values may result in getting null values or nothing.
 -- The NVL function allows us to replace anull value with a meaingful alternative 
 
 --syntax:
 NVL(Expression1, Expression2)
 /*
    * If the expression1 is null, then NVL() function return expression2
    * if the expression1 is not null, then it return expression1.
    * data type for expression1 msut match with data type for expression2.
 */
-- if you remeber using to to_char function to get the new salary for each employee by add salary to the result of 
   -- multiplling salary to commission_pct, but we faced a problem there as there are some employees not having a commission_pct
   -- they have an null value in the commission_pct in it's column 
-- if you remeber we solve this problem by display the new salary for employees whos have a commissio_pct, but this 
   --soluation is not the best soluation as we need to display the old salary for employees whoed commission_pct is null.
-- to do  that we use the nvl to deal with this problem.
select employee_id, first_name, salary as "old salary", commission_pct,
           nvl(salary + (commission_pct * salary), salary) as "new salary"
           from employees
           order by "new salary" desc;

-- to know the value of commission_pct for each employee as a numeric value we need to replace the null value with zero.
select employee_id, first_name, nvl(commission_pct, 0)
from employees;

------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- NVL2 function----------------------------------------------------------------------------------------------------
-- NVL2 function allow us replace a value when a null value is encountered as well as when non null value is encounterd.
--  syntax
NVL2(Expression1, Expression2, Expression3)
/*
    * if the expression one in not null, it returns expression2, but if the expression1 is null then it return the expression3
*/
--THE EXPRESSION1 DOESN'T HAVE TO BE THE SAME  DATA TYPE AS EXPRESSION2, BUT THE EXPRESSION2 AND 
    -- EXPRESSION3 MUST BE THE SAME DATA TYPE.
select employee_id, nvl2(commission_pct, 'HAS', 'HASN''t')
from employees;
-- This query retrun the string HAS if the commission_pct is not null, and return HASN't if the commission_pct is null.

------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------NULLIF Function----------------------------------------------------------------------------------------------------
--syntax
NULLIF(Expression1, Expression2)
-- It's compare expression1 and expression2 if they are equal to each other it returns null else it returns expression1
-- these expressions must be in the same data type.
select first_name, last_name, nullif (length(first_name), length(last_name))
from employees;
-- in this query the output will be null if the length of first_name of the employee is the same lenght of his last_name
-- we could use the same function to get the first_name and last_name and length for the employees whoes first_name
    -- and last_name are the same.
select first_name, last_name, length(first_name)
from employees
where nullif(length(first_name), length(last_name)) is null;

------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Coalsece function----------------------------------------------------------------------------------------------------
-- It accepts a list of arguments and returns the first one that evaluates to a non null value.
--syntax
Coalesce(Expression1, Expression2, Expression3, ..........., ExpressionN)
/*
    * it check the Expression1 if it not null it will be returned if it null it check the Expression2 if it not null it will be returned 
       if not it check Expression3 and so on.......
    * all arguments in this functino must be in the same data type.
*/
--IF ALL EXPRESSIONS ARE NULL THEN THE FUNCTION RETURNS NULL.
select city, state_province, coalesce(state_province, city)
from locations;
-- in this query it check if the employee has a state_province then it will be returned if not his city will be returned.


------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Condition Expressions------------------------------------------------------------
-- Condition expressions perform differant actions or cmputations depending on whether a program is specified condation
    -- evalutes true or false.
-- Oracle provides two conditions expression functions whic are CASE and  DECODE  to make decisions based on condaitions.

----------------------------------------------------CASE Expression------------------------------------------------------------
-- Case preforms an if-then-else check whitin an SQL statement 
--Syntax
Case expression 
                          when compersion_expression_1 then result1
                          when compersion_expression_2 then result_2
                          :
                          :
                          when compersion_expression_N then result_N
            else result
end;
/*
    * It's the same as if and if else in the programming.
    * The expression after case keyword is the expression that you will compare to the conditions after when statement.
    * If the expression is equal to compersion_expression_1 then it returns the result_1, if not it check the compersion_expression_2
        and so on.
    * If the expression is not equal to any of compersion_expression then it return the result after else keyword.
    * Expression and comopersion expressionns must be in the same data type, but the result may be in other type 
    * The results must all be in the same data type.
    * The case can be used in both select and where clause.
*/

--THERE ARE TWO WAYS OF USING THE CASE EXPTRSSIONS WHICH ARE 
-- 1- simple case expression.
-- 2- searched case expression.

--------------------------------------------Simple case 
--The expression is stated at the begging, and the possible results are checked in the condition patameters.
case first_name 
                        when 'Alex' then 'Name is Alex'
                        when 'John' then 'Name is John'
        else 'Another'
end;
------------------------------------------------------------searched case 
-- The expressionare used within each conditionwithout mentioing it at the start of the case expression.
 case 
        when first_name = 'Alex' then 'Name is Alex'
        when first_name = 'John' then 'Name is John'
     else 'Another'
end;
--THE ADVANTAGE OF THIS TYPE IS WE CAN USE DIFFERENT COMPERSION WITH EACH WHEN STATEMENT.
case 
        when first_name = 'Alex' then 'Name is Alex'
        when Salary > 10000 then 'salary is greater than 10000'
    else 'Another'
end;
/*
    * In searched case expression the expression after each when statment not have to be in the same data type as you could 
        different data type after eache when statment with different data type, but all teh result must be in the same data type 
    * else clause is optional in both type.
*/
select first_name, last_name, job_id, salary, hire_date,
           case job_id
                            when 'ST_MAN' THEN salary * 1.2
                            when 'SH_MAN' THEN salary * 1.3
                            when 'SA_MAN' then salary * 1.4
                    else salary
            end " Updated Salary"
    from employees ;
/*
    * In this query to understand what it do we have ot start formthe formkeyword which mean formtable employees
        we want ot select first_name, last_name, job_id, salary, hire_date, and there is an extra column with elias name "updated salary"
        this column has teh value of new salary depend on the value of job_id as we use case expression to check the value job_id
        if it equal to 'ST_MAN' then teh new salary will be 20% increase, if it equal to 'SH_MAN' the new sa;ary will be 30% increase
        if it equal to 'SA_MAN' then new salary will be 40% increase else the new salary will b eh same as the old salary.
*/
-- this example we use the simple case expression

-- the same example by searched case
select first_name, last_name, job_id, salary, hire_date,
           case 
                    when job_id = 'ST_MAN' THEN salary * 1.2
                     when job_id = 'SH_MAN' THEN salary * 1.3
                    when job_id = 'SA_MAN' then salary * 1.4
                else salary
         end " Updated Salary"
    from employees ;       
--************************************Important note**************************************************************
/*
    * when using searched case and we have different expressions with each when statement, if two expressions affect 
        same row teh first one will be the only one to excuted. this mean these conditions are evaluated one by one startting from the 
        first one to the end, and if on condition is satisfied, then the related result is returnd and the rust is not valuated to the same rows again.
*/
select first_name, last_name, salary,
            case 
                    when job_id = 'AD_PRES' then 1.20 * salary 
                    when last_name = 'King' then 2 * salary 
            end as "new salary "
from employees;
-- In this query there are two cnditions in the case expression both of them satisfiy with the employee Steven King as he
    -- work at 'AD_PRES' and his last name is King, so engin will excute the first result with the  first statement and the secand 
    -- Result will not excuted as it affect the same Row.

select first_name, last_name, job_id, salary, hire_date         
from employees 
where (case
                            when job_id = 'ST_MAN' and salary > 5000 THEN 1
                            when  job_id = 'SH_MAN' and salary > 7000 THEN 1
                            when  job_id = 'SA_MAN' and salary > 10000 then 1
                    else 0
            end) = 1
--In this query we need to get first_name, last_name, job_id, salary, and hire_date for employees whoes job_id = 'ST_MAN' and salary > 5000
   -- OR job_id = 'SH_MAN' and salary > 7000, OR  job_id = 'SA_MAN' and salary > 10000.
   
   
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Decode Function--------------------------------------------------------------------------------------------------------
/*
    * The decode function is a function that is specific to oracle easy to use, and an alternative to the case experssions.
    * It's used to provide an IF-THEN-ELSE logic in SQL.
    * The different between the case expression and Decode is when we use the case expression we write too much but 
       the Decode function is alot simpler. also the case is an expressio whereas Decode is a function .
*/
--Syntax
Decode(column || expression, search1, result1, search2, result2,................., default);
/*
    * The first parameter is column name or an expression, then search expression1 comes if it satisfy then it returns the result1
        then the search expression2  comes if it satisfy then it returns the result2 and so on...
    * The default which is like the else statement, if all search expressions not satisfy the default will be returned.
    * we could put number of search expressions as we want.
    * All the search expressions must be in the same data type.
    * All the results expressions must be in teh same data type.
    * The search and result can be in different data type.
*/
select first_name, last_name, job_id, salary, hire_date,
            decode(job_id, 'ST_MAN', SALARY * 1.20,
                                     'SH_MAN', SALARY * 1.30,
                                     'SA_MAN', SALARY * 1.40,
                                      salary) as "updated salary"
from employees;
-- This query is the same as we use in the case expression, but here we don't need to use when statement with each condition.



--------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------Group Functions---------------------------------------------------------
-- group functions is also called multiple row functions or Aggregate functions.
--WHY DO WE NEED TO USE THE GROUP FUNCTIONNS?
/*
    * Assume that you're working in a company, your mannager want to know how may employees that company has.
        or may request from you to find the employees who earn the maximum salary or may wonder the avarage salary 
        your company pays for its employees.
*/
-- these kind of informations can easily be acquired using the group functions.
group_function([distinct || All] column || experssion)
--the distinct and all key words are optional, but we have to know the t the distinct wrote inside the group function before the patameter
     -- name not outside the function.
-- The group functions operate on multiple rows and return one result for each group.
-- group functions usally used after select key word, and mulitple group functions can be used in a single select statement.

-- ALL GROUP FUNCTIONS IGNORE THE NULL VALUES, BUT YOU CAN USE THE NVL, NVL2, COALESCE, DECODE, OR CASE EXPRESSION
   -- TO HANDEL THE NULL VALUE.
   
   
--------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------AVG Function----------------------------------------------------------------------------------------------
--The Avg function is stands ofr average. It's used to calculate teh average value of the columns or expressions.
AVG([Distinct || All] expression)
--It's exclusively used with numeric data.
-- The distinct and all key words can be used to handle the duplicate values.
--The all is the defult, so if you didn't write any thing ti will calculte and consider you put all.
-- Its's ignore null values, but if you want to work with null value like you may want to change all null values to zero and work with them 
    -- you could use NVL or NVL2....
select AVG(salary), avg(all salary ), avg(distinct salary)
from employees;
-- In this query we could use round function to make the results have more sence.

select Round(AVG(salary), 3), round(avg(all salary ), 3), round(avg(distinct salary), 3)
from employees;
/*
    * as we see here in the results the firt value and the secand are be the same as in the frist functions it we did't put all 
         or use distinct key words but the engine use the -All- as a default, but in the third one it will ignor the duplicate value
         so teh result will change as there are some duplicate values in salary column.
*/

select Avg(commission_pct), avg(nvl(commission_pct, 0))
from employees;
/*
    * this query show the affect of nvl values as in the first result we didn't work with teh vull values as avg function ignore
         it, but in the secand result as we use the vul function which convert all null values to zero so it affect the result of average.
*/


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------Count Fuction--------------------------------------------------------------------------------------------
--Returns the number of rows returned by a query.
-- Syntax
count([Distinct || All] exprission);
-- You can use the DISTINCT keyword to count the distinct values of the expression, or ALL keyword to count all rows.
-- The all keyword is default.
Count(*):
-- '*' represents all rows including the NULL values, and duplicate values.
--If a column name is used with the Count function, this time, the NULL values are ignored.
Count(first_name);
-- This way will ignore all null values like all the agreget functions.
-- We can use the NVL NVL2 COALESCE CASE or DECODE functions to handle the NULL values.

select count(*), count(manager_id), count(all manager_id), count(distinct manager_id)
from employees;
/*
    * The output of this query will be four values the first one is the number of all rows include null values, and duplicate values.
       the secand value will be the number of all manager_id even when we didn't use the all keyword the all we be used as default.
       the third value will be the same as the secand one.
       the fourth value will be the number of dintinct manager_id which mean the number of manger_id by ignoring the 
           null values and the duplicate valules.
*/


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------Max Function----------------------------------------------------------------
--The MAX function returns the maximum value of an expression or column.
--Syntax
Max(expression);
-- It is used with numeric, character or date data types.
-- Using the DISTINCT or ALL keywords with the MAX function is useless.
-- The null-related functions can be used with the MAX function to handle the NULL values.

-- There is no need to use distinct or all keyword with th emax function as it returns one value from the column.
select max(salary), max(hire_date), max(first_name)
from employees;
--This query will return the maximum salary from employees, the maximum hire date(the lated one), and the maximum first_name.


------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Min Function----------------------------------------------------------------------------------------------------
-- Used for getting the minimum value of the expression or column.
-- Syntax
Min(expression)
-- Used with numeric, character and date data types.
-- Using the DISTINCT or ALL keywords with the MIN function is useless.
-- The NVL, NVL2, COALESCE, CASE or DECODE functions can be used to handle the NULL values.

-- There is no need to use distinct or all keyword with the min function as it returns one value from the column.

select min(salary), min(hire_date), min(first_name)
from employees;
--This query will return the minimum salary from employees, the minimum hire date(the lated one), and the minimum first_name.


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------Sum Function--------------------------------------------------------------------
-- Used for getting the sum of the column or expression you provide it with.
-- Syntax 
Sum([distinct || All] expression);
-- The ALL and DISTINCT keywords can be used to handle duplicate values.
-- It is exclusively used with numeric data.
-- The NVL, NVL2, COALESCE, CASE or DECODE functions can be used to handle the NULL values.

select sum(salary), sum(distinct salary)
from employees;
-- this query will get how much mony a company pays to its employees.


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------LISTAGG Function------------------------------------------------------------------------------------------------
-- The LISTAGG is used to aggregate strings from data in columns in a database table.
--WHAT IS STRING AGGREGATION?
/*
    * it's a technique similar to concatentation, but you can use grouping, and it also allows us to order the
        elements in the concatenated list.
*/    
-- Concatenates values from separate rows into a single value.
-- Transforms data from multiple rows into a single list of values separated by a specified delimiter.
-- Syntax
Listagg(column, [Delimiter]) within group (order by sort_expression);
-- The delimiter is optional, if not specify there is no value will be used.

select listagg(first_name, ', ') within group(order by first_name)
from employees;
-- in this query we need to display all employees' first_name in one row(one line) sperated by a comma, and sorted by the first_name values.

select listagg(city, ',  ') within group (order by city)
from locations
where country_id = 'US';
-- This query will get the locatios where the company has offices or ware houses in the U.S.


-----------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Grouping Data----------------------------------------------------------------------
-- If i want to get the average slary for each job_id and use the next query,  I will get an error
select job_id, Avg(salary) from employees;
-- As we have here an aggregate function with a column in the same select clause and this is not legal.
-- The way to dao so is by using group by clause.
                                                                -----------------------------
                                                                
---------------------------------------------Group by ---------------------------------------------------------------------
-- creating groups of values using the group functions.
-- Syntax
select column_name, aggregate_function
from table_name 
where condition
group by column_name
order by sort_expression;
/*
    * if ther is a where clause the group by must be after the where claues.
    * TEH COLUMN AND THE EXPRESSIONS WHICH IN THE SELECT STATEMENT WITH THE AGGREGATE FUNCTION MUST
        BE IN THE GROUP BY CLAUSE, HOWEVER THE COLUMN AND EXPRESSIONS WRITTEN IN TEH AGGREGAE FUNCTION DON'T
         NEED TO BE WRITTEN IN THE GROUP BY CLAUSE.
    * We can use more than one expression -or column- in a GROUP BY clause.
    * The SELECT clause cannot have any other individual columns than what is used with the GROUP BY clause.
    * We don't need to use all the columns used with the GROUP BY clause in the SELECT statement.
    * The group by clause group the rows not columns.
    * In the SELECT statements, we can use the group functions with different columns than the GROUP BY has.
    * We can use as many group functions as we want.
    * Column aliases cannot be used with the GROUP BY clause.
    * The ORDER BY clause cannot have any other individual columns than the GROUP BY clause has.
*/

select job_id, Avg(salary)
from employees
group by job_id;
-- This query will return the hob-id as a group with it's average salary.

select job_id, department_id, manager_id, Avg(salary)
from employees
group by department_id, job_id, manager_id;


select job_id, department_id, sum(salary)
from employees
group by job_id; -- Error
-- this query will get an error as the columns in the select clause not in the group by clause.
-- to handle it we use the next query.
select job_id, department_id, sum(salary)
from employees
group by job_id, department_id; -- it's run
-- in this query we use a column departmnet_id and job_id in select clause and in goup by clause.

select job_id, sum(salary)
from employees
group by job_id, department_id; -- it's run 
-- in this query we use a column departmnet_id in the group by clause, but we didn't use it in the select clause and this also work.

select department_id as department, avg(salary)
from employees
group by department; -- error 
--This will get an error as the column aliases cannot be used with the group by, because ther is an order for excution the query in database
   -- from 
   -- where 
   -- group by 
   -- having
   -- select 
   -- order by
-- As we see the group by excuted before select so the group by cannot see the alise.
-- we have to know that the where clause excute before the group by so the condition excute first then the group by 
   -- applied for the output from the where condition.

select job_id, avg(salary) from employees
group by job_id;
/*
    * This query will return the average salary for each job_id, but what if i want to filter the output like if i want 
        only the average salary for each job_id in condition that the average salary is greater thean 10000
        if we the next query we will get an error.
*/
select job_id, avg(salary) from employees
where avg(salary)  >10000
group by job_id; -- Error
-- This will get an error as we cannot use the aggregate functions in where clause.

-- THE  GROUP FUNCTIONS CANNOT BE USED IN  WHERE CLAUSE.
   -- this because the where clause excute before group by clause.

/*
    * we can use the having clause to filter data after it has been grouped.
    * The having clause work simalar to where clause, but the where clause filters rows whereas having clause filter grouped data.
    * The having clause appears after teh group by clause and before the order by clause 
*/
select job_id, avg(salary) from employees
group by job_id
having avg(salary) > 10000;
--This query will return the job_id and the average salary for each group under the condition of the average salary for the job_id greater than 10000.

--WE COULD USE HAVING CLAUSE BEFOR GROUP BY CLAUSE, BUT USING IT AFTER GROUP BY IS PREFERRED.
-- the where clause and having clause can also be used togther in a query.
select job_id, avg(salary) from employees
where salary > 5000
group by job_id
having avg(salary) > 10000;

-----------------------------------------------------Nasted group functions-------------------------------------------------------
-- group function can be nasted.
-- the output of the inner function is the input of the outer function.
-- we have to use group by clause when using nasted group functions.
-- group function can be nsted to a depth of two.

select department_id, avg(salary) from employees
group by department_id;
--In this query we will display all the departmetn_id with the average salary in for each department.
-- what about if i want the maximum value from this output? or i want the maximum average salary?
    -- we could use neasted group function like max(avg(salary)) this nasted fruntion will get the result.

select department_id, max(avg(salary)) form employees
group by department_id; -- Error
-- This query gets an error as we can't use an indviual column name with the nasted group function in the select clause.

select max(avg(salary)) from employees; -- error
-- even if we delete the department_id formo the select clause, but we also cannot use the nested group function without group by clause.
 
 select max(avg(salary) )from employees
 group by department_id; -- 19333.333333333333
 -- this query will get the correct value as we didn't use any indviual column with the nasted group function in the select clause
      -- and we also use the group by clause.
