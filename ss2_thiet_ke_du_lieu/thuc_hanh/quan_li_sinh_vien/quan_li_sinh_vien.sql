create database ss2_quan_li_sinh_vien;
use ss2_quan_li_sinh_vien;

create table class (
class_id int not null auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null,
status_class bit
);

create table student(
student_id int not null auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(10),
status_student bit,
class_id int not null,
foreign key(class_id) references class (class_id));

create table subjects (sub_id int not null auto_increment,
sub_name varchar(30) not null,
sub_credit tinyint not null default 1 check ( sub_credit >= 1),
status_sub bit default 1,
primary key (sub_id));

create table mark(
mark_id int not null auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 AND 10),
exam_times tinyint default 1,
unique (sub_id,student_id),
foreign key (sub_id) references subjects (sub_id),
foreign key (student_id) references student(student_id));