-- drop contents
-- foreign keys
ALTER TABLE comments
    DROP CONSTRAINT comments_posts;

ALTER TABLE friends
    DROP CONSTRAINT friends_users;

ALTER TABLE page_liked
    DROP CONSTRAINT page_liked_pages;

ALTER TABLE page_liked
    DROP CONSTRAINT page_liked_users;

ALTER TABLE photos
    DROP CONSTRAINT photos_posts;

ALTER TABLE posts_likes
    DROP CONSTRAINT posts_likes_posts;

ALTER TABLE posts
    DROP CONSTRAINT posts_users;

-- tables
DROP TABLE comments;

DROP TABLE friends;

DROP TABLE page_liked;

DROP TABLE pages;

DROP TABLE photos;

DROP TABLE posts;

DROP TABLE posts_likes;

DROP TABLE users;

-- sequences
DROP SEQUENCE comments_seq;

DROP SEQUENCE friends_seq;

DROP SEQUENCE pages_seq;

DROP SEQUENCE photos_seq;

DROP SEQUENCE posts_seq;

DROP SEQUENCE users_seq;

-- tables
-- Table: comments
CREATE TABLE comments (
    comment_date date  NOT NULL,
    comment_id integer  NOT NULL,
    user_id integer NOT NULL,
    comment_content varchar2(100)  NOT NULL,
    posts_post_id integer  NOT NULL,
    CONSTRAINT comments_pk PRIMARY KEY (comment_id)
) ;

-- Table: friends
CREATE TABLE friends (
    friend_id integer  NOT NULL,
    users_user_id integer  NOT NULL,
    CONSTRAINT friends_pk PRIMARY KEY (friend_id)
) ;

-- Table: page_liked
CREATE TABLE page_liked (
    users_user_id integer  NOT NULL,
    pages_page_id integer  NOT NULL,
    CONSTRAINT page_liked_pk PRIMARY KEY (pages_page_id,users_user_id)
) ;

-- Table: pages
CREATE TABLE pages (
    page_id integer  NOT NULL,
    page_name varchar2(10)  NOT NULL,
    page_content varchar2(100)  NOT NULL,
    CONSTRAINT pages_pk PRIMARY KEY (page_id)
) ;

-- Table: photos
CREATE TABLE photos (
    image_content varchar2(10)  NOT NULL,
    photo_id integer  NOT NULL,
    posts_post_id integer  NOT NULL,
    CONSTRAINT photos_pk PRIMARY KEY (photo_id)
) ;

-- Table: posts
CREATE TABLE posts (
    post_date date  NOT NULL,
    post_content varchar2(100)  NOT NULL,
    post_id integer  NOT NULL,
    post_like integer,
    users_user_id integer  NOT NULL,
    CONSTRAINT posts_pk PRIMARY KEY (post_id)
) ;

-- Table: posts_likes
CREATE TABLE posts_likes (
    user_id integer  NOT NULL,
    posts_post_id integer  NOT NULL,
    CONSTRAINT posts_likes_pk PRIMARY KEY (posts_post_id,user_id)
) ;

-- Table: users
CREATE TABLE users (
    first_name varchar2(10)  NOT NULL,
    last_name varchar2(10)  NOT NULL,
    user_id integer NOT NULL,
    address varchar2(20)  NOT NULL,
    email varchar2(20)  NOT NULL,
    date_of_birth date  NOT NULL,
    gender varchar2(10)  NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
) ;

-- foreign keys
-- Reference: comments_posts (table: comments)
ALTER TABLE comments ADD CONSTRAINT comments_posts
    FOREIGN KEY (posts_post_id)
    REFERENCES posts (post_id);

-- Reference: friends_users (table: friends)
ALTER TABLE friends ADD CONSTRAINT friends_users
    FOREIGN KEY (users_user_id)
    REFERENCES users (user_id);

-- Reference: page_liked_pages (table: page_liked)
ALTER TABLE page_liked ADD CONSTRAINT page_liked_pages
    FOREIGN KEY (pages_page_id)
    REFERENCES pages (page_id);

-- Reference: page_liked_users (table: page_liked)
ALTER TABLE page_liked ADD CONSTRAINT page_liked_users
    FOREIGN KEY (users_user_id)
    REFERENCES users (user_id);

-- Reference: photos_posts (table: photos)
ALTER TABLE photos ADD CONSTRAINT photos_posts
    FOREIGN KEY (posts_post_id)
    REFERENCES posts (post_id);

-- Reference: posts_likes_posts (table: posts_likes)
ALTER TABLE posts_likes ADD CONSTRAINT posts_likes_posts
    FOREIGN KEY (posts_post_id)
    REFERENCES posts (post_id);

-- Reference: posts_users (table: posts)
ALTER TABLE posts ADD CONSTRAINT posts_users
    FOREIGN KEY (users_user_id)
    REFERENCES users (user_id);

-- sequences
-- Sequence: comments_seq
CREATE SEQUENCE comments_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- Sequence: friends_seq
CREATE SEQUENCE friends_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- Sequence: pages_seq
CREATE SEQUENCE pages_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- Sequence: photos_seq
CREATE SEQUENCE photos_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- Sequence: posts_seq
CREATE SEQUENCE posts_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- Sequence: users_seq
CREATE SEQUENCE users_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

GRANT SELECT ON users_seq TO xarif;
GRANT SELECT ON posts_seq TO xarif;
GRANT SELECT ON photos_seq TO xarif;
GRANT SELECT ON pages_seq TO xarif;
GRANT SELECT ON friends_seq TO xarif;
GRANT SELECT ON comments_seq TO xarif;

INSERT INTO users VALUES('Ahmed', 'Zarif', users_seq.nextval, 'Uttara, Dhaka', 'abc@gmail.com', to_date('2000-08-06', 'yyyy-mm-dd'), 'male');
INSERT INTO users VALUES('Shamim', 'Ahmed', users_seq.nextval, 'Noakhali', 'bcd@gmail.com', to_date('2000-10-14', 'yyyy-mm-dd'), 'male');
INSERT INTO users VALUES('Ahmed', 'Loba', users_seq.nextval, 'Uttara, Dhaka', 'cde@gmail.com', to_date('2008-01-16', 'yyyy-mm-dd'), 'female');
INSERT INTO users VALUES('Umme', 'Habiba', users_seq.nextval, 'Uttara, Dhaka', 'efg@gmail.com', to_date('1977-12-31', 'yyyy-mm-dd'), 'female');
INSERT INTO users VALUES('Ahmed', 'Jamil', users_seq.nextval, 'Noakhali', 'hij@gmail.com', to_date('1968-08-08', 'yyyy-mm-dd'), 'male');

INSERT INTO posts VALUES(to_date('2021-04-06', 'yyyy-mm-dd'), 'A random post - one', posts_seq.nextval, 10, 1);
INSERT INTO posts VALUES(to_date('2020-10-21', 'yyyy-mm-dd'), 'A random post - two', posts_seq.nextval, 7, 2);
INSERT INTO posts VALUES(to_date('2022-08-06', 'yyyy-mm-dd'), 'A random post - three', posts_seq.nextval, 8, 3);
INSERT INTO posts VALUES(to_date('2021-06-10', 'yyyy-mm-dd'), 'A random post - four', posts_seq.nextval, 11, 4);
INSERT INTO posts VALUES(to_date('2021-04-06', 'yyyy-mm-dd'), 'A random post - five', posts_seq.nextval, 5, 5);
INSERT INTO posts VALUES(to_date('2021-04-06', 'yyyy-mm-dd'), 'A random post - six', posts_seq.nextval, 3, 1);

INSERT INTO posts_likes VALUES(1, 2);
INSERT INTO posts_likes VALUES(2, 1);
INSERT INTO posts_likes VALUES(4, 5);
INSERT INTO posts_likes VALUES(5, 1);
INSERT INTO posts_likes VALUES(3, 4);

INSERT INTO photos VALUES('blob_one', photos_seq.nextval, 1);
INSERT INTO photos VALUES('blob_two', photos_seq.nextval, 2);
INSERT INTO photos VALUES('blob_three', photos_seq.nextval, 3);
INSERT INTO photos VALUES('blob_four', photos_seq.nextval, 4);
INSERT INTO photos VALUES('blob_five', photos_seq.nextval, 5);

INSERT INTO friends VALUES(friends_seq.nextval, 1);
INSERT INTO friends VALUES(friends_seq.nextval, 2);
INSERT INTO friends VALUES(friends_seq.nextval, 1);
INSERT INTO friends VALUES(friends_seq.nextval, 1);
INSERT INTO friends VALUES(friends_seq.nextval, 2);
INSERT INTO friends VALUES(friends_seq.nextval, 3);
INSERT INTO friends VALUES(friends_seq.nextval, 4);
INSERT INTO friends VALUES(friends_seq.nextval, 3);
INSERT INTO friends VALUES(friends_seq.nextval, 5);

INSERT INTO comments VALUES(TO_DATE('2022-08-06', 'yyyy-mm-dd'), comments_seq.nextval, 1, 'random comment-one', 2);
INSERT INTO comments VALUES(TO_DATE('2022-10-04', 'yyyy-mm-dd'), comments_seq.nextval, 2, 'random comment-two', 1);
INSERT INTO comments VALUES(TO_DATE('2021-08-07', 'yyyy-mm-dd'), comments_seq.nextval, 3, 'random comment-three', 4);
INSERT INTO comments VALUES(TO_DATE('2022-08-06', 'yyyy-mm-dd'), comments_seq.nextval, 5, 'random comment-one', 2);

INSERT INTO pages VALUES(pages_seq.nextval, 'Cricket', 'Content about Cricket');
INSERT INTO pages VALUES(pages_seq.nextval, 'KUET', 'Content about KUET');
INSERT INTO pages VALUES(pages_seq.nextval, 'Noakhali', 'Content about Noakhali');
INSERT INTO pages VALUES(pages_seq.nextval, 'Radiohead', 'Content about Radiohead');
INSERT INTO pages VALUES(pages_seq.nextval, 'Football', 'Content about Football');

INSERT INTO page_liked VALUES(1, 4);
INSERT INTO page_liked VALUES(2, 1);
INSERT INTO page_liked VALUES(2, 2);
INSERT INTO page_liked VALUES(4, 5);
INSERT INTO page_liked VALUES(5, 3);

SELECT * FROM users;
SELECT * from posts;
SELECT * from posts_likes;
SELECT * from photos;
SELECT * from friends;
SELECT * from comments;
SELECT * from pages;
SELECT * from page_liked;






    