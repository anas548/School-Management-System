create database school_managment_system
drop database school_managment_system
CREATE TABLE sdepartments (
   sdepartment_id INT IDENTITY(1,1) PRIMARY KEY,
   sdepartment_name VARCHAR(50)
);
CREATE TABLE Students (
   student_id INT IDENTITY(1,1) PRIMARY KEY,
   sdepartment_id INT FOREIGN KEY REFERENCES sdepartments(sdepartment_id),
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   date_of_birth DATE,
   gender VARCHAR(10),
   Aaddress VARCHAR(100),
   contact_number VARCHAR(20),
   email VARCHAR(50)
);

CREATE TABLE departments (
   department_id INT IDENTITY(1,1) PRIMARY KEY,
   department_name VARCHAR(50)
);

CREATE TABLE Subjects (
   subject_id INT IDENTITY(1,1) PRIMARY KEY,
   subject_name VARCHAR(50),
   credithour int,
   sdepartment_id INT FOREIGN KEY REFERENCES sdepartments(sdepartment_id)

);



CREATE TABLE Teachers (
   teacher_id INT IDENTITY(1,1) PRIMARY KEY,
    department_id INT FOREIGN KEY REFERENCES departments(department_id),
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   date_of_birth DATE,
   gender VARCHAR(10),
   Aaddress VARCHAR(100),
   contact_number VARCHAR(20),
   email VARCHAR(50),
   subject_id INT FOREIGN KEY REFERENCES Subjects(subject_id),

);
CREATE TABLE salary (
   salary_id INT IDENTITY(1,1) PRIMARY KEY,
  teacher_id INT FOREIGN KEY REFERENCES teachers(teacher_id),
   department_id INT FOREIGN KEY REFERENCES departments(department_id),
   amount INT,
   payment_date DATE
);

CREATE TABLE Enrollments (
   enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
   student_id INT FOREIGN KEY  REFERENCES Students(student_id),
      subject_id INT FOREIGN KEY REFERENCES subjects(subject_id),
	     sdepartment_id INT FOREIGN KEY REFERENCES sdepartments(sdepartment_id)

);
CREATE TABLE Attendance (
   attendance_id INT IDENTITY(1,1) PRIMARY KEY,
   student_id INT FOREIGN KEY REFERENCES Students(student_id),
   subject_id INT FOREIGN KEY REFERENCES subjects(subject_id),
   date DATE,
);



CREATE TABLE Fees (
   fee_id INT IDENTITY(1,1) PRIMARY KEY,
   student_id INT FOREIGN KEY REFERENCES Students(student_id),
   sdepartment_id INT FOREIGN KEY REFERENCES sdepartments(sdepartment_id),
   amount INT,
   payment_date DATE
);

CREATE TABLE Feedefaulter(
   feedef_id INT IDENTITY(1,1) PRIMARY KEY,
   student_id INT FOREIGN KEY REFERENCES Students(student_id),
   sdepartment_id INT FOREIGN KEY REFERENCES sdepartments(sdepartment_id),
   amountdue INT
);


CREATE TABLE exams (
   exam_id INT IDENTITY(1,1) PRIMARY KEY,
   subject_id INT FOREIGN KEY  REFERENCES subjects(subject_id),
   exam_date DATE
);

CREATE TABLE grades (
   grade_id INT IDENTITY(1,1) PRIMARY KEY,
   student_id INT FOREIGN KEY REFERENCES students(student_id),
   subject_id INT FOREIGN KEY REFERENCES subjects(subject_id),
   exam_id INT FOREIGN KEY (exam_id) REFERENCES exams(exam_id),
   grade VARCHAR(20)
);









--SELECT  Statement 
SELECT first_name, last_name
FROM Students;
SELECT subject_name, credithour
FROM Subjects;
SELECT department_id, department_name
FROM departments;
SELECT sdepartment_id, sdepartment_name
FROM sdepartments;
SELECT first_name, last_name, email
FROM Teachers;
SELECT enrollment_id, student_id
FROM Enrollments;
SELECT attendance_id, student_id, subject_id
FROM Attendance;
SELECT fee_id, student_id, sdepartment_id, amount
FROM Fees;
SELECT feedef_id, student_id, sdepartment_id
FROM FeeDefaulter;
SELECT salary_id, teacher_id, department_id, amount
FROM salary;

-- DISTINCT 
SELECT DISTINCT sdepartment_id
FROM Students;
SELECT DISTINCT subject_id
FROM Subjects;
SELECT DISTINCT department_name
FROM departments;
SELECT DISTINCT sdepartment_name
FROM sdepartments;
SELECT DISTINCT gender
FROM Teachers;
SELECT DISTINCT student_id
FROM Enrollments;
SELECT DISTINCT subject_id
FROM Attendance;
SELECT DISTINCT sdepartment_id
FROM Fees;
SELECT DISTINCT amountdue
FROM FeeDefaulter;
SELECT DISTINCT department_id
FROM salary;


--ORDER BY Statement  
SELECT *
FROM Students
ORDER BY first_name ASC;
SELECT *
FROM Students
ORDER BY last_name DESC;
SELECT *
FROM Subjects
ORDER BY subject_name ASC;
SELECT *
FROM Subjects
ORDER BY credithour DESC;
SELECT *
FROM departments
ORDER BY department_name ASC;
SELECT *
FROM departments
ORDER BY department_id DESC;
SELECT *
FROM sdepartments
ORDER BY sdepartment_name ASC;
SELECT *
FROM sdepartments
ORDER BY sdepartment_id DESC;
SELECT *
FROM Teachers
ORDER BY first_name ASC;
SELECT *
FROM Teachers
ORDER BY last_name DESC;
SELECT *
FROM Enrollments
ORDER BY enrollment_id ASC;
SELECT *
FROM Enrollments
ORDER BY student_id DESC;
SELECT *
FROM Attendance
ORDER BY attendance_id ASC;
SELECT *
FROM Attendance
ORDER BY student_id DESC;
SELECT *
FROM Fees
ORDER BY fee_id ASC;
SELECT *
FROM Fees
ORDER BY amount DESC;
SELECT *
FROM FeeDefaulter
ORDER BY feedef_id ASC;
SELECT *
FROM FeeDefaulter
ORDER BY amountdue DESC;
SELECT *
FROM salary
ORDER BY salary_id ASC;
SELECT *
FROM salary
ORDER BY amount DESC;
SELECT *
FROM exams
ORDER BY exam_id ASC;
SELECT *
FROM exams
ORDER BY exam_date DESC;
SELECT *
FROM grades
ORDER BY grade_id ASC;
SELECT *
FROM grades
ORDER BY student_id DESC;
SELECT *
FROM grades
ORDER BY exam_id ASC;

--- ORDER BY using AND, OR and NOT Operators 
SELECT *
FROM Students
WHERE gender = 'Female' OR sdepartment_id = 2
ORDER BY date_of_birth ASC;
SELECT *
FROM Subjects
WHERE NOT subject_name = 'Mathematics'
ORDER BY credithour DESC;
SELECT *
FROM departments
WHERE department_name = 'Science' OR department_id = 3
ORDER BY department_id ASC;
SELECT *
FROM Students
WHERE gender = 'Male' AND sdepartment_id = 1
ORDER BY last_name ASC;
SELECT *
FROM departments
WHERE department_id = 2 OR department_id = 4
ORDER BY department_name ASC;
SELECT *
FROM sdepartments
WHERE NOT sdepartment_id = 3
ORDER BY sdepartment_name ASC;
SELECT *
FROM Teachers
WHERE gender = 'Female' AND department_id = 2
ORDER BY last_name DESC;
SELECT *
FROM Enrollments
WHERE enrollment_id = 100 OR student_id IN (SELECT student_id FROM Students WHERE sdepartment_id = 3)
ORDER BY student_id ASC;
SELECT *
FROM Attendance
WHERE NOT (student_id = 1 OR subject_id = 5)
ORDER BY attendance_id ASC;
SELECT *
FROM Fees
WHERE payment_date = '2023-06-15' OR sdepartment_id = 2
ORDER BY amount DESC;
SELECT *
FROM FeeDefaulter
WHERE NOT (student_id = 4 OR sdepartment_id = 6)
ORDER BY feedef_id ASC;
SELECT *
FROM salary
WHERE payment_date = '2023-01-31' AND teacher_id = 5
ORDER BY amount DESC;
SELECT *
FROM exams
WHERE subject_id NOT IN (10, 15)
ORDER BY exam_date ASC;
SELECT *
FROM grades
WHERE subject_id = 5 AND exam_id = 10
ORDER BY student_id DESC;
SELECT *
FROM grades
WHERE NOT (student_id = 10 OR subject_id = 20)
ORDER BY grade DESC;
SELECT *
FROM Teachers
WHERE gender = 'Male' OR department_id = 3
ORDER BY date_of_birth ASC;
SELECT *
FROM Enrollments
WHERE NOT (student_id = 15 AND Enrollment_id = 4)
ORDER BY enrollment_id DESC;
SELECT *
FROM Attendance
WHERE student_id = 7 OR subject_id = 12
ORDER BY attendance_id DESC;
SELECT *
FROM Fees
WHERE student_id NOT IN (5, 8, 10)
ORDER BY payment_date ASC;
SELECT *
FROM FeeDefaulter
WHERE student_id = 12 AND sdepartment_id = 4
ORDER BY amountdue DESC;
SELECT *
FROM salary
WHERE NOT (teacher_id = 8 AND department_id = 5)
ORDER BY salary_id ASC;
SELECT *
FROM exams
WHERE exam_date = '2023-07-10' OR subject_id = 25
ORDER BY subject_id DESC;
SELECT *
FROM Students
WHERE gender = 'Female' OR email NOT LIKE '%@example.com'
ORDER BY first_name ASC;
SELECT *
FROM Subjects
WHERE subject_name = 'Physics' AND credithour != 3
ORDER BY subject_id DESC;
SELECT *
FROM departments
WHERE department_id = 3 OR department_name NOT LIKE 'A%'
ORDER BY department_name ASC;
 
 --GROUP BY Statement 
SELECT gender, COUNT(*) AS total_students
FROM Students
GROUP BY gender;
SELECT credithour, AVG(credithour) AS average_credit_hour
FROM Subjects
GROUP BY credithour;
SELECT department_name, COUNT(*) AS total_departments
FROM departments
GROUP BY department_name;
SELECT sdepartment_id, COUNT(*) AS total_students
FROM sdepartments
GROUP BY sdepartment_id;
SELECT gender, MAX(date_of_birth) AS max_date_of_birth
FROM Teachers
GROUP BY gender;
SELECT student_id, COUNT(*) AS total_enrollments
FROM Enrollments
GROUP BY student_id;
SELECT student_id, subject_id, COUNT(*) AS total_attendances
FROM Attendance
GROUP BY student_id, subject_id;
SELECT student_id, SUM(amount) AS total_amount
FROM Fees
GROUP BY student_id;
SELECT student_id, AVG(amountdue) AS average_amount_due
FROM FeeDefaulter
GROUP BY student_id;
SELECT department_id, MIN(amount) AS min_amount
FROM salary
GROUP BY department_id;
SELECT subject_id, MAX(exam_date) AS max_exam_date
FROM exams
GROUP BY subject_id;
SELECT student_id, AVG(grade) AS average_grade
FROM grades
GROUP BY student_id;
SELECT sdepartment_id, COUNT(*) AS total_students
FROM Students
GROUP BY sdepartment_id;
SELECT subject_name, MAX(credithour) AS max_credit_hour
FROM Subjects
GROUP BY subject_name;
SELECT department_id, MIN(LEN(department_name)) AS min_name_length
FROM departments
GROUP BY department_id;
SELECT gender, AVG(amount) AS average_salary
FROM salary
INNER JOIN Teachers ON salary.teacher_id = Teachers.Teacher_id
GROUP BY gender;
SELECT department_id, COUNT(*) AS total_teachers
FROM Teachers
GROUP BY department_id;
SELECT enrollment_id, MAX(student_id) AS max_student_id
FROM Enrollments
GROUP BY enrollment_id;
SELECT attendance_id, MIN(student_id) AS min_student_id
FROM Attendance
GROUP BY attendance_id;
SELECT fee_id, SUM(amount) AS total_amount
FROM Fees
GROUP BY fee_id;
SELECT date_of_birth, COUNT(*) AS total_students
FROM Students
GROUP BY date_of_birth;
SELECT grade_id, AVG(grade) AS average_grade
FROM grades
GROUP BY grade_id;
SELECT exam_id, MAX(exam_date) AS max_exam_date
FROM exams
GROUP BY exam_id;
SELECT salary_id, MIN(amount) AS min_amount
FROM salary
GROUP BY salary_id;
SELECT feedef_id, AVG(amountdue) AS average_amount_due
FROM FeeDefaulter
GROUP BY feedef_id;

----GROUP BY using AND, OR, NOT Operators and Group by 
SELECT gender, sdepartment_id, AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE gender = 'Male' AND (sdepartment_id = 1 OR sdepartment_id = 2) 
GROUP BY gender, sdepartment_id;
SELECT subject_id, COUNT(*) AS total_subjects
FROM Subjects
WHERE subject_name = 'Engineering' AND credithour > 3 
GROUP BY subject_id;
SELECT gender, department_id, COUNT(*) AS total_teachers
FROM Teachers
WHERE gender = 'Female' AND (department_id = 1 OR department_id = 3)
GROUP BY gender, department_id;
SELECT student_id, subject_id, max(grade) AS max_grade
FROM grades
WHERE student_id IN (
    SELECT student_id
    FROM Students
    WHERE gender = 'Female' AND (sdepartment_id = 1 OR sdepartment_id = 2)
) AND grade > 80
GROUP BY student_id, subject_id;
SELECT sdepartment_id, AVG(credithour) AS average_credit_hour
FROM Subjects 
GROUP BY sdepartment_id;
SELECT gender, department_id, COUNT(*) AS count
FROM Teachers
WHERE gender = 'Female' AND department_id = 1
GROUP BY gender, department_id;
SELECT sdepartment_id, COUNT(*) AS count
FROM Students
WHERE gender = 'Male' AND (sdepartment_id = 1 OR first_name = 'ali')
GROUP BY sdepartment_id;
SELECT gender, department_id, COUNT(*) AS count
FROM Teachers
WHERE gender = 'Female' AND department_id = 'Science' AND date_of_birth >= '1980-01-01'
GROUP BY gender, department_id;
SELECT sdepartment_id, COUNT(*) AS count
FROM Subjects
WHERE credithour BETWEEN 2 AND 4
GROUP BY sdepartment_id;
SELECT gender, department_id, COUNT(*) AS count
FROM Teachers
WHERE gender = 'Male' AND department_id = (123) AND date_of_birth > '1985-01-01'
GROUP BY gender, department_id;
SELECT sdepartment_id, SUM(credithour) AS total_credit_hour
FROM Subjects
WHERE sdepartment_id NOT IN (1, 2)
GROUP BY sdepartment_id;
SELECT student_id, SUM(amount) AS total_fees_paid
FROM Fees
WHERE amount > 500 OR payment_date < '2022-01-01'
GROUP BY student_id;
SELECT student_id, SUM(amountdue) AS total_amount_due
FROM Feedefaulter
WHERE amountdue > 100 AND sdepartment_id = 1
GROUP BY student_id;
SELECT student_id, subject_id, count(grade) AS grade
FROM grades
WHERE student_id NOT IN (SELECT student_id FROM Students WHERE sdepartment_id = 1)
GROUP BY student_id, subject_id;
SELECT sdepartment_id, gender, COUNT(*) AS student_count
FROM Students
WHERE date_of_birth < '2000-01-01' OR last_name LIKE 'S%'
GROUP BY sdepartment_id, gender;
SELECT student_id, COUNT(*) AS enrollment_count
FROM Students
WHERE sdepartment_id = 1 AND (last_name LIKE 'A%' OR contact_number LIKE '%123')
GROUP BY student_id;
SELECT subject_id, COUNT(*) AS total_attendance
FROM Attendance
WHERE subject_id = 1 OR subject_id = 4
GROUP BY subject_id;
SELECT student_id, SUM(amount) AS total_fees_paid
FROM Fees
WHERE amount > 500 AND payment_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY student_id;
SELECT student_id, SUM(amountdue) AS total_amount_due
FROM Feedefaulter
WHERE amountdue > 100 OR sdepartment_id = 1
GROUP BY student_id;
SELECT subject_id, MIN(exam_date) AS min_exam_date
FROM exams
WHERE subject_id < 5 OR subject_id > 10
GROUP BY subject_id;SELECT sdepartment_id, gender, AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE gender = 'Male' AND sdepartment_id <> 1
GROUP BY sdepartment_id, gender;
SELECT student_id, COUNT(*) AS enrollment_count
FROM Enrollments
WHERE sdepartment_id = 1 AND enrollment_id > 100
GROUP BY student_id;
SELECT subject_id, COUNT(*) AS attendance_count
FROM Attendance
WHERE subject_id NOT IN (2, 4)
GROUP BY subject_id;
SELECT student_id, SUM(amount) AS total_fees_paid
FROM Fees
WHERE amount > 100 AND (sdepartment_id = 1 OR sdepartment_id = 1)
GROUP BY student_id;
SELECT department_id, MAX(amount) AS max_salary_amount
FROM salary
WHERE department_id NOT IN (1, 3)
GROUP BY department_id;
SELECT student_id, subject_id, MIN(grade) AS min_grade
FROM grades
WHERE student_id IN (SELECT student_id FROM Students WHERE sdepartment_id = 1) AND grade > 80
GROUP BY student_id, subject_id;

--Subqueries 
SELECT subject_name
FROM Subjects
WHERE subject_id IN (
  SELECT subject_id
  FROM Teachers
  WHERE Teacher_id = teacher_id
);
SELECT subject_name
FROM Subjects
WHERE subject_id IN (
  SELECT subject_id
  FROM departments
  WHERE department_id = department_id
);
SELECT CONCAT(first_name, ' ', last_name) AS full_name,email
FROM Teachers
WHERE Teacher_id = (
  SELECT Teacher_id
  FROM Subjects
  WHERE subject_id = subject_id
);
SELECT COUNT(*) AS enrollment_count
FROM Enrollments
WHERE student_id IN (
  SELECT student_id
  FROM Students
  WHERE sdepartment_id = sdepartment_id
);
SELECT SUM(amount) AS total_fee_amount
FROM Fees
WHERE student_id = (
  SELECT student_id
  FROM Students
  WHERE sdepartment_id = sdepartment_id
);
SELECT department_name
FROM departments
WHERE department_id = (
  SELECT department_id
  FROM Teachers
  WHERE Teacher_id = teacher_id
);
SELECT COUNT(*) AS male_student_count
FROM Students
WHERE gender = 'Male'
  AND student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE subject_id = subject_id
  );
SELECT subject_name
FROM Subjects
WHERE subject_id IN (
  SELECT subject_id
  FROM Teachers
  WHERE gender = 'Male'
);
SELECT SUM(amount) AS total_fee_amount
FROM Fees
WHERE student_id IN (
  SELECT student_id
  FROM Students
  WHERE gender = 'Male'
);
SELECT subject_name
FROM Subjects
WHERE subject_id IN (
  SELECT subject_id
  FROM Teachers
  WHERE gender = 'Female'
);
SELECT COUNT(*) AS student_count
FROM Fees
WHERE student_id IN (
  SELECT student_id
  FROM Students
  WHERE sdepartment_id = sdepartment_id
);
SELECT department_name
FROM departments
WHERE department_id IN (
  SELECT department_id
  FROM Teachers
  WHERE Teacher_id = teacher_id
);
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Teachers
WHERE Teacher_id = (
  SELECT Teacher_id
  FROM departments
  WHERE department_id = department_id
);
SELECT SUM(amount) AS total_fee_amount
FROM Fees
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Female');
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE gender = 'Female' AND sdepartment_id = (SELECT department_id FROM departments WHERE department_name = 'Science');
SELECT COUNT(*) AS unpaid_count
FROM Students
WHERE student_id NOT IN (SELECT student_id FROM Fees WHERE sdepartment_id = sdepartment_id);
SELECT student_id
FROM Students
WHERE student_id NOT IN (SELECT student_id FROM FeeDefaulter);
SELECT subject_name
FROM Subjects
WHERE credithour > 3 OR subject_id IN (SELECT subject_id FROM Teachers WHERE gender = 'Female');
SELECT subject_name
FROM Subjects
WHERE subject_id IN (SELECT subject_id FROM Teachers WHERE gender = 'Male')
      OR credithour < 4;
SELECT email
FROM Students
WHERE sdepartment_id = (SELECT department_id FROM departments WHERE department_name = 'Arts')
      AND student_id NOT IN (SELECT student_id FROM Fees);
SELECT department_name
FROM departments
WHERE department_id IN (SELECT department_id FROM Teachers GROUP BY department_id );
SELECT student_id
FROM Students
WHERE student_id NOT IN (SELECT student_id FROM Attendance)
      AND student_id NOT IN (SELECT student_id FROM Feedefaulter);
SELECT student_id FROM Students
WHERE student_id IN (SELECT student_id FROM Enrollments
WHERE sdepartment_id = (SELECT department_id FROM departments WHERE department_name = 'Science'))
      AND student_id IN (SELECT student_id FROM Enrollments
	  WHERE sdepartment_id = (SELECT department_id FROM departments WHERE department_name = 'Arts'));
SELECT Teacher_id
FROM Teachers
WHERE Teacher_id NOT IN (SELECT teacher_id FROM salary);
SELECT department_name
FROM departments
WHERE department_id IN (SELECT sdepartment_id FROM Enrollments 
GROUP BY sdepartment_id HAVING COUNT(student_id) > 100);
SELECT student_id
FROM Students
WHERE student_id NOT IN (SELECT student_id FROM Enrollments);
SELECT student_id
FROM Students
WHERE student_id IN (SELECT student_id FROM Feedefaulter)
      AND student_id NOT IN (SELECT student_id FROM Attendance);
SELECT department_name
FROM departments
WHERE department_id IN (SELECT department_id FROM Teachers 
WHERE gender = 'Male' GROUP BY department_id HAVING COUNT(Teacher_id) > (SELECT COUNT(Teacher_id) FROM Teachers
WHERE gender = 'Female' GROUP BY department_id));
SELECT subject_id, subject_name
FROM Subjects
WHERE credithour > 3
      OR subject_id IN (SELECT subject_id FROM Teachers WHERE last_name = 'Smith');
SELECT subject_id, subject_name
FROM Subjects
WHERE subject_id NOT IN (SELECT subject_id FROM Enrollments)
      AND credithour > 3;

--Aggregate functions MAX, MIN, SUM, COUNT, and AVG. 
SELECT MAX(credithour) AS max_credit_hour
FROM Subjects;
SELECT MIN(amountdue) AS min_amount_due
FROM FeeDefaulter;
SELECT SUM(amount) AS total_amount_paid
FROM Fees;
SELECT sdepartment_id, COUNT(*) AS total_students
FROM Students
GROUP BY sdepartment_id;
SELECT AVG(amount) AS average_salary
FROM Salary;
SELECT student_id, MAX(grade) AS max_grade
FROM Grades
GROUP BY student_id;
SELECT subject_id, COUNT(*) AS total_enrollments
FROM Enrollments
GROUP BY subject_id;
SELECT MIN(date_of_birth) AS min_date_of_birth
FROM Students;
SELECT SUM(amount) AS total_fees_paid
FROM Fees
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Male');
SELECT COUNT(DISTINCT subject_name) AS distinct_subjects
FROM Subjects;
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE gender = 'Male';
SELECT sdepartment_id, SUM(amountdue) AS total_amount_due
FROM FeeDefaulter
GROUP BY sdepartment_id;
SELECT MIN(amount) AS min_salary
FROM Salary
WHERE teacher_id IN (SELECT teacher_id FROM Teachers 
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Mathematics'));
SELECT AVG(credithour) AS average_credit_hour
FROM Subjects
WHERE subject_id IN (SELECT subject_id FROM Subjects
WHERE sdepartment_id = (SELECT department_id FROM departments WHERE department_name = 'Science'));
SELECT COUNT(*) AS total_students_enrolled
FROM Enrollments
WHERE subject_id IN (SELECT subject_id FROM Subjects WHERE credithour > 4);
SELECT student_id, MAX(amount) AS max_amount_paid
FROM Fees
GROUP BY student_id;
SELECT count(grade) AS total_grades
FROM Grades;
SELECT sdepartment_id, gender, COUNT(*) AS total_students
FROM Students
GROUP BY sdepartment_id, gender;
SELECT sdepartment_id, MAX(amountdue) AS max_amount_due
FROM FeeDefaulter
GROUP BY sdepartment_id;
SELECT MAX(amountdue) AS maximum_amount_due
FROM Feedefaulter;

--Aggregate functions using logical Operators and Group by 
SELECT sdepartment_id, AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE gender = 'Male'
GROUP BY sdepartment_id;
SELECT sdepartment_id, MAX(amount) AS max_fee_amount
FROM Fees
GROUP BY sdepartment_id;
SELECT subject_id, MIN(grade) AS min_grade
FROM grades
GROUP BY subject_id;
SELECT department_id, AVG(amount) AS average_salary
FROM salary
GROUP BY department_id;
SELECT sdepartment_id, gender, COUNT(student_id) AS student_count
FROM Students
GROUP BY sdepartment_id, gender;
SELECT MAX(credithour) AS max_credit_hours
FROM Subjects;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Male')
GROUP BY sdepartment_id;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
GROUP BY sdepartment_id;
SELECT subject_id, MAX(grade) AS max_grade
FROM grades
GROUP BY subject_id;
SELECT department_id ,AVG(amount) AS average_salary
FROM salary
GROUP BY department_id ;
SELECT subject_id, COUNT(student_id) AS male_student_count
FROM Enrollments
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Male')
GROUP BY subject_id;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Female')
GROUP BY sdepartment_id;
SELECT subject_id, COUNT(student_id) AS total_students
FROM Enrollments
GROUP BY subject_id;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
GROUP BY sdepartment_id;
SELECT subject_id, MAX(grade) AS max_grade
FROM grades
WHERE student_id IN (SELECT student_id FROM Students WHERE gender = 'Female')
GROUP BY subject_id;
SELECT sdepartment_id, AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
GROUP BY sdepartment_id;
SELECT sdepartment_id, COUNT(subject_id) AS subject_count
FROM Subjects
GROUP BY sdepartment_id;
SELECT student_id, MAX(amount) AS max_fee_amount
FROM Fees
GROUP BY student_id;
SELECT sdepartment_id,  AVG(credithour) AS average_credit_hour
FROM Subjects
GROUP BY sdepartment_id;
SELECT subject_id, COUNT(student_id) AS student_count
FROM grades
WHERE grade > 80
GROUP BY subject_id;
SELECT department_id, MIN(amount) AS min_salary
FROM salary
GROUP BY department_id;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
GROUP BY sdepartment_id;
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students
WHERE sdepartment_id = 1
AND student_id IN (
    SELECT student_id
    FROM Enrollments
);
SELECT SUM(amount) AS total_fees_paid
FROM Fees
WHERE student_id IN (
    SELECT student_id
    FROM Students
    WHERE email LIKE '%gmail.com'
);
SELECT COUNT(*) AS total_male_students
FROM Students
WHERE gender = 'Male'
AND student_id IN (
    SELECT student_id
    FROM Enrollments
    WHERE subject_id IN (
        SELECT subject_id
        FROM Subjects
        WHERE subject_name LIKE 'English%'
    )
);
SELECT AVG(amount) AS average_salary
FROM salary
WHERE teacher_id IN (
    SELECT Teacher_id
    FROM Teachers
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name = 'Arts'
    )
) 
SELECT MAX(credithour) AS max_credit_hour
FROM Subjects
WHERE subject_id IN (
    SELECT Teacher_id
    FROM Teachers
    WHERE gender = 'Female'
);
SELECT sdepartment_id, COUNT(student_id) AS enrolled_students
FROM Enrollments
GROUP BY sdepartment_id;
SELECT MIN(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS min_age
FROM Students
WHERE gender = 'Male'
AND sdepartment_id = 1;
SELECT sdepartment_id, SUM(amount) AS total_fees_paid
FROM Fees
GROUP BY sdepartment_id;

----DML Triggers INSERT 

create table studentAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table SubjectAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table DepartmentAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table StudentDepartmentAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table TeacherAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table EnrollmentAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table AttendanceAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table FeesAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table FeeDefaulterAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table SalaryAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table ExamsAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table GradesAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
create table ContactAudit(
Id int not null primary key identity(1,1),
AUDITMESSAGE varchar(max),
);
CREATE TRIGGER TR_Students_FORINSERTED
ON Students
AFTER INSERT
AS
BEGIN
    DECLARE @student_id INT;
    DECLARE @first_name VARCHAR(100);

    SELECT @student_id = student_id, @first_name = first_name
    FROM inserted;

    INSERT INTO StudentAudit 
    VALUES (
        'New student with id=' + CAST(@student_id AS VARCHAR(10)) +
        '&name=' + @first_name +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Subjects_FORINSERTED
ON Subjects
AFTER INSERT
AS
BEGIN
    DECLARE @subject_id INT;
    DECLARE @subject_name VARCHAR(100);

    SELECT @subject_id = subject_id, @subject_name = subject_name
    FROM inserted;

    INSERT INTO SubjectAudit
    VALUES (
        'New subject with id=' + CAST(@subject_id AS VARCHAR(10)) +
        '&name=' + @subject_name +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Departments_FORINSERTED
ON Departments
AFTER INSERT
AS
BEGIN
    DECLARE @department_id INT;
    DECLARE @department_name VARCHAR(100);

    SELECT @department_id = department_id, @department_name = department_name
    FROM inserted;

    INSERT INTO DepartmentAudit 
    VALUES (
        'New department with id=' + CAST(@department_id AS VARCHAR(10)) +
        '&name=' + @department_name +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_StudentDepartments_FORINSERTED
ON SDepartments
AFTER INSERT
AS
BEGIN
    DECLARE @sdepartment_id INT;
    DECLARE @sdepartment_name VARCHAR(100);

    SELECT @sdepartment_id = sdepartment_id, @sdepartment_name = sdepartment_name
    FROM inserted;

    INSERT INTO StudentDepartmentAudit 
    VALUES (
        'New student department with id=' + CAST(@sdepartment_id AS VARCHAR(10)) +
        '&name=' + @sdepartment_name +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Teachers_FORINSERTED
ON Teachers
AFTER INSERT
AS
BEGIN
    DECLARE @teacher_id INT;
    DECLARE @first_name VARCHAR(100);

    SELECT @teacher_id = teacher_id, @first_name = first_name
    FROM inserted;

    INSERT INTO TeacherAudit 
    VALUES (
        'New teacher with id=' + CAST(@teacher_id AS VARCHAR(10)) +
        '&name=' + @first_name +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Enrollments_FORINSERTED
ON Enrollments
AFTER INSERT
AS
BEGIN
    DECLARE @enrollment_id INT;
    DECLARE @student_id INT;

    SELECT @enrollment_id = enrollment_id, @student_id = student_id
    FROM inserted;

    INSERT INTO EnrollmentAudit
    VALUES (
        'New enrollment with id=' + CAST(@enrollment_id AS VARCHAR(10)) +
        '&student_id=' + CAST(@student_id AS VARCHAR(10)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Attendance_FORINSERTED
ON Attendance
AFTER INSERT
AS
BEGIN
    DECLARE @attendance_id INT;
    DECLARE @student_id INT;
    DECLARE @subject_id INT;

    SELECT @attendance_id = attendance_id, @student_id = student_id, @subject_id = subject_id
    FROM inserted;

    INSERT INTO AttendanceAudit 
    VALUES (
        'New attendance record with id=' + CAST(@attendance_id AS VARCHAR(10)) +
        '&student_id=' + CAST(@student_id AS VARCHAR(10)) +
        '&subject_id=' + CAST(@subject_id AS VARCHAR(10)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Fees_FORINSERTED
ON Fees
AFTER INSERT
AS
BEGIN
    DECLARE @fee_id INT;
    DECLARE @student_id INT;
    DECLARE @sdepartment_id INT;

    SELECT @fee_id = fee_id, @student_id = student_id, @sdepartment_id = sdepartment_id
    FROM inserted;

    INSERT INTO FeesAudit 
    VALUES (
        'New fee record with id=' + CAST(@fee_id AS VARCHAR(10)) +
        '&student_id=' + CAST(@student_id AS VARCHAR(10)) +
        '&sdepartment_id=' + CAST(@sdepartment_id AS VARCHAR(10)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_FeeDefaulter_FORINSERTED
ON FeeDefaulter
AFTER INSERT
AS
BEGIN
    DECLARE @feedef_id INT;
    DECLARE @student_id INT;
    DECLARE @sdepartment_id INT;

    SELECT @feedef_id = feedef_id, @student_id = student_id, @sdepartment_id = sdepartment_id
    FROM inserted;

    INSERT INTO FeeDefaulterAudit 
    VALUES (
        'New fee defaulter record with id=' + CAST(@feedef_id AS VARCHAR(10)) +
        '&student_id=' + CAST(@student_id AS VARCHAR(10)) +
        '&sdepartment_id=' + CAST(@sdepartment_id AS VARCHAR(10)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Salary_FORINSERTED
ON Salary
AFTER INSERT
AS
BEGIN
    DECLARE @salary_id INT;
    DECLARE @teacher_id INT;
    DECLARE @department_id INT;

    SELECT @salary_id = salary_id, @teacher_id = teacher_id, @department_id = department_id
    FROM inserted;

    INSERT INTO SalaryAudit 
    VALUES (
        'New salary record with id=' + CAST(@salary_id AS VARCHAR(10)) +
        '&teacher_id=' + CAST(@teacher_id AS VARCHAR(10)) +
        '&department_id=' + CAST(@department_id AS VARCHAR(10)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Exams_FORINSERTED
ON Exams
AFTER INSERT
AS
BEGIN
    DECLARE @exam_id INT;
    DECLARE @subject_id INT;
    DECLARE @exam_date DATE;

    SELECT @exam_id = exam_id, @subject_id = subject_id, @exam_date = exam_date
    FROM inserted;

    INSERT INTO ExamsAudit 
    VALUES (
        'New exam record with id=' + CAST(@exam_id AS VARCHAR(10)) +
        '&subject_id=' + CAST(@subject_id AS VARCHAR(10)) +
        '&exam_date=' + CAST(@exam_date AS VARCHAR(20)) +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER TR_Grades_FORINSERTED
ON Grades
AFTER INSERT
AS
BEGIN
    DECLARE @grade_id INT;
    DECLARE @student_id INT;
    DECLARE @subject_id INT;
    DECLARE @exam_id INT;
    DECLARE @grade CHAR(1);

    SELECT @grade_id = grade_id, @student_id = student_id, @subject_id = subject_id, @exam_id = exam_id, @grade = grade
    FROM inserted;

    INSERT INTO GradesAudit 
    VALUES (
        'New grade record with id=' + CAST(@grade_id AS VARCHAR(10)) +
        '&student_id=' + CAST(@student_id AS VARCHAR(10)) +
        '&subject_id=' + CAST(@subject_id AS VARCHAR(10)) +
        '&exam_id=' + CAST(@exam_id AS VARCHAR(10)) +
        '&grade=' + @grade +
        ' is added at ' + CAST(GETDATE() AS VARCHAR(20))
    );
END;
CREATE TRIGGER Trigger_for_inserting_into_the_AttendanceAudit_table
ON Attendance
AFTER INSERT
AS
BEGIN
    INSERT INTO AttendanceAudit 
    VALUES ('New attendance record is added at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Fees_FORINSERTED
ON Fees
AFTER INSERT
AS
BEGIN
    INSERT INTO FeesAudit 
    VALUES ('New fee record is added at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER FeeDefaulter_FORINSERTED
ON FeeDefaulter
AFTER INSERT
AS
BEGIN
    INSERT INTO FeeDefaulterAudit 
    VALUES ('New fee defaulter record is added at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Salary_FORINSERTED
ON Salary
AFTER INSERT
AS
BEGIN
    INSERT INTO SalaryAudit 
    VALUES ('New salary record is added at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Exams_FORINSERTED
ON Exams
AFTER INSERT
AS
BEGIN
    INSERT INTO ExamsAudit 
    VALUES ('New exam scheduled at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Grades_FORINSERTED
ON Grades
AFTER INSERT
AS
BEGIN
    INSERT INTO GradesAudit 
    VALUES ('New grade recorded at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Departments_FORINSERTED
ON Departments
AFTER INSERT
AS
BEGIN
    INSERT INTO DepartmentAudit 
    VALUES ('New department created at ' + CAST(GETDATE() AS VARCHAR(20)));
END;
CREATE TRIGGER Teachers_FORINSERTED
ON Teachers
AFTER INSERT
AS
BEGIN
    INSERT INTO TeacherAudit 
    VALUES ('New teacher added at ' + CAST(GETDATE() AS VARCHAR(20)));
END;





















































































-- (5) INSERT INTO Statement 

INSERT INTO Students ( first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email)
VALUES ('John', 'Doe', '2000-01-03', 'Male', '123 Main St', '123-456-7890', 'john.doe@example.com');
INSERT INTO Subjects ( subject_name, credithour)
VALUES ( 'Mathematics', 3);
INSERT INTO departments ( department_name)
VALUES ('Computer Science');
INSERT INTO sdepartments ( sdepartment_name)
VALUES ( 'Computer Science Department');
INSERT INTO Teachers ( first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email)
VALUES ('Jane', 'Smith', '1999-05-10', 'Female', '456 Elm St', '987-654-3210', 'jane.smith@example.com');
INSERT INTO Fees ( amount, payment_date)
VALUES ( 1000, '2023-06-05');
INSERT INTO FeeDefaulter ( amountdue)
VALUES (500);
INSERT INTO Salary ( amount, payment_date)
VALUES ( 5500, '2023-06-15');
INSERT INTO Exams ( exam_date)
VALUES ( '2023-07-03');
INSERT INTO Grades (  grade)
VALUES ( 'A');

--- (7)  write 50 sql quries of WHERE Clause using AND, OR and NOT Operators

SELECT * FROM Students WHERE first_name = 'John' AND last_name = 'Smith';
SELECT * FROM Students WHERE sdepartment_id IN (SELECT sdepartment_id FROM sdepartments WHERE sdepartment_name = 'Computer Science');
SELECT * FROM Students WHERE date_of_birth = '2000-01-01';
SELECT * FROM Students WHERE gender = 'Male';
SELECT * FROM Students WHERE last_name LIKE 'S%' OR last_name LIKE 'T%';
SELECT * FROM Students WHERE Aaddress LIKE '%Street%';
SELECT * FROM Students WHERE contact_number LIKE '1%' AND email LIKE '%@example.com';
SELECT * FROM Students WHERE date_of_birth <> '2002-12-25';
SELECT * FROM Students WHERE first_name = 'Sarah' OR last_name = 'Johnson';
SELECT * FROM Students WHERE sdepartment_id NOT IN (SELECT sdepartment_id FROM sdepartments WHERE sdepartment_name = 'Physics');
SELECT * FROM Students WHERE contact_number NOT LIKE '%5%';
SELECT * FROM Students WHERE email IS NOT NULL;
SELECT * FROM Students WHERE gender = 'Male' AND date_of_birth BETWEEN '1995-01-01' AND '2000-12-31';
SELECT * FROM Students WHERE (first_name LIKE 'A%' OR first_name LIKE 'B%') AND last_name LIKE '%son';
SELECT * FROM Students WHERE Aaddress NOT LIKE '%Apartment%';
SELECT * FROM Students WHERE contact_number IS NULL;
SELECT * FROM Students WHERE sdepartment_id NOT IN (SELECT sdepartment_id FROM sdepartments WHERE sdepartment_name IN ('Computer Science', 'Mathematics'));
SELECT * FROM Students WHERE first_name LIKE '%o%' AND last_name LIKE '%e%';
SELECT * FROM Students WHERE date_of_birth IS NULL;
SELECT * FROM Students WHERE contact_number NOT LIKE '1%' OR email NOT LIKE '%@example.com';
SELECT * FROM Students WHERE gender = 'Female' AND date_of_birth < '2003-01-01';
SELECT * FROM Students WHERE email NOT LIKE '%gmail%' AND contact_number IS NOT NULL;
SELECT * FROM Students WHERE last_name <> 'Smith' AND last_name <> 'Johnson';
SELECT * FROM Students WHERE first_name <> 'John' AND last_name <> 'Doe';
SELECT * FROM Students WHERE gender = 'Male' AND date_of_birth > '1999-01-01';
SELECT * FROM Students WHERE contact_number IS NOT NULL AND email IS NULL;
--26
SELECT * FROM Students WHERE sdepartment_id IN (SELECT sdepartment_id FROM sdepartments WHERE sdepartment_name = 'Physics') AND contact_number IS NOT NULL;
SELECT * FROM Students WHERE last_name <> 'Taylor' OR email IS NULL;
SELECT * FROM Students WHERE first_name <> 'Daniel' AND contact_number IS NOT NULL;
SELECT * FROM Students WHERE gender = 'Female' AND date_of_birth > '1997-01-01';
SELECT * FROM Students WHERE email IS NOT NULL AND date_of_birth < '1993-01-01';
SELECT * FROM departments WHERE department_name LIKE 'C%' AND department_id IN (SELECT sdepartment_id FROM Students GROUP BY sdepartment_id HAVING COUNT(*) > 50);
SELECT * FROM departments WHERE department_id <> 5 AND department_name LIKE '%Science%';
SELECT * FROM sdepartments WHERE sdepartment_name LIKE '%ics' AND sdepartment_id IN (SELECT sdepartment_id FROM Students);
SELECT * FROM Subjects WHERE credithour <= 3 AND subject_name LIKE 'M%';
SELECT * FROM Teachers WHERE last_name LIKE '%a%' AND contact_number LIKE '9%';
SELECT * FROM Teachers WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31' AND teacher_id NOT IN (SELECT teacher_id FROM Subjects WHERE subject_id = 3);
SELECT * FROM Teachers WHERE gender <> 'Male' OR last_name <> 'Smith';
SELECT * FROM Teachers WHERE contact_number IS NULL OR email LIKE '%@example.com';
SELECT * FROM Teachers WHERE department_id IN (1, 2, 3) AND gender = 'Female';
--40
SELECT * FROM Teachers WHERE date_of_birth < '1985-01-01' AND teacher_id IN (SELECT teacher_id FROM Subjects WHERE subject_id = 2);
SELECT * FROM Enrollments WHERE student_id = 1 AND subject_id = 2;
SELECT * FROM Enrollments WHERE enrollment_id NOT IN (1, 2, 3) AND student_id IN (4, 5, 6);
SELECT * FROM Enrollments WHERE student_id IN (1, 2, 3) AND subject_id NOT IN (4, 5, 6);
SELECT * FROM Enrollments WHERE student_id NOT IN (1, 2, 3) OR subject_id IN (4, 5, 6);
SELECT * FROM attendance WHERE student_id = 1 AND subject_id = 2;
SELECT * FROM attendance WHERE student_id IN (1, 2, 3) AND subject_id NOT IN (4, 5, 6);
SELECT * FROM attendance WHERE student_id NOT IN (1, 2, 3) OR subject_id IN (4, 5, 6);
SELECT * FROM fees WHERE student_id = 1 AND sdepartment_id = 2;
SELECT * FROM fees WHERE student_id IN (1, 2, 3) AND amount > 100;
--50 :)

--- (4)
--write 50 ALTER TABLE Statement (ADD Column, MODIFY DATATYPE, RENAME COLUMN, DROP COLUMN) 
ALTER TABLE Students ADD middle_name VARCHAR(50);
ALTER TABLE departments ADD description TEXT;
ALTER TABLE sdepartments alter column sdepartment_name VARCHAR(100);

ALTER TABLE Subjects RENAME COLUMN credithour TO credit_hour;
ALTER TABLE Subjects
ADD credit_hour INT;
ALTER TABLE Subjects
DROP COLUMN credithour; 

ALTER TABLE Teachers DROP COLUMN Aaddress;
ALTER TABLE Teachers DROP COLUMN Aaddress;
ALTER TABLE attendance ADD late_count INT;
ALTER TABLE fees ALTER COLUMN amount decimal;

ALTER TABLE Feedefaulter RENAME COLUMN feedef_id TO fees_defaulter_id;

ALTER TABLE Feedefaulter
ADD amount_due INT;
ALTER TABLE Feedefaulter
DROP COLUMN amountdue;

ALTER TABLE Feedefaulter RENAME COLUMN feedef_id TO fees_defaulter_id;

--10
ALTER TABLE exams ADD duration INT;
ALTER TABLE exams ADD duration INT;
ALTER TABLE Students alter column last_name VARCHAR(100);
ALTER TABLE departments RENAME COLUMN department_name TO dept_name;

ALTER TABLE departments
ADD dept_name INT;
ALTER TABLE departments
DROP COLUMN department_name;

ALTER TABLE sdepartments DROP COLUMN sdepartment_name;
ALTER TABLE Subjects ADD semester VARCHAR(20);
ALTER TABLE Feedefaulter alter column amountdue DECIMAL;
ALTER TABLE Teachers RENAME COLUMN teacher_id TO instructor_id;
ALTER TABLE attendance DROP COLUMN date;
ALTER TABLE Teachers ADD joining_date DATE;
--20
ALTER TABLE fees ADD payment_mode VARCHAR(50);
ALTER TABLE salary alter column amount DECIMAL;
ALTER TABLE Subjects RENAME COLUMN subject_name TO course_name;
ALTER TABLE exams DROP COLUMN exam_date;
ALTER TABLE grades ADD grade_percentage DECIMAL;
ALTER TABLE Students alter column gender varchar(20)
ALTER TABLE departments RENAME COLUMN department_id TO dept_id;
ALTER TABLE Teachers DROP COLUMN contact_number;
ALTER TABLE attendance ADD start_time TIME;
ALTER TABLE fees ADD credit_limit INT;
ALTER TABLE Feedefaulter alter column amountdue DECIMAL;
ALTER TABLE Teachers RENAME COLUMN teacher_id TO instructor_id;
ALTER TABLE salary DROP COLUMN payment_date;
ALTER TABLE exams ADD max_marks INT;
ALTER TABLE grades ADD grade_date DATE;
ALTER TABLE Students alter column last_name VARCHAR(100);
ALTER TABLE departments RENAME COLUMN department_name TO dept_name;
ALTER TABLE sdepartments DROP COLUMN sdepartment_name;
ALTER TABLE Subjects ADD semester VARCHAR(20);
ALTER TABLE Feedefaulter alter column amountdue DECIMAL;
--40
ALTER TABLE Teachers RENAME COLUMN teacher_id TO instructor_id;
ALTER TABLE attendance DROP COLUMN date;
ALTER TABLE Teachers ADD joining_date DATE;
ALTER TABLE fees ADD payment_mode VARCHAR(50);
ALTER TABLE salary alter column amount DECIMAL;
ALTER TABLE Subjects RENAME COLUMN subject_name TO course_name;
ALTER TABLE exams DROP COLUMN exam_date;
ALTER TABLE grades ADD grade_percentage DECIMAL;
ALTER TABLE fees alter column amount decimal;
ALTER TABLE departments RENAME COLUMN department_id TO dept_id;

--50
----------------------- (16)
--inner join
SELECT Students.*, sdepartments.sdepartment_name
FROM Students
INNER JOIN sdepartments ON Students.sdepartment_id = sdepartments.sdepartment_id;

------
SELECT Subjects.*, sdepartments.sdepartment_name
FROM Subjects
INNER JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id;

---------------
SELECT Teachers.*, departments.department_name
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id;

---------------
SELECT Enrollments.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM Enrollments
INNER JOIN Students ON Enrollments.student_id = Students.student_id
INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id;
------------
SELECT attendance.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM attendance
INNER JOIN Students ON attendance.student_id = Students.student_id
INNER JOIN Subjects ON attendance.subject_id = Subjects.subject_id;

---------------
SELECT fees.*, Students.first_name, Students.last_name, departments.department_name
FROM fees
INNER JOIN Students ON fees.student_id = Students.student_id
INNER JOIN departments ON fees.sdepartment_id = departments.department_id;

--------------
SELECT Feedefaulter.*, Students.first_name, Students.last_name, departments.department_name
FROM Feedefaulter
INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
INNER JOIN departments ON Feedefaulter.sdepartment_id = departments.department_id;
------------
SELECT grades.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM grades
INNER JOIN Students ON grades.student_id = Students.student_id
INNER JOIN Subjects ON grades.subject_id = Subjects.subject_id;

-----------------
SELECT exams.*, Subjects.subject_name
FROM exams
INNER JOIN Subjects ON exams.subject_id = Subjects.subject_id;
--------
SELECT salary.*, Teachers.first_name, Teachers.last_name, departments.department_name
FROM salary
INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
INNER JOIN departments ON salary.department_id = departments.department_id;

------
SELECT Students.*, Enrollments.enrollment_id, Enrollments.subject_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id;

-------
SELECT Subjects.*, sdepartments.sdepartment_name
FROM Subjects
INNER JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id;
----
SELECT Teachers.*, departments.department_name, Teachers.email
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id;
------
SELECT Enrollments.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM Enrollments
INNER JOIN Students ON Enrollments.student_id = Students.student_id
INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id;
------
SELECT attendance.*, Students.first_name, Students.last_name, Subjects.subject_name, attendance.date
FROM attendance
INNER JOIN Students ON attendance.student_id = Students.student_id
INNER JOIN Subjects ON attendance.subject_id = Subjects.subject_id;
--------
SELECT fees.*, Students.first_name, Students.last_name, departments.department_name, fees.payment_date
FROM fees
INNER JOIN Students ON fees.student_id = Students.student_id
INNER JOIN departments ON fees.sdepartment_id = departments.department_id;
---------
SELECT Feedefaulter.*, Students.first_name, Students.last_name, departments.department_name, Feedefaulter.amountdue
FROM Feedefaulter
INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
INNER JOIN departments ON Feedefaulter.sdepartment_id = departments.department_id;
------------
SELECT grades.*, Students.first_name, Students.last_name, Subjects.subject_name, grades.exam_id
FROM grades
INNER JOIN Students ON grades.student_id = Students.student_id
INNER JOIN Subjects ON grades.subject_id = Subjects.subject_id;
----------
SELECT exams.*, Subjects.subject_name, exams.exam_date
FROM exams
INNER JOIN Subjects ON exams.subject_id = Subjects.subject_id;
--------------
SELECT salary.*, Teachers.first_name, Teachers.last_name, departments.department_name, salary.payment_date
FROM salary
INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
INNER JOIN departments ON salary.department_id = departments.department_id;
--------------- (17)
--inner join with logical operators, group by , order by

SELECT Students.*, sdepartments.sdepartment_name
FROM Students
INNER JOIN sdepartments ON Students.sdepartment_id = sdepartments.sdepartment_id
where Students.date_of_birth='2002-10-05' or sdepartments.sdepartment_name='CS'
ORDER BY Students.last_name;
-------
SELECT Subjects.subject_id, Subjects.subject_name, Subjects.credithour, sdepartments.sdepartment_name
FROM Subjects
INNER JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id
where Subjects.credithour>2 and Subjects.credithour<5
GROUP BY Subjects.subject_id, Subjects.subject_name, Subjects.credithour, sdepartments.sdepartment_name;

----
SELECT Teachers.*, departments.department_name
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id
where Teachers.gender='male'or departments.department_name='SE'
ORDER BY Teachers.first_name;
----
SELECT Enrollments.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM Enrollments
INNER JOIN Students ON Enrollments.student_id = Students.student_id
INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
where Students.student_id=1 or Subjects.subject_name='Math'
ORDER BY Enrollments.enrollment_id;
----

SELECT Attendance.attendance_id,Attendance.date, Students.first_name, Students.last_name, Subjects.subject_name
FROM attendance
INNER JOIN Students ON attendance.student_id = Students.student_id
INNER JOIN Subjects ON attendance.subject_id = Subjects.subject_id
where Attendance.date='2023-10-05'
GROUP BY Attendance.attendance_id,Attendance.date, Students.first_name, Students.last_name, Subjects.subject_name
------
SELECT fees.*, Students.first_name, Students.last_name, sdepartments.sdepartment_name
FROM fees
INNER JOIN Students ON fees.student_id = Students.student_id
INNER JOIN sdepartments ON fees.sdepartment_id = sdepartments.sdepartment_id
where Students.gender='male' and Fees.amount=12000
ORDER BY fees.payment_date;
-----------
SELECT Feedefaulter.feedef_id,Feedefaulter.amountdue, Students.first_name, Students.last_name, departments.department_name
FROM Feedefaulter
INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
INNER JOIN departments ON Feedefaulter.sdepartment_id = departments.department_id
where Feedefaulter.amountdue between 12000 and 20000
GROUP BY Feedefaulter.feedef_id,Feedefaulter.amountdue, Students.first_name, Students.last_name, departments.department_name
------------
SELECT grades.*, Students.first_name, Students.last_name, Subjects.subject_name
FROM grades
INNER JOIN Students ON grades.student_id = Students.student_id
INNER JOIN Subjects ON grades.subject_id = Subjects.subject_id
where Students.gender='female' or Subjects.sdepartment_id=3
ORDER BY grades.grade_id;
------
SELECT exams.*, Subjects.subject_name
FROM exams
INNER JOIN Subjects ON exams.subject_id = Subjects.subject_id
where exams.exam_date='2023-06-07' or Subjects.subject_name='PF'
ORDER BY exams.exam_date;
---------
SELECT salary.salary_id,salary.payment_date, Teachers.first_name, Teachers.last_name, departments.department_name
FROM salary
INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
INNER JOIN departments ON salary.department_id = departments.department_id
where Teachers.gender='female' or departments.department_name='English'
GROUP BY salary.salary_id,salary.payment_date, Teachers.first_name, Teachers.last_name, departments.department_name;
--------
SELECT Students.first_name,Students.student_id, Enrollments.enrollment_id, Enrollments.subject_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
where Enrollments.enrollment_id=1 and Students.gender='FEMALE'
group by Students.first_name,Students.student_id, Enrollments.enrollment_id, Enrollments.subject_id
ORDER BY Students.student_id;
-------------
SELECT Subjects.subject_id,Subjects.credithour, sdepartments.sdepartment_name
FROM Subjects
INNER JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id
where Subjects.credithour between 2 and 5
group by Subjects.subject_id,Subjects.credithour, sdepartments.sdepartment_name
ORDER BY Subjects.credithour;
-----------
SELECT Teachers.first_name, departments.department_name, departments.department_id
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id
where departments.department_name='CS 'OR departments.department_name='SE'
GROUP BY Teachers.first_name, departments.department_name, departments.department_id
order by departments.department_id
-----------------------
SELECT Students.*, attendance.attendance_id, attendance.date
FROM Students
INNER JOIN attendance ON Students.student_id = attendance.student_id
where Attendance.date='2022-10-5' or  Students.gender='male'
ORDER BY Students.last_name;
------------
SELECT fees.*, Students.first_name, Students.last_name, fees.payment_date
FROM fees
INNER JOIN Students ON fees.student_id = Students.student_id
GROUP BY Students.student_id;
------------
SELECT Feedefaulter.*, Students.first_name, Students.last_name, Feedefaulter.amountdue
FROM Feedefaulter
INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
where Students.sdepartment_id=1 or Students.gender='male'
ORDER BY Feedefaulter.amountdue;
-----------
SELECT grades.grade_id, Students.first_name, Students.last_name, grades.exam_id
FROM grades
INNER JOIN Students ON grades.student_id = Students.student_id
WHERE Students.gender = 'Male' AND grades.grade = 'A'
GROUP BY grades.grade_id, Students.first_name, Students.last_name, grades.exam_id;

-----------
SELECT exams.*, Subjects.subject_name, exams.exam_date
FROM exams
INNER JOIN Subjects ON exams.subject_id = Subjects.subject_id
WHERE exams.exam_date >= '2023-01-01' AND Subjects.subject_name LIKE '%Math%'
ORDER BY exams.exam_date;

-------------
SELECT salary.salary_id, Teachers.first_name, Teachers.last_name, salary.payment_date
FROM salary
INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
WHERE salary.amount > 5000 AND Teachers.gender = 'Male'
GROUP BY salary.salary_id, Teachers.first_name, Teachers.last_name, salary.payment_date;
-----------
SELECT Students.*, Enrollments.enrollment_id, Enrollments.subject_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Students.gender = 'Female' AND Enrollments.subject_id = 1
ORDER BY Students.last_name;

---------
SELECT Students.student_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
WHERE Subjects.credithour > 3 or Subjects.subject_name='CS'
group by Students.student_id
-------------
SELECT Teachers.first_name,Teachers.department_id
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id
INNER JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE departments.department_name = 'Science' AND salary.amount > 5000
order by Teachers.department_id;
-------
SELECT Subjects.subject_id,Subjects.subject_name
FROM Subjects
INNER JOIN exams ON Subjects.subject_id = exams.subject_id
WHERE exams.exam_date = '2023-01-01' or exams.exam_date='2023-01-03'
group by Subjects.subject_id,Subjects.subject_name

--------
SELECT Teachers.first_name,Teachers.subject_id
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id
WHERE departments.department_name IN ('Mathematics', 'Physics')
order by Teachers.first_name
----------
SELECT Students.student_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
where Enrollments.enrollment_id=1 or Students.gender='male'
GROUP BY Students.student_id;
-----------
SELECT Subjects.subject_id,Subjects.subject_name
FROM Subjects
LEFT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id
WHERE Teachers.teacher_id IS NULL
order by Subjects.subject_id;
-----------
SELECT Students.student_id,Students.first_name
FROM Students
INNER JOIN departments ON Students.sdepartment_id = departments.department_id
WHERE Students.date_of_birth = '2000-01-01' AND departments.department_name = 'Engineering'
group by Students.student_id,Students.first_name;
-----
SELECT Teachers.first_name,Teachers.department_id
FROM Teachers
INNER JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE salary.amount BETWEEN 4000 AND 6000
order by Teachers.department_id;
---------
SELECT Students.student_id,Students.sdepartment_id
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
INNER JOIN departments ON Students.sdepartment_id = departments.department_id
WHERE Subjects.credithour > 3 AND departments.department_name = 'Science'
group by Students.student_id,Students.sdepartment_id
order by Students.student_id;
-------
SELECT Teachers.first_name,Teachers.department_id
FROM Teachers
INNER JOIN departments ON Teachers.department_id = departments.department_id
INNER JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE departments.department_name = 'Mathematics' OR salary.amount > 5000
order by Teachers.first_name;
--------
SELECT Subjects.subject_id,Subjects.subject_name
FROM Subjects
LEFT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id
WHERE Teachers.teacher_id = 1 and Subjects.subject_id=2
order by Subjects.subject_id;

-------- (18)
--left join
SELECT Students.*, sdepartments.sdepartment_name
FROM Students
LEFT JOIN sdepartments ON Students.sdepartment_id = sdepartments.sdepartment_id;
--------
SELECT Subjects.*, Teachers.first_name, Teachers.last_name
FROM Subjects
LEFT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id;
-----
SELECT Students.*, Enrollments.enrollment_id
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id;
-------
SELECT Subjects.*, exams.exam_date
FROM Subjects
LEFT JOIN exams ON Subjects.subject_id = exams.subject_id;
--------
SELECT Students.*, attendance.date
FROM Students
LEFT JOIN attendance ON Students.student_id = attendance.student_id;
-------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
LEFT JOIN fees ON Students.student_id = fees.student_id;
--------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
LEFT JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id;
--------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
LEFT JOIN salary ON Teachers.teacher_id = salary.teacher_id;
----------
SELECT Subjects.*, grades.grade
FROM Subjects
LEFT JOIN grades ON Subjects.subject_id = grades.subject_id;
------------
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
LEFT JOIN Teachers ON departments.department_id = Teachers.department_id;
--------
SELECT Students.*
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.enrollment_id IS NULL;
--------------
SELECT Subjects.*
FROM Subjects
LEFT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id
WHERE Teachers.teacher_id IS NULL;
------------
SELECT Students.*, attendance.date
FROM Students
LEFT JOIN attendance ON Students.student_id = attendance.student_id
WHERE attendance.date = '2023-06-01';
-----------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
LEFT JOIN fees ON Students.student_id = fees.student_id
WHERE fees.payment_date = '2023-06-15';
----------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
LEFT JOIN fees ON Students.student_id = fees.student_id
WHERE fees.payment_date = '2023-06-15';
-------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
LEFT JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id
WHERE Feedefaulter.amountdue > 1000;
----------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
LEFT JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE salary.payment_date = '2023-06-30';
----------
SELECT Subjects.*, grades.grade
FROM Subjects
LEFT JOIN grades ON Subjects.subject_id = grades.subject_id
WHERE grades.exam_id = 1;

-----------
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
LEFT JOIN Teachers ON departments.department_id = Teachers.department_id
WHERE departments.department_name = 'Science';
--------
SELECT Students.*, sdepartments.sdepartment_name
FROM Students
LEFT JOIN sdepartments ON Students.sdepartment_id = sdepartments.sdepartment_id
ORDER BY Students.student_id ASC;
--------
SELECT Subjects.*, Teachers.first_name, Teachers.last_name
FROM Subjects
LEFT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id
ORDER BY Subjects.subject_name DESC;
----------- (19)
--right join
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
RIGHT JOIN Teachers ON departments.department_id = Teachers.department_id;
----------
SELECT Subjects.*, exams.exam_date
FROM Subjects
RIGHT JOIN exams ON Subjects.subject_id = exams.subject_id;
--------
SELECT Teachers.*, Subjects.subject_name
FROM Teachers
RIGHT JOIN Subjects ON Teachers.subject_id = Subjects.subject_id;
-----
SELECT Students.*, Enrollments.enrollment_id
FROM Students
RIGHT JOIN Enrollments ON Students.student_id = Enrollments.student_id;
--------
SELECT Students.*, attendance.date
FROM Students
RIGHT JOIN attendance ON Students.student_id = attendance.student_id;
------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
RIGHT JOIN fees ON Students.student_id = fees.student_id;
----------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
RIGHT JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id;
------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
RIGHT JOIN salary ON Teachers.teacher_id = salary.teacher_id;
--------
SELECT Subjects.*, grades.grade
FROM Subjects
RIGHT JOIN grades ON Subjects.subject_id = grades.subject_id;
----------
SELECT Subjects.*, sdepartments.sdepartment_name
FROM Subjects
RIGHT JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id;
----------
SELECT Teachers.*
FROM Teachers
RIGHT JOIN Subjects ON Teachers.subject_id = Subjects.subject_id
WHERE Subjects.subject_id IS NULL;
-------------
SELECT exams.*
FROM exams
RIGHT JOIN Subjects ON exams.subject_id = Subjects.subject_id
WHERE Subjects.subject_id IS NULL;
-------------
SELECT Students.*, attendance.date
FROM Students
RIGHT JOIN attendance ON Students.student_id = attendance.student_id
WHERE attendance.date = '2023-06-01';
---------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
RIGHT JOIN fees ON Students.student_id = fees.student_id
WHERE fees.payment_date = '2023-06-15';
---------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
RIGHT JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id
WHERE Feedefaulter.amountdue > 1000;
----------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
RIGHT JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE salary.payment_date = '2023-06-30';
-----------
SELECT Subjects.*, grades.grade
FROM Subjects
RIGHT JOIN grades ON Subjects.subject_id = grades.subject_id
WHERE grades.exam_id = 1;
---------
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
RIGHT JOIN Teachers ON departments.department_id = Teachers.department_id
WHERE departments.department_name = 'Science';
---------
SELECT Students.*, sdepartments.sdepartment_name
FROM Students
RIGHT JOIN sdepartments ON Students.sdepartment_id = sdepartments.sdepartment_id
ORDER BY Students.student_id ASC;
---------
SELECT Subjects.*, Teachers.first_name, Teachers.last_name
FROM Subjects
RIGHT JOIN Teachers ON Subjects.subject_id = Teachers.subject_id
ORDER BY Subjects.subject_name DESC;
--------------- (20)
--full Outer join
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
FULL OUTER JOIN Teachers ON departments.department_id = Teachers.department_id;

---
SELECT Subjects.*, exams.exam_date
FROM Subjects
FULL OUTER JOIN exams ON Subjects.subject_id = exams.subject_id;
------
SELECT Teachers.*, Subjects.subject_name
FROM Teachers
FULL OUTER JOIN Subjects ON Teachers.subject_id = Subjects.subject_id;
--------
SELECT Students.*, Enrollments.enrollment_id
FROM Students
FULL OUTER JOIN Enrollments ON Students.student_id = Enrollments.student_id;
--------
SELECT Students.*, attendance.date
FROM Students
FULL OUTER JOIN attendance ON Students.student_id = attendance.student_id;
------------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
FULL OUTER JOIN fees ON Students.student_id = fees.student_id;
----------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
FULL OUTER JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id;
-----------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
FULL OUTER JOIN salary ON Teachers.teacher_id = salary.teacher_id;
----------
SELECT Subjects.*, grades.grade
FROM Subjects
FULL OUTER JOIN grades ON Subjects.subject_id = grades.subject_id;
--------
SELECT Subjects.*, sdepartments.sdepartment_name
FROM Subjects
FULL OUTER JOIN sdepartments ON Subjects.sdepartment_id = sdepartments.sdepartment_id;
----------------
SELECT Teachers.*
FROM Teachers
FULL OUTER JOIN Subjects ON Teachers.subject_id = Subjects.subject_id
WHERE Subjects.subject_id IS NULL;
------------
SELECT exams.*
FROM exams
FULL OUTER JOIN Subjects ON exams.subject_id = Subjects.subject_id
WHERE Subjects.subject_id IS NULL;
----------------
SELECT Students.*, attendance.date
FROM Students
FULL OUTER JOIN attendance ON Students.student_id = attendance.student_id
WHERE attendance.date = '2023-06-01';
------------
SELECT Students.*, fees.amount, fees.payment_date
FROM Students
FULL OUTER JOIN fees ON Students.student_id = fees.student_id
WHERE fees.payment_date = '2023-06-15';
----------
SELECT Students.*, Feedefaulter.amountdue
FROM Students
FULL OUTER JOIN Feedefaulter ON Students.student_id = Feedefaulter.student_id
WHERE Feedefaulter.amountdue > 1000;
---------
SELECT Teachers.*, salary.amount, salary.payment_date
FROM Teachers
FULL OUTER JOIN salary ON Teachers.teacher_id = salary.teacher_id
WHERE salary.payment_date = '2023-06-30';
---------
SELECT Students.*, grades.grade
FROM Students
FULL OUTER JOIN grades ON Students.student_id = grades.student_id
WHERE grades.subject_id = 1;
--------
SELECT Students.*, Enrollments.enrollment_id
FROM Students
FULL OUTER JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.subject_id = 1;
------------
SELECT departments.*, Teachers.first_name, Teachers.last_name
FROM departments
FULL OUTER JOIN Teachers ON departments.department_id = Teachers.department_id
WHERE Teachers.first_name = 'John' AND Teachers.last_name = 'Doe';
----------
SELECT Subjects.*, exams.exam_date
FROM Subjects
FULL OUTER JOIN exams ON Subjects.subject_id = exams.subject_id
WHERE exams.exam_date = '2023-07-15';


-------- (21)
---stored proceedure
CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;
---------
CREATE PROCEDURE GetAllDepartments
AS
BEGIN
    SELECT * FROM departments;
END;
----
CREATE PROCEDURE GetAllSubjects
AS
BEGIN
    SELECT * FROM Subjects;
END;
-----
CREATE PROCEDURE GetAllTeachers
AS
BEGIN
    SELECT * FROM Teachers;
END;
--------
CREATE PROCEDURE GetAllEnrollments
AS
BEGIN
    SELECT * FROM Enrollments;
END;
----------
CREATE PROCEDURE GetAllAttendance
AS
BEGIN
    SELECT * FROM attendance;
END;
-----------
CREATE PROCEDURE GetAllFees
AS
BEGIN
    SELECT * FROM fees;
END;
----------
CREATE PROCEDURE GetAllFeeDefaulters
AS
BEGIN
    SELECT * FROM Feedefaulter;
END;
----------
CREATE PROCEDURE GetAllSalaries
AS
BEGIN
    SELECT * FROM salary;
END;
-------
CREATE PROCEDURE GetAllExams
AS
BEGIN
    SELECT * FROM exams;
END;
---------
CREATE PROCEDURE GetAllGrades
AS
BEGIN
    SELECT * FROM grades;
END;
--------
CREATE PROCEDURE GetStudentsWithDepartments
AS
BEGIN
    SELECT Students.*, departments.department_name
    FROM Students
    INNER JOIN departments ON Students.sdepartment_id = departments.department_id;
END;
-----------
CREATE PROCEDURE GetTeachersWithDepartments
AS
BEGIN
    SELECT Teachers.*, departments.department_name
    FROM Teachers
    INNER JOIN departments ON Teachers.department_id = departments.department_id;
END;
-------
CREATE PROCEDURE GetSubjectsWithDepartments
AS
BEGIN
    SELECT Subjects.*, departments.department_name
    FROM Subjects
    INNER JOIN departments ON Subjects.department_id = departments.department_id;
END;
------------
CREATE PROCEDURE GetEnrollmentsWithStudents
AS
BEGIN
    SELECT Enrollments.*, Students.first_name, Students.last_name
    FROM Enrollments
    INNER JOIN Students ON Enrollments.student_id = Students.student_id;
END;
-----------
CREATE PROCEDURE GetAttendanceWithStudents
AS
BEGIN
    SELECT attendance.*, Students.first_name, Students.last_name
    FROM attendance
    INNER JOIN Students ON attendance.student_id = Students.student_id;
END;
-------------
CREATE PROCEDURE GetFeesWithStudentsAndDepartments
AS
BEGIN
    SELECT fees.*, Students.first_name, Students.last_name, departments.department_name
    FROM fees
    INNER JOIN Students ON fees.student_id = Students.student_id
    INNER JOIN departments ON fees.sdepartment_id = departments.department_id;
END;
----------
CREATE PROCEDURE GetFeeDefaultersWithStudentsAndDepartments
AS
BEGIN
    SELECT Feedefaulter.*, Students.first_name, Students.last_name, departments.department_name
    FROM Feedefaulter
    INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
    INNER JOIN departments ON Feedefaulter.sdepartment_id = departments.department_id;
END;
------
CREATE PROCEDURE GetSalariesWithTeachersAndDepartments
AS
BEGIN
    SELECT salary.*, Teachers.first_name, Teachers.last_name, departments.department_name
    FROM salary
    INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
    INNER JOIN departments ON salary.department_id = departments.department_id;
END;
-------------
CREATE PROCEDURE GetGradesWithStudentsSubjectsAndExams
AS
BEGIN
    SELECT grades.*, Students.first_name, Students.last_name, Subjects.subject_name, exams.exam_date
    FROM grades
    INNER JOIN Students ON grades.student_id = Students.student_id
    INNER JOIN Subjects ON grades.subject_id = Subjects.subject_id
    INNER JOIN exams ON grades.exam_id = exams.exam_id;
END;
---------------
CREATE PROCEDURE GetStudentsWithEnrolledSubjects
AS
BEGIN
    SELECT Students.*, Subjects.subject_name
    FROM Students
    INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
    INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id;
END;
---------
CREATE PROCEDURE GetTeachersWithAssignedSubjects
AS
BEGIN
    SELECT Teachers.*, Subjects.subject_name
    FROM Teachers
    INNER JOIN Subjects ON Teachers.subject_id = Subjects.subject_id;
END;
-----------
CREATE PROCEDURE GetStudentsWithAttendance
AS
BEGIN
    SELECT Students.*, attendance.date
    FROM Students
    INNER JOIN attendance ON Students.student_id = attendance.student_id;
END;
---------
CREATE PROCEDURE GetStudentsWithFeesAndDepartments
AS
BEGIN
    SELECT Students.*, fees.amount, departments.department_name
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    INNER JOIN departments ON Students.sdepartment_id = departments.department_id;
END;
-------
CREATE PROCEDURE GetStudentsWithGradesAndExams
AS
BEGIN
    SELECT Students.*, grades.grade, exams.exam_date
    FROM Students
    INNER JOIN grades ON Students.student_id = grades.student_id
    INNER JOIN exams ON grades.exam_id = exams.exam_id;
END;
---------- (22)
-- with parameters
CREATE PROCEDURE GetStudentWithEnrolledSubjects
    @student_id INT
AS
BEGIN
    SELECT Students.*, Subjects.subject_name
    FROM Students
    INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
    INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
    WHERE Students.student_id = @student_id;
END;
--------
CREATE PROCEDURE GetTeacherWithAssignedSubjects
    @teacher_id INT
AS
BEGIN
    SELECT Teachers.*, Subjects.subject_name
    FROM Teachers
    INNER JOIN Subjects ON Teachers.subject_id = Subjects.subject_id
    WHERE Teachers.teacher_id = @teacher_id;
END;
---------
CREATE PROCEDURE GetStudentWithAttendance
    @student_id INT
AS
BEGIN
    SELECT Students.*, attendance.date
    FROM Students
    INNER JOIN attendance ON Students.student_id = attendance.student_id
    WHERE Students.student_id = @student_id;
END;
---------
CREATE PROCEDURE GetStudentWithFeesAndDepartments
    @student_id INT
AS
BEGIN
    SELECT Students.*, fees.amount, departments.department_name
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    INNER JOIN departments ON Students.sdepartment_id = departments.department_id
    WHERE Students.student_id = @student_id;
END;
----------
CREATE PROCEDURE GetStudentWithGradesAndExams
    @student_id INT
AS
BEGIN
    SELECT Students.*, grades.grade, exams.exam_date
    FROM Students
    INNER JOIN grades ON Students.student_id = grades.student_id
    INNER JOIN exams ON grades.exam_id = exams.exam_id
    WHERE Students.student_id = @student_id;
END;
------------
CREATE PROCEDURE GetStudentsFromDepartmentWithEnrolledSubjects
    @department_id INT
AS
BEGIN
    SELECT Students.*, Subjects.subject_name
    FROM Students
    INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
    INNER JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
    WHERE Students.sdepartment_id = @department_id;
END;
---------
CREATE PROCEDURE GetTeachersFromDepartmentWithAssignedSubjects
    @department_id INT
AS
BEGIN
    SELECT Teachers.*, Subjects.subject_name
    FROM Teachers
    INNER JOIN Subjects ON Teachers.subject_id = Subjects.subject_id
    WHERE Teachers.department_id = @department_id;
END;
-----------
CREATE PROCEDURE GetStudentsFromDepartmentWithAttendance
    @department_id INT
AS
BEGIN
    SELECT Students.*, attendance.date
    FROM Students
    INNER JOIN attendance ON Students.student_id = attendance.student_id
    WHERE Students.sdepartment_id = @department_id;
END;
----------
CREATE PROCEDURE GetStudentsFromDepartmentWithFeesAndDepartments
    @department_id INT
AS
BEGIN
    SELECT Students.*, fees.amount, departments.department_name
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    INNER JOIN departments ON Students.sdepartment_id = departments.department_id
    WHERE Students.sdepartment_id = @department_id;
END;
-------------
CREATE PROCEDURE GetStudentsFromDepartmentWithGradesAndExams
    @department_id INT
AS
BEGIN
    SELECT Students.*, grades.grade, exams.exam_date
    FROM Students
    INNER JOIN grades ON Students.student_id = grades.student_id
    INNER JOIN exams ON grades.exam_id = exams.exam_id
    WHERE Students.sdepartment_id = @department_id;
END;
-----------
CREATE PROCEDURE GetStudentsEnrolledInSubject
    @subject_id INT
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
    WHERE Enrollments.subject_id = @subject_id;
END;
-----------
CREATE PROCEDURE GetTeachersAssignedToSubject
    @subject_id INT
AS
BEGIN
    SELECT Teachers.*
    FROM Teachers
    WHERE Teachers.subject_id = @subject_id;
END;
-----------
CREATE PROCEDURE GetStudentsWithExamAttendance
    @exam_date DATE
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN attendance ON Students.student_id = attendance.student_id
    INNER JOIN exams ON attendance.subject_id = exams.subject_id
    WHERE exams.exam_date = @exam_date;
END;
----------
CREATE PROCEDURE GetStudentsWithFeesAmount
    @fees_amount INT
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    WHERE fees.amount = @fees_amount;
END;
---------
CREATE PROCEDURE GetStudentsFromDepartmentWithFeeDue
    @department_id INT
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    WHERE Students.sdepartment_id = @department_id
    AND fees.amountdue > 0;
END;
--------
CREATE PROCEDURE GetStudentsWithSpecificGrade
    @subject_id INT,
    @grade VARCHAR(20)
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN grades ON Students.student_id = grades.student_id
    WHERE grades.subject_id = @subject_id
    AND grades.grade = @grade;
END;
---------
CREATE PROCEDURE GetTeachersWithSpecificSalary
    @salary_amount INT
AS
BEGIN
    SELECT Teachers.*
    FROM Teachers
    INNER JOIN salary ON Teachers.teacher_id = salary.teacher_id
    WHERE salary.amount = @salary_amount;
END;
-------------
CREATE PROCEDURE GetTeachersFromDepartmentWithSalaryPayment
    @department_id INT,
    @payment_date DATE
AS
BEGIN
    SELECT Teachers.*
    FROM Teachers
    INNER JOIN salary ON Teachers.teacher_id = salary.teacher_id
    WHERE Teachers.department_id = @department_id
    AND salary.payment_date = @payment
	end
-----------
CREATE PROCEDURE GetStudentsWithExamAndGrade
    @exam_date DATE,
    @grade VARCHAR(20)
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN grades ON Students.student_id = grades.student_id
    INNER JOIN exams ON grades.exam_id = exams.exam_id
    WHERE exams.exam_date = @exam_date
    AND grades.grade = @grade;
END;
------
CREATE PROCEDURE GetStudentsByDepartment
    @department_id INT
AS
BEGIN
    SELECT Students.*
    FROM Students
    INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
    INNER JOIN departments ON Enrollments.sdepartment_id = departments.department_id
    WHERE departments.department_id = @department_id;
END;
----------
create procedure getfeesofstud
@stuid int
as
begin
select  payment_date from Fees 
where student_id=@stuid 
end
---------
create procedure getgrade
@stuid int
as
begin
select  grade from grades 
where student_id=@stuid 
end
---------------
CREATE PROCEDURE GetStudentsByDepartment
    @departmentName VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Students s
    INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
    WHERE sd.sdepartment_name LIKE '%' + @departmentName + '%'
END;
---------
CREATE PROCEDURE GetEnrollmentsBySubject
    @subjectName VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Enrollments e
    INNER JOIN Subjects s ON e.subject_id = s.subject_id
    WHERE s.subject_name LIKE '%' + @subjectName + '%'
END;
-------
CREATE PROCEDURE GetTeachersByGender
    @gender VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM Teachers
    WHERE gender = @gender
END;
------

------------- (23)

----with parameter using logical operators, group by 

-----------NEW
CREATE PROCEDURE GetStudentCountByDepartmentAndCreditHour
    @department_id INT,
    @credit_hour_threshold INT
AS
BEGIN
    SELECT s.sdepartment_id, COUNT(*) AS student_count
    FROM Students s
    INNER JOIN Enrollments e ON s.student_id = e.student_id
    INNER JOIN Subjects su ON e.subject_id = su.subject_id
    WHERE s.sdepartment_id = @department_id
        AND su.credithour > @credit_hour_threshold
    GROUP BY s.sdepartment_id
	order by s.sdepartment_id
END;


------------------------
CREATE PROCEDURE GetStudentCountByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT sdepartment_id AS department_id, gender, COUNT(*) AS student_count
    FROM Students
    WHERE sdepartment_id = @department_id AND gender = @gender
    GROUP BY sdepartment_id, gender;
	order by sdepartment_id
END;

--------------
CREATE PROCEDURE GetStudentCountByDepartmentAndGrade
    @department_id INT,
    @grade VARCHAR(10)
AS
BEGIN
    SELECT s.sdepartment_id AS department_id, g.grade, COUNT(*) AS student_count
    FROM Students s
    INNER JOIN grades g ON s.student_id = g.student_id
    WHERE s.sdepartment_id = @department_id AND g.grade = @grade
    GROUP BY s.sdepartment_id, g.grade
	order by s.sdepartment_i
END;


----------
CREATE PROCEDURE GetTeacherCountByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT department_id, gender, COUNT(*) AS teacher_count
    FROM Teachers
    WHERE department_id = @department_id AND gender = @gender
    GROUP BY department_id, gender
	order by department_id
END;

-----------
CREATE PROCEDURE GetEnrollmentCountBySubjectAndDepartment
    @subject_id INT,
    @department_id INT
AS
BEGIN
    SELECT e.subject_id, s.sdepartment_id, COUNT(*) AS enrollment_count
    FROM Enrollments e
    INNER JOIN Students s ON e.student_id = s.student_id
    INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
    WHERE e.subject_id = @subject_id AND sd.sdepartment_id = @department_id
    GROUP BY e.subject_id, s.sdepartment_id
	order by s.sdepartment_id
END;

-------------
CREATE PROCEDURE GetAttendanceCountByDate
    @date DATE,
    @st_id INT
AS
BEGIN
    SELECT date, student_id, COUNT(*) AS attendance_count
    FROM Attendance
    WHERE date = @date AND student_id = @st_id
    GROUP BY date, student_id
	order by student_id
END;

-----------

CREATE PROCEDURE GetStudentsByDepartmentAndContactNumber
    @departmentName VARCHAR(50),
    @contactNumber VARCHAR(20)
AS
BEGIN
    SELECT s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
    FROM Students s
    INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
    WHERE sd.sdepartment_name LIKE '%' + @departmentName + '%'
        AND s.contact_number LIKE '%' + @contactNumber + '%'
    GROUP BY s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
END;
------------
CREATE PROCEDURE GetAverageSalaryByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT Teachers.department_id, Teachers.gender, AVG(salary.amount) AS average_salary
    FROM salary
    INNER JOIN Teachers ON salary.teacher_id = Teachers.teacher_id
    WHERE Teachers.department_id = @department_id
        AND Teachers.gender = @gender
    GROUP BY Teachers.department_id, Teachers.gender
	order by Teachers.department_id
END;
--------------
CREATE PROCEDURE GetTotalAttendanceCountByDepartmentAndSubjects
    @s_id INT,
    @subject_id INT
AS
BEGIN
    SELECT Students.student_id, Attendance.subject_id, COUNT(*) AS attendance_count
    FROM attendance
    INNER JOIN Students ON attendance.student_id = Students.student_id
    WHERE Students.sdepartment_id = @s_id
        AND attendance.subject_id = @subject_id
    GROUP BY Students.student_id, Attendance.subject_id
	order by Students.student_id
END;
---------------
CREATE PROCEDURE GetTeachersBySubjectAndGender
    @subjectName VARCHAR(50),
    @gender VARCHAR(10)
AS
BEGIN
    SELECT t.*
    FROM Teachers t
    INNER JOIN Subjects s ON t.subject_id = s.subject_id
    WHERE s.subject_name LIKE '%' + @subjectName + '%'
        AND t.gender = @gender
    GROUP BY t.teacher_id, t.department_id, t.first_name, t.last_name, t.date_of_birth, t.gender, t.Aaddress, t.contact_number, t.email, t.subject_id;
END;
------------
CREATE PROCEDURE GetStudentsByDepartmentAndEmailDomain
    @departmentName VARCHAR(50),
    @emailDomain VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Students
    WHERE sdepartment_id IN (SELECT sdepartment_id FROM sdepartments WHERE sdepartment_name LIKE '%' + @departmentName + '%')
        AND email LIKE '%' + @emailDomain
    GROUP BY student_id, sdepartment_id, first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email;
END;

--------
CREATE PROCEDURE GetAverageAmountDueByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT Students.sdepartment_id AS department_id, Students.gender, AVG(Feedefaulter.amountdue) AS average_amount_due
    FROM Feedefaulter
    INNER JOIN Students ON Feedefaulter.student_id = Students.student_id
    WHERE Students.sdepartment_id = @department_id
        AND Students.gender = @gender
    GROUP BY Students.sdepartment_id, Students.gender;
END;

------------
CREATE PROCEDURE GetGenderCountByDepartment
    @department_id INT,
    @name VARCHAR(20)
AS
BEGIN
    SELECT gender, COUNT(*) AS gender_count
    FROM Students
    WHERE sdepartment_id = @department_id AND first_name LIKE '%' + @name + '%'
    GROUP BY gender;
END;

------------
CREATE PROCEDURE GetEnrollmentsByStudentAndSubject
    @studentID INT,
    @subjectID INT
AS
BEGIN
    SELECT student_id, subject_id, COUNT(*) AS enrollment_count
    FROM Enrollments
    WHERE student_id = @studentID
        AND subject_id = @subjectID
    GROUP BY student_id, subject_id
END;
------------
CREATE PROCEDURE GetStudentsByDepartmentAndGender
    @departmentName VARCHAR(50),
    @gender VARCHAR(10)
AS
BEGIN
    SELECT s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
    FROM Students s
    INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
    WHERE sd.sdepartment_name LIKE '%' + @departmentName + '%'
        AND s.gender = @gender
    GROUP BY s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
END;
-------
CREATE PROCEDURE GetTeachersBySubjectAndEmail
    @subjectName VARCHAR(50),
    @email VARCHAR(50)
AS
BEGIN
    SELECT t.teacher_id, t.department_id, t.first_name, t.last_name, t.date_of_birth, t.gender, t.Aaddress, t.contact_number, t.email, t.subject_id
    FROM Teachers t
    INNER JOIN Subjects s ON t.subject_id = s.subject_id
    WHERE s.subject_name LIKE '%' + @subjectName + '%'
        AND t.email LIKE '%' + @email + '%'
    GROUP BY t.teacher_id, t.department_id, t.first_name, t.last_name, t.date_of_birth, t.gender, t.Aaddress, t.contact_number, t.email, t.subject_id
END;
---------
	CREATE PROCEDURE GetStudentsByDepartmentAndAddress
		@departmentName VARCHAR(50),
		@address VARCHAR(100)
	AS
	BEGIN
		SELECT s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
		FROM Students s
		INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
		WHERE sd.sdepartment_name LIKE '%' + @departmentName + '%'
			AND s.Aaddress LIKE '%' + @address + '%'
		GROUP BY s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
	END;
-----------
CREATE PROCEDURE GetStudentCountByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT COUNT(*) AS student_count
    FROM Students
    WHERE sdepartment_id = @department_id AND gender = @gender;
END;
---------------------
CREATE PROCEDURE GetAverageFeesByDepartmentAndGender
    @department_id INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT Students.sdepartment_id, Students.gender, AVG(fees.amount) AS average_fees
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    WHERE Students.sdepartment_id = @department_id AND Students.gender = @gender
    GROUP BY Students.sdepartment_id, Students.gender;
END;
-------------------
CREATE PROCEDURE GetAverageCreditHourByDepartmentExcludingSubject
    @department_id INT,
    @subject_id INT
AS
BEGIN
    SELECT s.sdepartment_id, AVG(s.credithour) AS average_credit_hour
    FROM Subjects s
    WHERE s.sdepartment_id = @department_id AND s.subject_id != @subject_id
    GROUP BY s.sdepartment_id;
END;
-------------
CREATE PROCEDURE GetTeachersByDepartmentAndLastName
    @departmentName VARCHAR(50),
    @lastName VARCHAR(50)
AS
BEGIN
    SELECT t.teacher_id, t.first_name, t.last_name, t.date_of_birth, t.gender, t.Aaddress, t.contact_number, t.email, t.subject_id
    FROM Teachers t
    INNER JOIN departments d ON t.department_id = d.department_id
    WHERE d.department_name LIKE '%' + @departmentName + '%'
        AND t.last_name = @lastName
    GROUP BY t.teacher_id, t.first_name, t.last_name, t.date_of_birth, t.gender, t.Aaddress, t.contact_number, t.email, t.subject_id;
END;
---------------
CREATE PROCEDURE GetStudentsByEnrollmentAndGender
    @enrollmentID INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email
    FROM Students s
    INNER JOIN Enrollments e ON s.student_id = e.student_id
    WHERE e.enrollment_id = @enrollmentID
        AND s.gender = @gender
    GROUP BY s.student_id, s.sdepartment_id, s.first_name, s.last_name, s.date_of_birth, s.gender, s.Aaddress, s.contact_number, s.email;
END;
--------------
CREATE PROCEDURE GetMaxAgeByDepartment
    @department_id INT,
	@gender varchar(20)
AS
BEGIN
    SELECT Teachers.department_id, MAX(DATEDIFF(YEAR, Teachers.date_of_birth, GETDATE())) AS max_age
    FROM Teachers
    WHERE Teachers.department_id = @department_id and gender= @gender
    GROUP BY Teachers.department_id;
END;
------------
CREATE PROCEDURE GetTotalFeesPaidByGender
    @gender VARCHAR(10),
    @id INT
AS
BEGIN
    SELECT Students.gender, SUM(fees.amount) AS total_fees_paid
    FROM Students
    INNER JOIN fees ON Students.student_id = fees.student_id
    WHERE Students.gender = @gender AND Students.sdepartment_id = @id
    GROUP BY Students.gender;
END;
---------------
CREATE PROCEDURE GetMinCreditHourByDepartment
    @department_id INT
AS
BEGIN
    SELECT MIN(credithour) AS min_credit_hour
    FROM Subjects
    WHERE sdepartment_id = @department_id
    GROUP BY sdepartment_id;
END;


-----------
CREATE PROCEDURE GetAverageSalaryByGender
    @gender VARCHAR(10),
    @department_id INT
AS
BEGIN
    SELECT t.gender, AVG(s.amount) AS average_salary
    FROM salary s
    INNER JOIN Teachers t ON s.teacher_id = t.teacher_id
    WHERE t.gender = @gender AND t.department_id = @department_id
    GROUP BY t.gender;
END;

---------
CREATE PROCEDURE GetTeachersBySubjectAndGender
    @subjectName VARCHAR(50),
    @gender VARCHAR(10)
AS
BEGIN
    SELECT t.*
    FROM Teachers t
    INNER JOIN Subjects s ON t.subject_id = s.subject_id
    WHERE s.subject_name LIKE '%' + @subjectName + '%'
        AND t.gender = @gender
		
END
--------------------
CREATE PROCEDURE GetEnrollmentsByStudentAndSubject
    @studentID INT,
    @subjectID INT
AS
BEGIN
    SELECT enrollment_id, subject_id
    FROM Enrollments
    WHERE student_id = @studentID
        AND subject_id = @subjectID
		
END
---------
CREATE PROCEDURE GetTeachersBySubjectAndDateOfBirthRange
    @subjectName VARCHAR(50),
    @startDate DATE,
    @endDate DATE
AS
BEGIN
    SELECT t.first_name, t.department_id
    FROM Teachers t
    INNER JOIN Subjects s ON t.subject_id = s.subject_id
    WHERE s.subject_name LIKE '%' + @subjectName + '%'
        AND t.date_of_birth BETWEEN @startDate AND @endDate
    GROUP BY t.first_name, t.department_id
END;
------------
CREATE PROCEDURE GetStudentsByDepartmentAndDOBRange
    @departmentName VARCHAR(50),
    @startDate DATE,
    @endDate DATE
AS
BEGIN
    SELECT s.first_name, s.last_name
    FROM Students s
    INNER JOIN sdepartments sd ON s.sdepartment_id = sd.sdepartment_id
    WHERE sd.sdepartment_name LIKE '%' + @departmentName + '%'
        AND s.date_of_birth BETWEEN @startDate AND @endDate
    GROUP BY s.first_name, s.last_name
END;
------------------
CREATE PROCEDURE GetExamsBySubjectAndDateRange
    @subjectName VARCHAR(50),
    @startDate DATE,
    @endDate DATE
AS
BEGIN
    SELECT exam_id, subject_id, exam_date
    FROM exams
    WHERE subject_id IN (SELECT subject_id FROM Subjects WHERE subject_name LIKE '%' + @subjectName + '%')
        AND exam_date BETWEEN @startDate AND @endDate
    GROUP BY exam_id, subject_id, exam_date
END;
--------
CREATE PROCEDURE GetStudentsByAgeAndGender
    @minAge INT,
    @maxAge INT,
    @gender VARCHAR(10)
AS
BEGIN
    SELECT COUNT(*) AS student_count, gender
    FROM Students
    WHERE (DATEDIFF(YEAR, date_of_birth, GETDATE()) >= @minAge AND DATEDIFF(YEAR, date_of_birth, GETDATE()) <= @maxAge)
        AND gender = @gender
    GROUP BY gender
END;
-----------
CREATE PROCEDURE GetTeachersBySubjectOrDepartment
    @subjectName VARCHAR(50),
    @departmentName VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Teachers
    WHERE subject_id IN (SELECT subject_id FROM Subjects WHERE subject_name LIKE '%' + @subjectName + '%')
        OR department_id IN (SELECT department_id FROM departments WHERE department_name LIKE '%' + @departmentName + '%')
    
END;

---------

---Single-Row Functions UPPER, LOWER, LENGTH, SUBSTR using logical operators
select LOWER(first_name) from Students where student_id=3 and sdepartment_id=1
SELECT LOWER(first_name) FROM Students WHERE gender = 'male'and student_id=2;
SELECT LOWER(last_name) FROM Students WHERE gender = 'female' AND sdepartment_id = 1;
SELECT LOWER(department_name) FROM departments WHERE department_name LIKE '%science%' OR department_name LIKE '%technology%';
SELECT LOWER(subject_name) FROM Subjects WHERE subject_name LIKE '%math%' AND credithour > 3;
SELECT LOWER(first_name) FROM Teachers WHERE gender = 'male' AND (department_id = 1 OR subject_id = 2);
SELECT LOWER(Aaddress) FROM Students WHERE gender = 'female' AND (contact_number = '123456789' OR email = 'example@example.com');
SELECT LOWER(email) FROM Teachers WHERE gender = 'male' AND (department_id = 1 OR subject_id = 2);
SELECT LOWER(sdepartment_name) FROM sdepartments WHERE sdepartment_name LIKE '%engineering%' AND sdepartment_id = 1;
SELECT LOWER(contact_number) FROM Students WHERE gender = 'male' AND (sdepartment_id = 1 OR email = 'example@example.com');
SELECT LOWER(email) FROM Students WHERE gender = 'female' AND sdepartment_id = 1 AND contact_number LIKE '%123%';
SELECT UPPER(first_name) FROM Students WHERE gender = 'male' and student_id=2;
SELECT UPPER(last_name) FROM Students WHERE gender = 'female' AND sdepartment_id = 1;
SELECT UPPER(department_name) FROM departments WHERE department_name LIKE '%science%' OR department_name LIKE '%technology%';
SELECT UPPER(subject_name) FROM Subjects WHERE subject_name LIKE '%math%' AND credithour > 3;
SELECT UPPER(first_name) FROM Teachers WHERE gender = 'male' AND (department_id = 1 OR subject_id = 2);
SELECT UPPER(Aaddress) FROM Students WHERE gender = 'female' AND (contact_number = '123456789' OR email = 'example@example.com');
SELECT UPPER(email) FROM Teachers WHERE gender = 'male' AND (department_id = 1 OR subject_id = 2);
SELECT UPPER(sdepartment_name) FROM sdepartments WHERE sdepartment_name LIKE '%engineering%' AND sdepartment_id = 1;
SELECT UPPER(contact_number) FROM Students WHERE gender = 'male' AND (sdepartment_id = 1 OR email = 'example@example.com');
SELECT UPPER(email) FROM Students WHERE gender = 'female' AND sdepartment_id = 1 AND contact_number LIKE '%123%';
select len(first_name) from Students where student_id=1 or sdepartment_id=1
SELECT LEN(department_name) FROM departments WHERE department_id = 1 OR department_id = 2;
SELECT LEN(sdepartment_name) FROM sdepartments WHERE sdepartment_id = 1 AND sdepartment_id = 2;
SELECT LEN(subject_name) FROM Subjects WHERE subject_id = 1 OR subject_id = 2;
SELECT LEN(first_name) FROM Teachers WHERE teacher_id = 1 AND department_id = 1;
SELECT LEN(last_name) FROM Teachers WHERE department_id = 1 OR department_id = 2;
SELECT LEN(Aaddress) FROM Students WHERE student_id = 1 AND sdepartment_id = 1;
SELECT LEN(contact_number) FROM Students WHERE student_id = 1 OR student_id = 2;
SELECT LEN(email) FROM Students WHERE student_id = 1 AND sdepartment_id = 1;
SELECT LEN(department_name) FROM departments WHERE department_id = 1 AND department_id = 2;
SELECT LEN(sdepartment_name) FROM sdepartments WHERE sdepartment_id = 1 OR sdepartment_id = 2;
SELECT LEN(sdepartment_name) FROM sdepartments WHERE sdepartment_id = 1 OR sdepartment_name ='Math';
SELECT LEN(subject_name) FROM Subjects WHERE subject_id = 1 AND credithour < 4;
SELECT LEN(last_name) FROM Teachers WHERE department_id = 1 AND gender = 'Female';
SELECT LEN(department_name) FROM departments WHERE (department_id = 1 AND department_name = 'Mathematics') OR department_id = 3;
SELECT LEN(email) FROM Students WHERE (student_id = 1 AND sdepartment_id = 2) OR (gender = 'Female' AND sdepartment_id = 3);
SELECT LEN(contact_number) FROM Students WHERE student_id = 1 AND (gender = 'Male' OR sdepartment_id = 2);
SELECT LEN(Aaddress) FROM Students WHERE (student_id = 1 AND sdepartment_id = 2) OR gender = 'Female';
SELECT LEN(last_name) FROM Teachers WHERE (department_id = 1 OR department_id = 3) AND gender = 'Female';
SELECT LEN(first_name) FROM Students WHERE student_id = 1 AND (sdepartment_id = 2 OR gender = 'Male');
SELECT SUBSTRING(first_name, 1, 2) AS ExtractString FROM Students WHERE student_id = 1 OR sdepartment_id = 1;
SELECT SUBSTRING(first_name, 1, 3) AS ExtractString FROM Students WHERE student_id = 2 AND sdepartment_id = 2;
SELECT SUBSTRING(first_name, 1, 4) AS ExtractString FROM Students WHERE student_id = 3 OR sdepartment_id = 3;
SELECT SUBSTRING(first_name, 2, 4) AS ExtractString FROM Students WHERE student_id = 4 AND sdepartment_id = 4;
SELECT SUBSTRING(first_name, LEN(first_name) - 2, LEN(first_name)) AS ExtractString FROM Students WHERE student_id = 5 OR sdepartment_id = 5;
SELECT SUBSTRING(first_name, 3, 2) AS ExtractString FROM Students WHERE student_id = 6 AND sdepartment_id = 6;
SELECT SUBSTRING(first_name, 2, 3) AS ExtractString FROM Students WHERE student_id = 10 AND sdepartment_id = 10;
SELECT SUBSTRING(contact_number, 1, 3) AS ExtractString FROM Students WHERE student_id = 3 AND sdepartment_id = 1;

SELECT SUBSTRING(email, 1, 1) AS ExtractString FROM Students WHERE sdepartment_id = 3;
SELECT SUBSTRING(last_name, LEN(last_name) - 2, LEN(last_name)) AS ExtractString FROM Students WHERE student_id = 2 OR sdepartment_id = 2;




--------------------
BEGIN TRY
    INSERT INTO Students (student_id, sdepartment_id, first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email)
    VALUES (1, 1, 'John', 'Doe', '2000-01-01', 'Male', '123 Main St', '1234567890', 'john.doe@example.com');
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to insert student.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------------------
BEGIN TRY
    UPDATE Students
    SET sdepartment_id = 2
    WHERE student_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update student department.';
    PRINT ERROR_MESSAGE();
END CATCH;
-----------
BEGIN TRY
    DELETE FROM Students
    WHERE student_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete student.';
    PRINT ERROR_MESSAGE();
END CATCH;
------------
BEGIN TRY
    INSERT INTO departments (department_id, department_name)
    VALUES (1, 'Science');
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to insert department.';
    PRINT ERROR_MESSAGE();
END CATCH;
-----------
BEGIN TRY
    UPDATE departments
    SET department_name = 'Mathematics'
    WHERE department_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update department name.';
    PRINT ERROR_MESSAGE();
END CATCH;
------
BEGIN TRY
    DELETE FROM departments
    WHERE department_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete department.';
    PRINT ERROR_MESSAGE();
END CATCH;
-------
BEGIN TRY
    INSERT INTO Subjects (subject_id, subject_name, credithour)
    VALUES (1, 'Mathematics', 3);
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to insert subject.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------
BEGIN TRY
    UPDATE Subjects
    SET subject_name = 'Physics'
    WHERE subject_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update subject name.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------
BEGIN TRY
    DELETE FROM Subjects
    WHERE subject_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete subject.';
    PRINT ERROR_MESSAGE();
END CATCH;
----------
BEGIN TRY
    INSERT INTO Teachers (teacher_id, department_id, first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email, subject_id)
    VALUES (1, 1, 'Jane', 'Smith', '1980-01-01', 'Female', '456 Elm St', '9876543210', 'jane.smith@example.com', 1);
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to insert teacher.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------
BEGIN TRY
    UPDATE Teachers
    SET department_id = 2
    WHERE teacher_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update teacher department.';
    PRINT ERROR_MESSAGE();
END CATCH;
--------
BEGIN TRY
    DELETE FROM Teachers
    WHERE teacher_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete teacher.';
    PRINT ERROR_MESSAGE();
END CATCH;
---
BEGIN TRY
    INSERT INTO Enrollments (enrollment_id, student_id)
    VALUES (1, 1);
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to enroll student in subject.';
    PRINT ERROR_MESSAGE();
END CATCH;
----------
BEGIN TRY
    UPDATE Enrollments
    SET student_id = 2
    WHERE enrollment_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update enrollment.';
    PRINT ERROR_MESSAGE();
END CATCH;
-----------
BEGIN TRY
    DELETE FROM Enrollments
    WHERE enrollment_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete enrollment.';
    PRINT ERROR_MESSAGE();
END CATCH;
----------
BEGIN TRY
    INSERT INTO attendance (attendance_id, student_id, subject_id, date)
    VALUES (1, 1, 1, '2023-01-01');
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to mark attendance.';
    PRINT ERROR_MESSAGE();
END CATCH;
-------
BEGIN TRY
    UPDATE attendance
    SET student_id = 2
    WHERE attendance_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update attendance.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------
BEGIN TRY
    UPDATE attendance
    SET student_id = 2
    WHERE attendance_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update attendance.';
    PRINT ERROR_MESSAGE();
END CATCH;
---------
BEGIN TRY
    DELETE FROM attendance
    WHERE attendance_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to delete attendance.';
    PRINT ERROR_MESSAGE();
END CATCH;
-----------
BEGIN TRY
    INSERT INTO fees (fee_id, student_id, sdepartment_id, amount, payment_date)
    VALUES (1, 1, 1, 1000, '2023-01-01');
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to insert fee record.';
    PRINT ERROR_MESSAGE();
END CATCH;
----------
BEGIN TRY
    UPDATE fees
    SET amount = 1500
    WHERE fee_id = 1;
END TRY
BEGIN CATCH
    -- Handle exception
    PRINT 'Error: Failed to update fee record.';
    PRINT ERROR_MESSAGE();
END CATCH;
-----


--Transaction
Begin tran
INSERT INTO Students (student_id, sdepartment_id, first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email)
VALUES (1, 1, 'John', 'Doe', '2000-01-01', 'Male', '123 Main St', '1234567890', 'john.doe@example.com');
rollback
commit
---
Begin tran
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Science');

rollback
commit
------
Begin tran
DELETE FROM fees
WHERE fee_id = 1;
rollback
commit
--------
Begin tran
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Science');
rollback
commit
------
Begin tran
UPDATE Students
SET sdepartment_id = 2
WHERE student_id = 1;
rollback
commit
------------
Begin tran
DELETE FROM Students
WHERE student_id = 1;
rollback
commit
----------
Begin tran
INSERT INTO Subjects (subject_id, subject_name, credithour)
VALUES (1, 'Mathematics', 3);
rollback
commit
----------
Begin tran
INSERT INTO Teachers (teacher_id, department_id, first_name, last_name, date_of_birth, gender, Aaddress, contact_number, email, subject_id)
VALUES (1, 1, 'Jane', 'Smith', '1980-01-01', 'Female', '456 Elm St', '9876543210', 'jane.smith@example.com', 1);
rollback
commit
--------------
Begin tran
UPDATE Teachers
SET department_id = 2
WHERE teacher_id = 1;
rollback
commit
-------
Begin tran
DELETE FROM Teachers
WHERE teacher_id = 1;
rollback
commit
--------
Begin tran
INSERT INTO Enrollments (enrollment_id, student_id)
VALUES (1, 1);
rollback
commit
-----------
Begin tran
UPDATE Enrollments
SET student_id = 2
WHERE enrollment_id = 1;
rollback
commit
-------
Begin tran
DELETE FROM Enrollments
WHERE enrollment_id = 1;
rollback
commit
------------
Begin tran
INSERT INTO attendance (attendance_id, student_id, subject_id, date)
VALUES (1, 1, 1, '2023-01-01');
rollback
commit
-----------
Begin tran
UPDATE attendance
SET student_id = 2
WHERE attendance_id = 1;
rollback
commit
------------
Begin tran
DELETE FROM attendance
WHERE attendance_id = 1;
rollback
commit
------------
Begin tran
INSERT INTO fees (fee_id, student_id, sdepartment_id, amount, payment_date)
VALUES (1, 1, 1, 1000, '2023-01-01');
rollback
commit
--------------
Begin tran
UPDATE fees
SET amount = 1500
WHERE fee_id = 1;
rollback
commit
--------------
Begin tran
INSERT INTO grades (grade_id, student_id, subject_id, exam_id, grade)
VALUES (1, 1, 1, 1, 'A');
rollback
commit
-------------
Begin tran
UPDATE grades
SET grade = 'B'
WHERE grade_id = 1;
rollback
commit
---------------


