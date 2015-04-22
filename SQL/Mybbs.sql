create database mybbs;
use mybbs;

create table article
(
id int primary key auto_increment,
pid int,
rootid int,
title varchar(255),
cont text,
pdate datetime,
isleaf int # 1 not leaf 0 leaf
);

insert into article values(null,0,1,'a good story','Once upon a time, there is a boy whoes name is Jack.',now(),1);
insert into article values(null,1,1,'boy like you','Jack is a bad boy.',now(),1);
insert into article values(null,2,1,'cat Kitty','Mom likes cat Kitty',now(),0);
insert into article values(null,2,1,'do something good in a day','First you need sleep well in the night, then you can have enough energy',now(),1);
insert into article values(null,4,1,'elf','legendary!',now(),0);
insert into article values(null,1,1,'facebook is big company','facebook, google, microsoft and apple are big IT company',now(),1);
insert into article values(null,6,1,'good test','Try more then do it.',now(),0);
insert into article values(null,6,1,'home is everyone\'s the best place','I wanna be back!',now(),0);
insert into article values(null,2,1,'ideal job','software developer.',now(),1);
insert into article values(null,9,1,'just kidding','why you laugh?',now(),0);

