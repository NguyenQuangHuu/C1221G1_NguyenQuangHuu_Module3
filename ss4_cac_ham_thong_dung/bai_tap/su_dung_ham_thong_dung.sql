use ss3_thao_tac_csdl;

select *,max(credit) from `subject`;

select sub.SubName,max(m.mark) from `subject` sub inner join mark m on sub.SubId = m.SubId;

select stu.StudentId,stu.StudentName,avg(m.Mark) as avg_mark from student stu inner join mark m on stu.StudentId = m.StudentId group by stu.StudentName order by avg_mark desc;

