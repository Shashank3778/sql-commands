
CREATE TABLE student (
    sid INT PRIMARY KEY,
    sname VARCHAR(255),
    sex CHAR(1),
    age INT,
    year INT,
    gpa FLOAT
);


CREATE TABLE dept (
    dname VARCHAR(255) PRIMARY KEY,
    numphds INT
);


CREATE TABLE prof (
    pname VARCHAR(255),
    dname VARCHAR(255),
    PRIMARY KEY (pname, dname),
    FOREIGN KEY (dname) REFERENCES dept(dname)
);


CREATE TABLE course (
    cno INT,
    dname VARCHAR(255),
    cname VARCHAR(255),
    PRIMARY KEY (cno, dname),
    FOREIGN KEY (dname) REFERENCES dept(dname)
);


CREATE TABLE major (
    dname VARCHAR(255),
    sid INT,
    PRIMARY KEY (dname, sid),
    FOREIGN KEY (dname) REFERENCES dept(dname),
    FOREIGN KEY (sid) REFERENCES student(sid)
);


CREATE TABLE section (
    dname VARCHAR(200),
    cno INT,
    sectno INT,
    pname VARCHAR(255),
    PRIMARY KEY (dname, cno, sectno),
    FOREIGN KEY (dname, cno) REFERENCES course(dname, cno),
    FOREIGN KEY (pname, dname) REFERENCES prof(pname, dname)
);


CREATE TABLE enroll (
    sid INT,
    dname VARCHAR(255),
    cno INT,
    sectno INT,
    grade CHAR(1),
    PRIMARY KEY (sid, dname, cno, sectno),
    FOREIGN KEY (sid) REFERENCES student(sid),
    FOREIGN KEY (dname, cno, sectno) REFERENCES section(dname, cno, sectno)
);
