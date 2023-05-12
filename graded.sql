CREATE DATABASE CONSULTATION_TERAPY;
CREATE TABLE DOCTOR(
	 DOCTOR_ID INT PRIMARY KEY NOT NULL,
     DOCTOR_NAME VARCHAR(30),
     SPECIALIZATION VARCHAR(20)
     );
     
INSERT INTO DOCTOR VALUES(101,"SUDARSHAN","NEUROLOGY"),(102,"DILEEP","GYNOCOLOGY"),(103,"SHANTHAN","CARDIOLOGY");
SELECT * FROM DOCTOR;

CREATE TABLE PATIENT(
	PATIENT_ID INT PRIMARY KEY NOT NULL,
    PATIENT_NAME VARCHAR(20),
    PATIENT_AGE INT);

INSERT INTO PATIENT VALUES(201,"CHARAN",22),(202,"SURESH",23),(203,"YASWANTH",24);

SELECT * FROM PATIENT;

CREATE TABLE APPOINTMENTS(
	 APPOINTMENT_ID INT PRIMARY KEY NOT NULL,
     PATIENT_ID INT NOT NULL,
     DOCTOR_ID INT NOT NULL ,
     FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
     FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
     );

INSERT INTO APPOINTMENTS VALUES(301,201,101),(302,202,102),(303,203,103);

SELECT * FROM APPOINTMENTS;


CREATE TABLE REVIEWS(
	REVIEW_NUMBER INT PRIMARY KEY NOT NULL,
    RATING FLOAT,
	PATIENT_ID INT NOT NULL,
	DOCTOR_ID INT NOT NULL ,
	FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID),
	FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID)
    );

INSERT INTO REVIEWS VALUES(1,3.5,201,101),(2,4.5,202,102),(3,5.0,203,103);
     
SELECT * FROM REVIEWS;

CREATE TABLE CONTACT(
	CONTACT_ID INT PRIMARY KEY NOT NULL,
	CONTACT_EMAIL VARCHAR(30),
    FNAME VARCHAR(20),
	LNAME VARCHAR(20),
	COMPANY VARCHAR(20),
	ACTIVE_FLAG INT,
    OPT_OUT INT);

INSERT INTO CONTACT VALUES(123,"a@a.com","Kian","Seth","ABC",1,1),(133,"b@a.com","Neha","Seth","ABC",1,0),(234,"c@c.com","Puru","Malik","CDF",0,0),(342,"d@d.com","Sid","Maan","TEG",1,0);
SELECT * FROM CONTACT;

-- Select all columns from the contact table where the active flag is 1
SELECT * FROM CONTACT WHERE ACTIVE_FLAG = 1;

-- Deactivate contacts who are opted out
UPDATE CONTACT SET ACTIVE_FLAG = 0 WHERE OPT_OUT = 1;

-- Delete all the contacts who have the company name as ‘ABC’
DELETE FROM CONTACT WHERE COMPANY="abc";

-- Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
INSERT INTO CONTACT VALUES(658,"mili@gmail.com","mili","","dgh",1,1);


-- Pull out the unique values of the company column 
SELECT DISTINCT COMPANY FROM CONTACT;

-- Update name “mili” to “niti”.
UPDATE CONTACT SET FNAME="niti" WHERE FNAME="mili";

SELECT * FROM CONTACT;

CREATE TABLE SALESMAN(
SALESMAN_ID INT PRIMARY KEY NOT NULL,
SALESMAN_NAME VARCHAR(40) ,
CITY VARCHAR(40),
COMMISSION FLOAT);
INSERT INTO SALESMAN VALUES(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
SELECT * FROM SALESMAN;

CREATE TABLE CUSTOMER(
	customer_id INT PRIMARY KEY NOT NULL,
    cust_name VARCHAR(20),
    city VARCHAR(20),
    grade INT,
    salesman_id INT,
    foreign key(salesman_id) references salesman(salesman_id));

INSERT INTO CUSTOMER VALUES(3002,"Nick Rimando","New York",100,5001),(3007,"Brad Davis","New York",200,5001),(3005,"Graham Zusi","California",200,5002),(3008,"Julian Green","London",300,5002),(3004,"Fabian Johnson","Paris",300,5006),(3009,"Geoff Cameron","Berlin",100 ,5003),(3003,"Jozy Altidor","Moscow",200,5007);
INSERT INTO CUSTOMER(customer_id,cust_name,city,salesman_id) values(3001,"Brad Guzan","London",5005);
select * from customer;

-- SQL query to find those customers with a grade less than 100. It should return cust_name, customer city, grade, salesman, and salesman city. The result should be ordered by ascending customer_id.
SELECT CUST_NAME,CUSTOMER.CITY,GRADE,SALESMAN_NAME,SALESMAN.CITY FROM CUSTOMER,SALESMAN WHERE GRADE < 100 and CUSTOMER.SALESMAN_ID=SALESMAN.SALESMAN_ID ORDER BY CUSTOMER_ID;
