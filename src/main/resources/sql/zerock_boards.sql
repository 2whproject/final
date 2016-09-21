--
-- DROP table
--
drop table emp;
drop table tbl_message;
DROP TABLE tbl_member;
DROP TABLE tbl_user;
DROP TABLE tbl_qreply;
DROP TABLE tbl_qnaboard;
drop table tbl_log;
drop table tbl_leave;
drop table tbl_note;



create table tbl_note (
	no			int not null auto_increment,
	title		varchar(24) not null,
	content		varchar(255) not null,
	sender		varchar(30) not null,
	uname		varchar(30) not null,
	date		TIMESTAMP DEFAULT now(),
	viewing		boolean,
	primary key(no)
);

create table tbl_message
(
	no int not null auto_increment,
	sender varchar(50) not null,
	title varchar(50) not null,
	content	varchar(255) not null,
	receiver varchar(50) not null,
	sendtime timestamp default now(),
	reading boolean not null,
	primary key(no)
);

select * from tbl_message where receiver = 'ADMINISTRATOR';

create table emp
(
	bno int not null auto_increment,
	empno int not null,
	ename	varchar(20) not null,
	job	varchar(20) not null,
	mgr	int(10),
	hiredate date not null,
	sal	double not null,
	comm double ,
	deptno int(10) not null,
	primary key(bno)
);

--
-- tbl_member
--
CREATE TABLE tbl_member
(
   userid       VARCHAR(50) NOT NULL,
   userpw       VARCHAR(50) NOT NULL,
   username     VARCHAR(100) NOT NULL,
   email        VARCHAR(100),
   regdate      TIMESTAMP DEFAULT now(),
   updatedate   TIMESTAMP DEFAULT now(),
   PRIMARY KEY(userid)
);

--
-- tbl_user
--
CREATE TABLE tbl_user
(
   uid            VARCHAR(50) NOT NULL,
   upw            VARCHAR(50) NOT NULL,
   uname          VARCHAR(100) NOT NULL,
   upoint         int NOT NULL DEFAULT 0,
   email		  varchar(50),
   regdate      TIMESTAMP DEFAULT now(),
   sessionkey     varchar(50) NOT NULL DEFAULT 'none',
   sessionlimit   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(uid)
);


INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user00', 'user00', 'IRON MAN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user01', 'user01', 'CAPTAIN');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user02', 'user02', 'HULK');

INSERT INTO tbl_user(UID, upw, uname)
     VALUES ('user03', 'user03', 'THOR');
insert into tbl_user(UID, upw, uname, email)
	 values ('zerock', '1234', 'ADMINISTRATOR','zerock@project.com');
	 
create table tbl_leave
(	uid 	varchar(50),
	uname	varchar(50),
	primary key(uid)
);

insert into tbl_leave(uid, uname)
	 values ('user00', 'IRON MAN');
insert into tbl_leave(uid, uname)
	 values ('user01','CAPTAIN');
insert into tbl_leave(uid, uname)
	 values ('user02', 'HULK');
insert into tbl_leave(uid, uname)
	 values ('user03', 'THOR');
insert into tbl_leave(uid, uname)
	 values ('zerock', 'ADMINISTRATOR');


--
-- tbl_board
--
CREATE TABLE tbl_qnaboard
(
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NOT NULL,
   regdate    timestamp NOT NULL DEFAULT now(),
   viewcnt    int DEFAULT 0,
   replycnt   int DEFAULT 0,
   secret	  varchar(50) NOT NULL,
   pass		  varchar(50),
   PRIMARY KEY(bno)
);

create table tbl_log
(
	no		int not null auto_increment,
	time	datetime default now(),
	uid		varchar(50),
	result	boolean,
	locale	varchar(16),
	primary key(no)
);




--
-- tbl_reply
--
CREATE TABLE tbl_qreply
(
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);

ALTER TABLE tbl_qreply
  ADD CONSTRAINT fk_qnaboard_reply FOREIGN KEY(bno) REFERENCES tbl_qnaboard(bno);
--
-- tbl_attach
--
