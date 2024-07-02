-- string functions
use company;

-- length of string
select char_length("hello");
select char_length("hello welcome");
select char_length(345435345);

select char_length("hi     ");
select length("hi     ");
select length(343.343534); -- coverts into string and gives length
select character_length("hi     ");

-- display salary digits of employees 
-- select id,salary,length(salary) from emp;

-- find employees whose salary is more that 4 digits.
-- select id,salary from emp where length(salary)>4;

-- contatenation joins columns data or 
select concat("hello","welcome");

-- display emplpoyee name along with employee id (in single column)
-- select id,name from emp;
-- select concat(id," ",name) as 'Employee Id and Name' from emp;

-- upper(),ucase() and lower(),lcase()
select upper("hello Welcome");
select ucase("hello Welcome");
select lower('hellO Welcome');
select lcase('hellO Welcome');

-- select upper(name) from emp;

-- reverse()
select reverse("python");
select reverse(12345);

-- replace()   case-sensitive
select replace("python","p","j");

-- display employees name with address but show address in code wise. i.e(mumbai can be mu,delhi can dh)
-- select name,address from emp;
-- select name,replace(address,"Mumbai","mu") from emp;

-- select name,
-- case 
-- when address="mumbai" then replace(lower(address),"mumbai","mu") 
-- when address="delhi" then replace(address,"delhi","dh")
-- end "address"
-- from emp where address in('mumbai','delhi');


-- left() and right() results sepecified number of charactes or data
select left("good morning",4);
select right("welcome",4);

-- substring() or substr()
-- substring(string,position) sepecified position till end its will give data
-- substring(string,position,size or length)

select substring("welcome",5); -- specified position as 5th from this to end
select substring("welcome",4);
select substr('welcome', 15);
select substring("welcome",2,4);   -- 2nd start as 1st and end till 4th counting

-- lpad() and rpad()
select lpad("itvedant",10,"BR");
select lpad("itvedant",10,"Borivali");
select lpad("it",15,"hi");

-- display emp name along with dept code as 'HR'

-- select name from emp;
-- select lpad(name,length(name)+3,'HR-') from emp;

-- select name from emp;
-- select rpad(name,length(name)+3,'-HR') from emp;


-- insert(string,postion,chrartoremove,'newstring')
select insert("welcome hello",8,0,"hi");
select insert("welcome hello",8,3,"hi");
select insert("python",2,2,"java");
select insert("hi",2,5,"python");
select insert("hi",2,0,"python");
select insert("hi",3,0,"python"); -- nothing will be added beacuse 3rd position is end

-- trim() left trim(),ltrim(),rtrim()
select trim("       welcome");
select ltrim("       welcome");
select rtrim("       welcome");
select rtrim("welcomes                                    ") as 'rtrim()';














 
 
 