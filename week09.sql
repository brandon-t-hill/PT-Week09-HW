CREATE DATABASE IF NOT EXISTS media;
use media;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users(
  id int not null auto_increment,
  username varchar(32) not null,
  email varchar(128) not null,
  pass varchar(64) not null,
  primary key(id)
);

create table posts(
  id int not null auto_increment,
  userID int not null,
  content varchar(1024),
  date datetime not null,
  primary key(id),
  foreign key(
    userID
  ) references users(id)
);

create table comments(
  id int not null auto_increment,
  postID int not null,
  userID int not null,
  content varchar(1024),
  date datetime not null,
  primary key(id),
  foreign key(
    postID
  ) references posts(id),
  foreign key(
    userID
  ) references users(id)
);