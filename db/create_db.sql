------------------------------------------------------------
--        Script SQLite  
------------------------------------------------------------


------------------------------------------------------------
-- Table: User
------------------------------------------------------------
CREATE TABLE User(
	IdUser          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	LastnameUser    TEXT NOT NULL ,
	PrenomUser      TEXT NOT NULL ,
	EmailUser       TEXT NOT NULL ,
	LoginUser       TEXT NOT NULL ,
	PasswordUser    TEXT NOT NULL
);


------------------------------------------------------------
-- Table: Teacher
------------------------------------------------------------
CREATE TABLE Teacher(
	IdUser          INTEGER NOT NULL ,
	LastnameUser    TEXT NOT NULL ,
	PrenomUser      TEXT NOT NULL ,
	EmailUser       TEXT NOT NULL ,
	LoginUser       TEXT NOT NULL ,
	PasswordUser    TEXT NOT NULL,
	CONSTRAINT Teacher_PK PRIMARY KEY (IdUser)

	,CONSTRAINT Teacher_User_FK FOREIGN KEY (IdUser) REFERENCES User(IdUser)
);


------------------------------------------------------------
-- Table: Division
------------------------------------------------------------
CREATE TABLE Division(
	IdDivision      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	NameDivision    TEXT NOT NULL
);


------------------------------------------------------------
-- Table: Student
------------------------------------------------------------
CREATE TABLE Student(
	IdUser          INTEGER NOT NULL ,
	LastnameUser    TEXT NOT NULL ,
	PrenomUser      TEXT NOT NULL ,
	EmailUser       TEXT NOT NULL ,
	LoginUser       TEXT NOT NULL ,
	PasswordUser    TEXT NOT NULL ,
	IdDivision      INTEGER NOT NULL,
	CONSTRAINT Student_PK PRIMARY KEY (IdUser)

	,CONSTRAINT Student_User_FK FOREIGN KEY (IdUser) REFERENCES User(IdUser)
	,CONSTRAINT Student_Division0_FK FOREIGN KEY (IdDivision) REFERENCES Division(IdDivision)
);


------------------------------------------------------------
-- Table: Subject
------------------------------------------------------------
CREATE TABLE Subject(
	IdSubject      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	NameSubject    TEXT NOT NULL ,
	IdUser         INTEGER NOT NULL

	,CONSTRAINT Subject_Teacher_FK FOREIGN KEY (IdUser) REFERENCES Teacher(IdUser)
);


------------------------------------------------------------
-- Table: Grade
------------------------------------------------------------
CREATE TABLE Grade(
	IdGrade         INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
	CommentGrade    TEXT ,
	Grade           REAL NOT NULL ,
	CoeffGrade      REAL NOT NULL ,
	IdSubject       INTEGER NOT NULL ,
	IdUser          INTEGER NOT NULL

	,CONSTRAINT Grade_Subject_FK FOREIGN KEY (IdSubject) REFERENCES Subject(IdSubject)
	,CONSTRAINT Grade_Student0_FK FOREIGN KEY (IdUser) REFERENCES Student(IdUser)
);


------------------------------------------------------------
-- Table: Administrator
------------------------------------------------------------
CREATE TABLE Administrator(
	IdUser          INTEGER NOT NULL ,
	LastnameUser    TEXT NOT NULL ,
	PrenomUser      TEXT NOT NULL ,
	EmailUser       TEXT NOT NULL ,
	LoginUser       TEXT NOT NULL ,
	PasswordUser    TEXT NOT NULL,
	CONSTRAINT Administrator_PK PRIMARY KEY (IdUser)

	,CONSTRAINT Administrator_User_FK FOREIGN KEY (IdUser) REFERENCES User(IdUser)
);


------------------------------------------------------------
-- Table: ETUDIER
------------------------------------------------------------
CREATE TABLE ETUDIER(
	IdSubject     INTEGER NOT NULL ,
	IdDivision    INTEGER NOT NULL,
	CONSTRAINT ETUDIER_PK PRIMARY KEY (IdSubject,IdDivision)

	,CONSTRAINT ETUDIER_Subject_FK FOREIGN KEY (IdSubject) REFERENCES Subject(IdSubject)
	,CONSTRAINT ETUDIER_Division0_FK FOREIGN KEY (IdDivision) REFERENCES Division(IdDivision)
);


