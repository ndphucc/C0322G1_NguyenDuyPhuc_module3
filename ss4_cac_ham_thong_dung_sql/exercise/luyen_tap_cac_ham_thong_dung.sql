use quan_li_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject` 
where credit = (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select `subject`.*, ifnull(max(mark.mark),0) as max_mark from  `subject`
left join mark on `subject`.sub_id = mark.sub_id
group by mark.sub_id;
 
 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
 select student.*, ifnull(avg(mark),0) as `avg`  from student
 left join mark on student.student_id = mark.student_id
 group by student.student_id
 order by `avg` desc;