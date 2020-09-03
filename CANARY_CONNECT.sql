--SELECT * FROM AIRCRAFT_TMP WHERE AIRCRAFTCODE IN('777','BBB','CCC')
-- select * from aircraft_tmp;
 --select distinct (countrycode) from passengers;
 --select (airportid, airportname, city, countrycode) from airports;--/THIS DID NOT WORK
 SELECT airportid, airportname, city, countrycode FROM airports ORDER BY AIRPORTNAME;
 SELECT airportid, airportname, city, countrycode FROM airports WHERE COUNTRYCODE='HU' ORDER BY AIRPORTNAME;
 SELECT PASSENGERID, FIRSTNAME, LASTNAME, BIRTHDATE FROM PASSENGERS WHERE PASSENGERID>'134995' ORDER BY LASTNAME ASC;
 SELECT PASSENGERID, FIRSTNAME, LASTNAME, BIRTHDATE FROM PASSENGERS WHERE PASSENGERID>'134995' ORDER BY 3,2 ASC;
 SELECT * FROM PASSENGERS WHERE LASTNAME='smith' ORDER BY 3,2 ASC;
 SELECT * FROM PASSENGERS WHERE LASTNAME='Smith' ORDER BY 3,2 ASC;
 SELECT EMPLOYEEID FROM EMPLOYEES;
 SELECT EMPLOYEEID,LASTNAME FROM EMPLOYEES;
 SELECT EMPLOYEEID,LASTNAME FROM EMPLOYEES WHERE EMPLOYEEID='333';
 SELECT EMPLOYEEID,LASTNAME FROM EMPLOYEES WHERE CITY='Fairbanks' ORDER BY EMPLOYEEID;
 SELECT EMPLOYEEID,LASTNAME FROM EMPLOYEES WHERE CITY='Fairbanks' ORDER BY LASTNAME ASC;
 SELECT COUNT(*) FROM PASSENGERS;
 SELECT COUNT(DISTINCT COUNTRYCODE) FROM PASSENGERS;
 SELECT COUNT(DISTINCT COUNTRYCODE) FROM PASSENGERS;
 SELECT AIRPORTNAME, AIRPORTNAME  AS AIRPORT FROM AIRPORTS WHERE COUNTRYCODE='HU';
 SELECT PASSENGERID, LASTNAME, FIRSTNAME FROM PASSENGERS;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME FROM PASSENGERS ORDER BY PASSENGERID;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME FROM PASSENGERS WHERE PASSENGERID='333' ORDER BY PASSENGERID;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME FROM PASSENGERS WHERE PASSENGERID='333' ORDER BY 1;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME FROM PASSENGERS WHERE PASSENGERID='333' ORDER BY 3,1,2;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE PASSENGERID='333' ORDER BY 3,1,2;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE PASSENGERID='333' ORDER BY PASSENGERID;
 SELECT AIRCRAFTCODE, AIRCRAFTTYPE, FREIGHTONLY, SEATING FROM AIRCRAFT;
 SELECT AIRCRAFTCODE, AIRCRAFTTYPE, FREIGHTONLY, SEATING FROM AIRCRAFT ORDER BY SEATING;
 SELECT COUNT(FREIGHTONLY) FROM AIRCRAFT WHERE FREIGHTONLY=1 ORDER BY SEATING;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE BIRTHDATE>'01-JAN-15'ORDER BY BIRTHDATE ASC;
 SELECT COUNT(PASSENGERID) FROM PASSENGERS WHERE BIRTHDATE>'01-JAN-15'ORDER BY BIRTHDATE ASC;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE LASTNAME='SMITH' ORDER BY BIRTHDATE ASC;--no results, casesensitive
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE LASTNAME='Smith' ORDER BY BIRTHDATE ASC;
 select * from aircraft where seating=400;
 select * from aircraft where seating<>400;
 select * from aircraft where seating!=400;
 select * from aircraft where freightonly!=0;
 select * from aircraft where SEATING<100;
 SELECT PASSENGERID, LASTNAME, FIRSTNAME,BIRTHDATE FROM PASSENGERS WHERE BIRTHDATE IS NULL ORDER BY BIRTHDATE ASC;
 select * from aircraft where AIRCRAFTTYPE LIKE 'B%';
 select * from aircraft where AIRCRAFTTYPE LIKE 'B%';
 select * from passengers where exists (SELECT * FROM PASSENGERS WHERE PASSENGERID='333');
 select SEATING From AIRCRAFT A where exists (SELECT * FROM AIRCRAFT WHERE AIRCRAFTCODE=A.AIRCRAFTCODE AND SEATING > 400);
 --select SEATING From AIRCRAFT A where exists (SELECT * FROM AIRCRAFT WHERE SEATING> 400 );--TOO MANY RESULTS DUE TO NO MAPPING TO THE TABLE
--SELECT LASTNAME FROM PASSENGERS WHERE EXISTS (SELECT * FROM PASSENGERS WHERE PASSENGERID = 333)--/NO MAPPING IN THIS EXAMPLE, GIVES UNDESIRED RESULTS
SELECT * FROM AIRCRAFT WHERE SEATING > ALL (SELECT SEATING FROM AIRCRAFT WHERE AIRCRAFTTYPE='Boeing 777');
SELECT * FROM AIRCRAFT WHERE SEATING > ANY (SELECT SEATING FROM AIRCRAFT WHERE SEATING>375);
select * from routes where ROUTECODE like 'IND%';
select * from routes where DISTANCE BETWEEN 1000 AND 2000;
select * from routes where DISTANCE > 1000 AND DISTANCE < 2000;
select ROUTECODE, DISTANCE, TRAVELTIME, TRAVELTIME * FUELCOSTPERMINUTE AS COST from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST ASC;
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE)+25 AS COST from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST ASC;
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, (TRAVELTIME * FUELCOSTPERMINUTE * 1.1) AS TOTALCOST from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST DESC;
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, (TRAVELTIME * FUELCOSTPERMINUTE * 1.1) AS TOTALCOST from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE IN ('IND-MFK','IND-MYR','IND-MDA') ORDER BY COST DESC;
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, ((TRAVELTIME * FUELCOSTPERMINUTE)/DISTANCE) AS COSTPERMILE from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST DESC;
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, ROUND((TRAVELTIME * FUELCOSTPERMINUTE/DISTANCE),2) AS COSTPERMILE from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST DESC;
--select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, FORMAT((TRAVELTIME * FUELCOSTPERMINUTE/DISTANCE),'C2','en-us') AS COSTPERMILE from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST DESC;--not working
select ROUTECODE, DISTANCE, TRAVELTIME, (TRAVELTIME * FUELCOSTPERMINUTE) AS COST, TO_CHAR((TRAVELTIME * FUELCOSTPERMINUTE/DISTANCE),'999,999.99') AS COSTPERMILE from routes where
    DISTANCE > 1000 AND DISTANCE < 2000 AND ROUTECODE LIKE 'IND%' ORDER BY COST DESC;
select EMPLOYEEID, lastname, city,state, payrate, salary from EMPLOYEES WHERE ROWNUM <=10;
SELECT COUNT (*) FROM EMPLOYEES;
SELECT COUNT (EMPLOYEEID) FROM EMPLOYEES;
SELECT COUNT (DISTINCT SALARY) FROM EMPLOYEES;
SELECT COUNT (ALL SALARY) FROM EMPLOYEES;
SELECT SUM (SALARY) FROM EMPLOYEES;
SELECT SUM (DISTINCT SALARY) FROM EMPLOYEES;
SELECT SUM (ZIP) FROM EMPLOYEES;
SELECT AVG (SALARY) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;
SELECT ROUND(AVG(PAYRATE),2) AS AVG_PAY, ROUND(AVG(SALARY),2) AS AVG_SALARY FROM EMPLOYEES;
SELECT ROUND(AVG(PAYRATE),2) AS AVG_PAY, ROUND((AVG(SALARY)/2040),2) AS AVG_SALARY FROM EMPLOYEES;
SELECT ROUND(AVG(PAYRATE),2) AS AVG_PAY, TO_CHAR((AVG(SALARY)/2040),'$99,999.99') AS AVG_SALARY FROM EMPLOYEES;
SELECT MAX (PAYRATE) FROM EMPLOYEES;
SELECT SUM (SALARY) FROM EMPLOYEES;
SELECT MIN (PAYRATE) FROM EMPLOYEES;
SELECT COUNT(LASTNAME) FROM EMPLOYEES WHERE LASTNAME LIKE 'G%'
SELECT MIN(PAYRATE), MIN(SALARY), MAX(PAYRATE), MAX(SALARY) FROM EMPLOYEES GROUP BY CITY;
SELECT CITY, MIN(PAYRATE), MIN(SALARY), MAX(PAYRATE), MAX(SALARY)
    FROM EMPLOYEES GROUP BY CITY;
SELECT MIN(FIRSTNAME) FROM EMPLOYEES;
SELECT FIRSTNAME, LASTNAME FROM EMPLOYEES WHERE ROWNUM <2 ORDER BY LASTNAME, FIRSTNAME;
SELECT MAX(LASTNAME) FROM EMPLOYEES;
SELECT SUM(SALARY)/COUNT(*) AS AVGSALWNULL FROM EMPLOYEES;
CREATE TABLE EMPLOYEE_TBL
(EMP_ID VARCHAR(9) NOT NULL,
EMP_NAME VARCHAR(40) NOT NULL,
EMP_ST_ADDR VARCHAR(20) NOT NULL,
EMP_CITY VARCHAR(15) NOT NULL,
EMP_ST VARCHAR(2) NOT NULL,
EMP_ZIP INTEGER NOT NULL,
EMP_PHONE INTEGER NULL,
EMP_PAGER INTEGER NULL);
ALTER TABLE EMPLOYEE_TBL MODIFY EMP_ID VARCHAR(10);
ALTER TABLE EMPLOYEE_TBL MODIFY EMP_ID PRIMARY KEY;
SELECT DISTANCE, sourceairportid FROM ROUTES GROUP BY SOURCEAIRPORTID, DISTANCE;
SELECT sourceairportid, SUM(DISTANCE) FROM ROUTES GROUP BY SOURCEAIRPORTID;
SELECT SUM(DISTANCE) AS TOTAL_DISTANCE FROM ROUTES WHERE STARTDATE BETWEEN '01-JAN-13' AND '01-DEC-15';
SELECT SOURCEAIRPORTID, SUM(DISTANCE) AS TOTAL_DISTANCE FROM ROUTES WHERE STARTDATE BETWEEN '01-JAN-13' AND '01-DEC-15' GROUP BY SOURCEAIRPORTID;
SELECT DISTINCT SOURCEAIRPORTID, SUM(DISTANCE) AS TOTAL_DISTANCE FROM ROUTES WHERE STARTDATE BETWEEN '01-JAN-13' AND '01-DEC-15' GROUP BY SOURCEAIRPORTID;
SELECT CITY, TO_CHAR(AVG(PAYRATE),'$99,999.99') AS AVG_PAYRATE, TO_CHAR(AVG(SALARY),'$99,999.99') AS AVG_SALARY FROM EMPLOYEES GROUP BY CITY;
SELECT CITY, ROUND(AVG(PAYRATE),2) AS AVG_PAYRATE, ROUND(AVG(SALARY),2) AS AVG_SALARY FROM EMPLOYEES 
WHERE CITY LIKE 'Ind%' OR CITY LIKE 'Chicago%' OR CITY LIKE 'New York%'
GROUP BY CITY ORDER BY 2,3;
select city, count(*) from employees group by city order by 2 desc,1;
select city, count(*) from employees group by city order by 2 desc;
select city, lastname, avg(payrate) as avgpayrate, avg(salary) as avg_salary
from employees
where city like 'Indianapolis%'
group by city, lastname
order by city, lastname;
select city, lastname, avg(payrate) as avgpayrate, avg(salary) as avg_salary
from employees
where city like 'Indianapolis%'
group by rollup(city, lastname);
select city, lastname, avg(payrate) as avgpayrate, avg(salary) as avg_salary
from employees
where city like 'Indianapolis%'
group by cube(CITY,LASTNAME)
ORDER BY LASTNAME;
select city, avg(payrate) as avgpayrate, avg(salary) as avg_salary
from employees
group by CITY
HAVING AVG(SALARY) =71000
ORDER BY 1;
SELECT CITY FROM EMPLOYEES;
SELECT DISTINCT CITY FROM EMPLOYEES ORDER BY CITY;
SELECT CITY, COUNT(*) FROM EMPLOYEES GROUP BY CITY;
SELECT CITY, COUNT(*) AS CITY_COUNT FROM EMPLOYEES
GROUP BY CITY HAVING COUNT(*) >15;
SELECT CITY, COUNT(*) AS CITY_COUNT FROM EMPLOYEES
GROUP BY CITY HAVING COUNT(*) >15 ORDER BY CITY_COUNT DESC;
SELECT POSITION, 
TO_CHAR(AVG(PAYRATE),'$99,999.99') AS AVG_PAYRATE, 
TO_CHAR(AVG(SALARY),'$99,999.99') AS AVG_SALARY 
FROM EMPLOYEES GROUP BY POSITION;
SELECT POSITION, 
TO_CHAR(AVG(SALARY),'$99,999.99') AS AVG_SALARY 
FROM EMPLOYEES GROUP BY POSITION
HAVING AVG(SALARY)>51314;
select city||','|| state as citystate from employees;
select substr(lastname,1,3)from employees;
--oracle syntax for combining multiple fields
select (lastname || ',' || firstname) as fullname from employees;
select CONCAT(lastname, firstname) as fullname from employees;
--oracle concat can only do two so you have to nest
select CONCAT(concat(lastname,', '), firstname) as fullname2 from employees;
select CONCAT(concat(lastname,', '), firstname) as fullname3, substr(lastname,1,3)as subname from employees;
select (firstname ||'.'|| lastname ||'@perptech.com') as email from employees;
select (lastname || ',' || firstname) as fullname from employees;
select (substr(lastname,1,3) || '-' || employeeid) as newid from employees;
select ('('||substr(phonenumber,1,3) || ')'||
substr(phonenumber,4,3)||'-'||
substr(phonenumber,7,4))
as phone from employees; 
--all at once
select (lastname || ',' || firstname) as fullname,
(substr(lastname,1,3) || '-' || employeeid) as newid,
('('||substr(phonenumber,1,3) || ')'||
substr(phonenumber,4,3)||'-'||
substr(phonenumber,7,4))
as phone from employees;
--dates
select flightstart, flightstart + 1 as DayAdded
from flights
where flightid = 1;
select sysdate from dual;
select systimestamp from dual;
select employeeid, hiredate from employees;
select employeeid, lastname, firstname, Extract(YEAR from hiredate) as year1, extract(MONTH from hiredate) as month1 from employees;
select employeeid, lastname, firstname, TO_CHAR(hiredate,'Month') as monthname from employees;
select employeeid, lastname, firstname, TO_CHAR(hiredate,'Day') as monthname from employees;
select employeeid, lastname,firstname, hiredate, (sysdate - hiredate) as daysworked, ((sysdate-hiredate)/365) as yearsworked from employees;
--julian date
select to_char(sysdate,'J')from dual;
--joins
select employees.employeeid, employees.firstname, employees.lastname, airports.airportid, airports.airportname
from employees, airports
where employees.airportid=airports.airportid
and employeeid<=10;
--now use join syntax
select employees.employeeid, employees.firstname, employees.lastname, airports.airportid, airports.airportname
from employees inner join airports
on employees.airportid=airports.airportid
and employeeid<=10; 
--insert into high_salaries;
--outer joins
select distinct salary
from employees where Salary>=70000;
--not outer join
select distinct e.firstname, e.lastname, e.city, h.salary as high_salary
from employees e, high_salaries h
where e.salary=h.salary and e.state='IN';
--outerjoin indicated by +
select distinct e.firstname, e.lastname, e.city, h.salary as high_salary
from employees e, high_salaries h
where e.salary=h.salary(+) and e.state='IN'
order by h.salary asc;
--outerjoin
--insert into high_salaries
--select distinct salary
--from employees where Salary>=70000;
select distinct e.firstname, e.lastname, e.city, h.salary as high_salary
from employees e left outer join high_salaries h 
on e.salary=h.salary
where e.state='IN'
order by h.salary asc;
--self joins
select a.lastname, b.lastname, a.firstname 
from employees a 
inner join employees b on a.lastname = b.lastname;
--case example
select e.employeeID, e.firstname, e.lastname, 
case when Mod(e.employeeID,3)=0 then 3 when Mod(e.employeeid,2)=0 then 2 else 1 
end 
as mgr_id 
--into EMPLOYEE_MGR 
from employees e 
where e.employeeID<=10;
--now using employee mgr table
select e1.firstname, e2.firstname
from employee_mgr e1, employee_mgr e2
where e1.mgr_id = e2.employeeID;
--excercies13.5
--select e.lastname, e.firstname, a.airportname 
--from employees e, airports a 
--where e.state='IN';
--p212 e13.2
--inner join code to join employees and airports
select e.lastname, e.firstname, a.airportname 
from employees e, airports a 
where e.airportid=a.airportid
and e.state='IN';
--rewrite to using inner join
select e.lastname, e.firstname, a.airportname 
from employees e  
--where e.airportid=a.airportid
inner join airports a on e.airportid = a.airportid
and e.state='IN';
--p212 ex 4, using arithmetic operators
select a.airportid, a.airportname, a.city, f.flightduration, f.flightstart, f.routeid, r.routeid, r.sourceairportid 
from airports a, flights f, routes r 
where a.airportid=r.sourceairportid and f.routeid=r.routeid;
--using inner join language
select a.airportid, a.airportname, a.city, f.flightduration, f.flightstart, f.routeid, r.routeid, r.sourceairportid 
--from airports a, flights f, routes r 
from flights f 
inner join routes r on f.routeid=r.routeid
inner join airports a on r.sourceairportid=a.airportid ;
--SUBQUERIES
update employees 
set payrate = payrate * 1.1
where employeeid in (select employeeid from employees where city = 'Indianapolis IN');
--nested subquery
select airportname, city, 
from airports
where airportid in (select airportid 
                    from employees e
                    where e.salary > (select avg(salary) from rich_employees));
--correlated subqueries
select AF.aircraftcode, AF.aircraftdesignator
from aircraftfleet AF 
where 120000 <= (select sum(f.flightduration) from flights f 
                where af.aircraftfleetid=F.aircraftFleetID);
--gives "not a single-group group function" error without a group by clause
select AF.aircraftcode, AF.aircraftdesignator, sum(f.flightduration) as MinutesFlown 
from aircraftfleet AF, flights f
where 120000 <= (select sum(f.flightduration) from flights f 
                where af.aircraftfleetid=F.aircraftFleetID)
                GROUP by AF.aircraftcode, af.aircraftdesignator
                having sum (f.flightduration)>120000;
--compound queries
select employeeid, salary as turd
from employees 
where salary is not null 
union 
select employeeid, payrate 
from employees 
where payrate is not null;
--example
select * from passengers p 
inner join trips t on p.passengerid = t.passengerid 
where t.sourceflightid in (select flightid from flights f 
                            inner join routes r on f.routeid=r.routeid 
                            where r.sourceairportid 
                            not in (select airportid from airports where city='Albany')) 
                    order by p.passengerid;
--views chapt 20
CREATE view emp_view (LAST, FIRST) 
as select LASTNAME, FIRSTNAME 
from employees;
CREATE view emp_view2 
as select LASTNAME, FIRSTNAME 
from employees;
CREATE VIEW CITY_PAY AS 
SELECT E.CITY, AVG(E.PAYRATE) AVG_PAAY 
FROM EMPLOYEES E 
GROUP BY E.CITY;
SELECT * FROM CITY_PAY
WHERE ROWNUM<=10;
--VIEWS FROM MULTIPLE TABLES
 --CREATE A TABLE FROM  A VIEW
 CREATE VIEW INDIANA_EMPLOYEES AS 
 SELECT E.*
 FROM EMPLOYEES E, AIRPORTS A 
 WHERE E.AIRPORTID=A.AIRPORTID 
 AND E.STATE='IN';
 --SYSTEM
select table_name from sys.tables;
--cursor
custname varchar(30);
cursor emp_cursor is 
select LastName from Passengers; 
Begin 
    open namecursor 
    fetch namecursor into custname; 
    IF namecursor%notfound THEN 
    --Do some handling as your are at the end of the cursor
    END if;
    --Do something with the variable
    Close namecursor; 
end;
--create a stored procedure to add new aircraft
create or replace procedure new_aircraftfleet
(p_aircraftcode IN varchar2,p_aircraftdesignator IN varchar2,p_status IN varchar2,p_homeairportid IN number) 
as 
begin 
insert into aircraftfleet(aircraftcode, aircraftdesignator, status, homeairportid) 
values(p_aircraftcode,p_aircraftdesignator,p_status,p_homeairportid); 
end;
--execute
execute new_aircraftfleet('777','ZZZ-1','ACTIVE',3160);
--call the stored procedure
--call new_aircraftfleet ('777','ZZZ-1','ACTIVE',3160);
--begin/end
--BEGIN
--    new_aircraftfleet('777', 'ZZZ-1', 'ACTIVE', 3160);
--END;
show errors trigger insert;
--Chap22
select CONCAT(CONCAT('select count(*) from ', TABLE_NAME),';')from TABS;
--chap 23
--PL/SQL EXAMPLE P 352, there is no middle name so it won't run
DECLARE 
    CURSOR EMP_CURSOR IS SELECT EMPLOYEEID, LASTNAME, FIRSTNAME FROM EMPLOYEES; 
    EMP_REC EMP_CURSOR%ROWTYPE; 
BEGIN 
    OPEN EMP_CURSOR; 
    LOOP 
        FETCH EMP_CURSOR INTO EMP_REC; 
        EXIT WHEN EMP_CURSOR%NOTFOUND; 
        IF (EMP_REC.MIDDLENAME IS NULL) THEN 
        UPDATE EMPLOYEES 
        SET MIDDLENAME = 'X' 
        WHERE EMPLOYEEID = EMP_REC.EMPLOYEEID; 
        COMMIT; 
    END IF; 
END LOOP; 
CLOSE EMP_CURSOR; 
END;
--Intereactive example
select * from employees 
where city = '&city' 
and state = '&state';




