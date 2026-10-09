--Q1: Create Tables with Constraints
CREATE TABLE MyDepartment (
    Dept_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE Gender (
    Gender_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(20) NOT NULL
);

CREATE TABLE University (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL
);

CREATE TABLE MyEmployee (
    ID NUMBER PRIMARY KEY,
    LAST_NAME VARCHAR2(50) NOT NULL,
    FIRST_NAME VARCHAR2(50) NOT NULL,
    HIRE_DATE DATE,
    USERID NUMBER, -- We use this as Manager ID for self-join
    SALARY NUMBER CHECK (SALARY > 0),
    DEPT_ID NUMBER,
    Gender_ID NUMBER,
    University_ID NUMBER,
    JOB_TITLE VARCHAR2(50), -- Added to solve Q3 requirement
    EMP_IMAGE BLOB,
    CONSTRAINT fk_dept FOREIGN KEY (DEPT_ID) REFERENCES MyDepartment(Dept_ID),
    CONSTRAINT fk_gender FOREIGN KEY (Gender_ID) REFERENCES Gender(Gender_ID),
    CONSTRAINT fk_univ FOREIGN KEY (University_ID) REFERENCES University(ID),
    CONSTRAINT fk_manager FOREIGN KEY (USERID) REFERENCES MyEmployee(ID)
);

-- Q2: Retrieve Employee Data with JOINs
SELECT 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS "Employee Name",
    e.SALARY AS "Salary",
    d.Name AS "Department Name",
    m.FIRST_NAME || ' ' || m.LAST_NAME AS "Manager Name",
    g.Name AS "Gender Name",
    u.Name AS "Employee University"
FROM MyEmployee e
LEFT JOIN MyDepartment d ON e.DEPT_ID = d.Dept_ID
LEFT JOIN MyEmployee m ON e.USERID = m.ID
LEFT JOIN Gender g ON e.Gender_ID = g.Gender_ID
LEFT JOIN University u ON e.University_ID = u.ID;

-- Q3: Display job titles and total payroll > $2500 (excluding sales)
SELECT JOB_TITLE, SUM(SALARY) AS "Total Monthly Salary"
FROM MyEmployee
WHERE UPPER(JOB_TITLE) != 'SALES'
GROUP BY JOB_TITLE
HAVING SUM(SALARY) > 2500;

-- Q5: Oracle Function F_HR_QUERY (with initial data)
INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE) 
VALUES (1, 'SCOTT', 'DOE', TO_DATE('09/09/1987', 'DD/MM/YYYY'));
INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE) 
VALUES (2, 'Ahmad', 'ALI', TO_DATE('10/10/1980', 'DD/MM/YYYY'));
INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE) 
VALUES (3, 'Rami', 'OMAR', TO_DATE('24/05/1986', 'DD/MM/YYYY'));

CREATE OR REPLACE FUNCTION F_HR_QUERY
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
    v_scott_hire_date DATE;
BEGIN
    SELECT HIRE_DATE INTO v_scott_hire_date FROM MyEmployee WHERE FIRST_NAME = 'SCOTT';
    
    OPEN v_cursor FOR
        SELECT FIRST_NAME || ' ' || LAST_NAME AS Employee_Name, HIRE_DATE
        FROM MyEmployee
        WHERE HIRE_DATE > v_scott_hire_date;
        
    RETURN v_cursor;
END;
/

-- Q6: Oracle Procedure P_COPY_EMPLOYEE
CREATE TABLE MyEmployee_update AS SELECT * FROM MyEmployee WHERE 1=0;

CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE
IS
BEGIN
    INSERT INTO MyEmployee_update
    SELECT * FROM MyEmployee;
    COMMIT;
END;
/
