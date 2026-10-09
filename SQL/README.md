# SQL Assignment Answers

## Q4 Answer
The original code: SELECT empno, ename, salary x 12 ANNUAL SALARY; FROM emp;

Here are the 4 errors I found:
1. We must use * instead of x for multiplication.
2. We need to write the word AS before renaming the column.
3. The name ANNUAL SALARY has a space in it, so we must put it inside double quotes like "ANNUAL SALARY".
4. There is a semicolon ; in the wrong place before FROM. The semicolon should be at the very end of the code.

The correct code is:
SELECT empno, ename, salary * 12 AS "ANNUAL SALARY" FROM emp;
