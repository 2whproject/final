--
-- DROP table
--
--공통
--DROP TABLE tbl_user;

--성룡
--DROP TABLE tbl_attach;
--DROP TABLE tbl_board_torrent;
--DROP TABLE tbl_reply_torrent;

--상우
--DROP TABLE tbl_board_book;
--DROP TABLE tbl_reply_book;

--세빈
--DROP TABLE tbl_qnaboard;
--DROP TABLE tbl_qreply;
--drop table tbl_log;
--drop table tbl_leave;
--drop table tbl_note;

--교선
--DROP TABLE tbl_board_game;
--DROP TABLE tbl_reply_game;
--DROP TABLE tbl_gattach;
--DROP TABLE tbl_gboard;
--DROP TABLE tbl_gmessage;
--DROP TABLE tbl_greply;

--소정
--DROP table tbl_board_ani;
--DROP table tbl_reply_ani;

--윤정
--DROP table tbl_board_movie;
--DROP table tbl_movie_reply;




--
-- CREATE table
--

--공통

CREATE TABLE tbl_user
(
   uid            VARCHAR(50) NOT NULL,
   upw            VARCHAR(50) NOT NULL,
   uname          VARCHAR(100) NOT NULL,
   upoint         int NOT NULL DEFAULT 0,
   email		  varchar(50),
   regdate        TIMESTAMP DEFAULT now(),
   sessionkey     varchar(50) NOT NULL DEFAULT 'none',
   sessionlimit   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(uid)
);

--성룡

CREATE TABLE tbl_board_torrent

(
   BNO        int NOT NULL AUTO_INCREMENT,
   TITLE      varchar(200) NOT NULL,
   CONTENT    text NULL,
   WRITER     varchar(50) NOT NULL,
   REGDATE    timestamp NOT NULL DEFAULT now(),
   VIEWCNT    int DEFAULT 0,
   REPLYCNT   int DEFAULT 0,
   BOARD_ID	  varchar(100) NOT NULL,
   PRIMARY KEY(bno)
);

CREATE TABLE tbl_reply_torrent
(
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);
ALTER TABLE tbl_reply_torrent
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(bno) REFERENCES tbl_board_torrent(bno);
  

CREATE TABLE tbl_attach
(
   fullName   VARCHAR(150) NOT NULL,
   bno        INT NOT NULL,
   regdate    TIMESTAMP DEFAULT now(),
   PRIMARY KEY(fullName)
);
ALTER TABLE tbl_attach
  ADD CONSTRAINT fk_borad_attach FOREIGN KEY(bno) REFERENCES tbl_board_torrent(bno);

--상우
CREATE TABLE tbl_board_book
(
   BNO        	int NOT NULL AUTO_INCREMENT,
   OVERVIEW		text NOT NULL,
   TITLE      	varchar(200) NOT NULL,
   LINK      	varchar(200) NOT NULL,
   CONTENT    	text NULL,
   AUTHOR		varchar(200) NOT NULL,
   WRITER     	varchar(50) NOT NULL,
   PRICE		int NOT NULL,
   PUBLISHER	varchar(100) null,
   REGDATE    	timestamp NOT NULL DEFAULT now(),
   VIEWCNT    	int DEFAULT 0,
   REPLYCNT   	int DEFAULT 0,
   STAR			int DEFAULT 0,
   PRIMARY KEY(bno)
);

CREATE TABLE tbl_reply_book
(
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);
ALTER TABLE tbl_reply_book
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(bno) REFERENCES tbl_board_book(bno);
  
--세빈
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

insert into tbl_user(UID, upw, uname, email)
	 values ('zerock', '1234', 'ADMINISTRATOR','zerock@project.com');
	 
create table tbl_leave
(	uid 	varchar(50),
	uname	varchar(50),
	primary key(uid)
);
insert into tbl_leave(uid, uname)
	 values ('zerock', 'ADMINISTRATOR');

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
   notice	  boolean,
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
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(bno) REFERENCES tbl_qnaboard(bno);

--교선
CREATE TABLE tbl_board_game (
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NOT NULL,
   regdate    timestamp NOT NULL DEFAULT now(),
   viewcnt    int DEFAULT 0,
   replycnt   int DEFAULT 0,
   PRIMARY KEY(bno)
);

CREATE TABLE tbl_reply_game (
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);
ALTER TABLE tbl_reply_game
ADD CONSTRAINT frk_board_reply FOREIGN KEY(bno) REFERENCES tbl_board_game(bno);

CREATE TABLE tbl_attach_game
(
   fullName   VARCHAR(150) NOT NULL,
   bno        INT NOT NULL,
   regdate    TIMESTAMP DEFAULT now(),
   PRIMARY KEY(fullName)
);
ALTER TABLE tbl_attach_game
ADD CONSTRAINT fk_borad_attach_game FOREIGN KEY(bno) REFERENCES tbl_board_game(bno);

--소정

CREATE TABLE tbl_board_ani
(
   BNO        int NOT NULL AUTO_INCREMENT,
   TITLE  	  varchar(200) NOT NULL,
   AUTHOR     varchar(200) NOT NULL,
   ISBN       varchar(100) NOT NULL,
   TITLE2     varchar(200) NOT NULL,
   CONTENT    text NULL,
   WRITER     varchar(50) NOT NULL,
   REGDATE    timestamp NOT NULL DEFAULT now(),
   VIEWCNT    int DEFAULT 0,
   REPLYCNT   int DEFAULT 0,
   PRIMARY KEY(bno)
);

CREATE TABLE tbl_reply_ani
(
   rno          int NOT NULL AUTO_INCREMENT,
   bno          int NOT NULL DEFAULT 0,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(rno)
);

ALTER TABLE tbl_reply_ani
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(movieId) REFERENCES tbl_reply_ani(bno);

--윤정

--
-- tbl_board_movie
--
CREATE TABLE tbl_board_movie
(
   bno        int NOT NULL AUTO_INCREMENT,
   title      varchar(200) NOT NULL,
   content    text NULL,
   writer     varchar(50) NULL,
   regdate    timestamp NOT NULL DEFAULT now(),
   viewcnt    int DEFAULT 0,
   replycnt   int DEFAULT 0,
   title_link varchar(500) NOT NULL,
   
   PRIMARY KEY(bno)
);

--
-- tbl_movie_reply
--
CREATE TABLE tbl_movie_reply
(
   rno          int NOT NULL AUTO_INCREMENT,
   replytext    varchar(1000) NOT NULL,
   replyer      varchar(50) NOT NULL,
   regdate      timestamp NOT NULL DEFAULT now(),
   updatedate   timestamp NOT NULL DEFAULT now(),
   title_link   varchar(500) NULL,
   movieId      varchar(500) NULL,
   PRIMARY KEY(rno)
);
ALTER TABLE tbl_movie_reply
  ADD CONSTRAINT fk_board_reply FOREIGN KEY(movieId) REFERENCES tbl_board_movie(movieId);
