insert into class (class_name,start_day,`status`)
values ('A1','2008-12-20',1),
('A2','2008-12-22',1),
('B3',current_date(),0);
 
 insert into student
 values (1,'Hùng','Hà nội','0912113113',1,1),
 (2,'Hoa','Hai Phòng',null,1,1),
 (3,'Manh','HCM','0123123123',0,2);
 
 insert into `subject` 
 values (1,'CF',5,1),
 (2,'C',6,1),
 (3,'HDJ',5,1),
 (4,'RDBMS',10,1);
 
 insert into mark 
 values (1,1,1,8,1),
 (2,1,2,10,2),
 (3,2,1,12,1);