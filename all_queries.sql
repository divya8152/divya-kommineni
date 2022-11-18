1)

INSERT INTO employee2(FIRSTNAME,LASTNAME,WORKDEPT,PHONE,HIREDATE,SEX,SALARY)
value
('suresh','babu','ab2','3546278450','1999-12-01','MALE','85000'),
('ramesh','pandu','fk1','2345123214','1984-09-09','MALE','90000'),
('rajesh','babu','qp7','8474643555','1987-09-30','MALE','55000');


2)
INSERT INTO employee2(FIRSTNAME,LASTNAME,WORKDEPT,PHONE,HIREDATE,SEX,SALARY)
value
('Elex','buddy','ce3','5637399211','2005-07-06','MALE','70000');


3)
SELECT * FROM employee2


4)
UPDATE employees2
SET HIREDATE= ‘1984-09-09’, LASTNAME=’PANDU’
WHERE ENUM=’102’;


5)
UPDATE employees2
SET ENUM= ‘104’, LOCATION=’WASHINGTON’
WHERE FIRSTNAME=’rajseh’;

6)

DELETE FROM employee WHERE ENUM=('101' & '102' & '103' & ' 104');

7)
ALTER TABLE employee
ALTER LOCATION SET DEFAULT 'WASHINGTON';

8)
SELECT * FROM employee 
LEFT JOIN customer 
ON employee.empno =customer.empno;

9)
SELECT * FROM orders
FULL OUTER JOIN products
ON orders.orderId = products.orderId
ORDER BY orderId;

10) 
SELECT *
FROM employee2 AS stat
CROSS APPLY sys.dm_db_stats_properties(stat.customerid, stat.orderid) AS sp;

11)
SELECT FIRSTNAME, PHONE, SALARY FROM employee.INNODB_TABLESTATS where name= location;

12)
ALTER TABLE employee AUTO_INCREMENT=101;

13)

SELECT * FROM employee2.STATISTICS WHERE employee2 = 'orders' AND customer;


