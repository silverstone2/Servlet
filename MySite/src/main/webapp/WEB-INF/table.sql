-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE buser(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
	regdate DATE
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_upload(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL, -- 파일의 크기 
	regdate DATE
);

CREATE SEQUENCE board_upload_seq; 


-- 게시글을 저장할 테이블 
CREATE TABLE board_write(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE --글 작성일
);
-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_write_seq; 

CREATE TABLE photogal ( 
    num NUMBER PRIMARY KEY, --사진번호,
	name VARCHAR2(100)  NOT NULL 
    subject	VARCHAR2(250)	NOT NULL 
    regdate   DATE 
    passwd    VARCHAR2(15)   NOT NULL 
    readcnt    NUMBER          DEFAULT 0 
   	filename   VARCHAR2(250) NOT NULL     --리네임된 파일명 
    filesize     NUMBER          DEFAULT 0   --파일크기 
 );


CREATE SEQUENCE photogal_seq;







