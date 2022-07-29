**********DB
create user trip identified by 1234;
grant connect, resource, dba to trip;
commit;

CREATE TABLE users (
   usernum number NOT NULL primary key,
   userid varchar2(20) NOT NULL UNIQUE,
   username varchar2(20) NOT NULL,
   nickname varchar2(20) NOT NULL UNIQUE,
   userpass varchar2(16) NOT NULL,
   phone char(13) NOT NULL,  / 010-1234-5678 ����
   birth char(8) NOT NULL,
   gender varchar2(8) NOT NULL, / male - ����, female - ����
   joindate date default sysdate,
   email varchar2(50) NOT NULL,
   admin number(1) NOT NULL, / 0 - ������, 1 - �Ϲ�ȸ��
   question varchar2(50) NULL,
   answer varchar2(30) NULL
);

CREATE TABLE festival (
   festival_num number NOT NULL primary key,
   festival_title varchar2(50) NOT NULL,
   festival_content varchar2(4000) NOT NULL,
   festival_image varchar2(4000) NULL,
   festival_schedule varchar2(30) NULL,
   festival_city varchar2(10) not null,
   --fk �߰�
   usernum number not null,
   CONSTRAINT fk_user_to_festival foreign key(usernum) references users(usernum)
);

-- �佺Ƽ�� ������(api)
create table festivaldata (
    num number(5) not null primary key,
    title varchar2(100),
    address varchar2(200),
    firstimg varchar2(2000),
    startdate varchar2(8),
    enddate varchar2(8),
    mapx varchar2(100),
    mapy varchar2(100),
    mlevel number(5)
);

CREATE TABLE board (
   board_num number NOT NULL primary key,
   board_title varchar2(50) NOT NULL,
   board_content varchar2(4000) not null,
   board_date date default sysdate,
   hits number NOT NULL,
   board_image varchar2(4000) NULL,
   board_like number not null,
   --fk �߰�
   usernum number not null,
   CONSTRAINT fk_user_to_board foreign key(usernum) references users(usernum)
);

CREATE TABLE board_comment (
   board_comm_num number NOT NULL primary key,
   board_comm_date date default sysdate,
   board_comm_reply varchar2(1000) NOT NULL,
   --fk �߰�
   board_num number not null,
   CONSTRAINT fk_board_to_comment foreign key(board_num) references board(board_num)
);

create table destination (
    destination_num number not null primary key,
    destination_title varchar2(50) not null,
    destination_date date default sysdate,
    destination_image varchar2(4000),
    destination_content varchar2(4000) not null,
    --fk �߰�
    usernum number not null,
    CONSTRAINT fk_user_to_destination foreign key(usernum) references users(usernum)
);

-- ������ ������ (api)
create table destinatinodata (
    num number(10) not null primary key,
    title varchar2(150),
    address varchar2(200),
    firstimg varchar2(500),
    secondimg varchar2(500),
    mapx varchar2(50),
    mapy varchar2(50)
);

create table des_comment (
    des_comm_num number not null,
    des_comm_date date default sysdate,
    des_comm_reply varchar2(1000),
    --fk �߰�
    destination_num number not null,
    CONSTRAINT fk_destination_to_des_comment foreign key(destination_num) references destination(destination_num)
);
    

CREATE TABLE course (
   course_num number NOT NULL primary key,
   course_title varchar2(50) NOT NULL,
   course_content varchar2(4000) NOT NULL,
   course_image varchar2(4000) NULL,
   course_like number NOT NULL,
   course_city varchar2(10) not null,
   --fk �߰�
   destination_num number not null,
    CONSTRAINT fk_destination_to_course foreign key(destination_num) references destination(destination_num)
);

-- ȸ����� ������
create sequence users_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- ���� ������
create sequence festival_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- ���� ������ ������
create sequence fesdata_num
START with 1 INCREMENT by 1 MINVALUE 1;
-- ���� ������
create sequence board_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- ���� ��� ������
create sequence board_comment_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- ������ ������
create sequence destination_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- ������ ������ ������
create SEQUENCE desdata_seq 
START with 1 INCREMENT by 1 MINVALUE 1;
-- ������ ��� ������
create sequence des_comment_seq
START with 1 INCREMENT by 1 MINVALUE 1;
-- �ڽ� ������
create sequence course_seq
START with 1 INCREMENT by 1 MINVALUE 1;

commit;