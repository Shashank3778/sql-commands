SELECT DISTINCT prof.pname
FROM prof
JOIN dept ON prof.dname = dept.dname
WHERE dept.numphds < 50;

SELECT sid, sname
FROM student
WHERE gpa = (SELECT MIN(gpa) FROM student);


SELECT cno, sectno, AVG(gpa) AS average_gpa
FROM enroll
JOIN section ON enroll.dname = section.dname AND enroll.cno = section.cno AND enroll.sectno = section.sectno
WHERE section.dname = 'Computer Sciences'
GROUP BY cno, sectno;


SELECT section.pname, section.dname, section.cno, section.sectno
FROM section
JOIN enroll ON section.dname = enroll.dname AND section.cno = enroll.cno AND section.sectno = enroll.sectno
GROUP BY section.pname, section.dname, section.cno, section.sectno
HAVING COUNT(enroll.sid) > 6;

SELECT sid, COUNT(DISTINCT sectno) AS num_sections
FROM enroll
GROUP BY sid
ORDER BY num_sections DESC
LIMIT 1;

SELECT DISTINCT dept.dname
FROM dept
JOIN major ON dept.dname = major.dname
JOIN student ON major.sid = student.sid
WHERE student.age < 18;

SELECT student.sname, major.dname
FROM major
JOIN student ON major.sid = student.sid
JOIN enroll ON major.sid = enroll.sid
JOIN course ON enroll.dname = course.dname AND enroll.cno = course.cno
WHERE course.cname LIKE 'College Geometry%';
