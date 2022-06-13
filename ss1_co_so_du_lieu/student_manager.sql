create table `student-manager`.`Class`(
`id` int not null,
`name` varchar(50) null,
primary key(`id`)
);
create table `student-manager`.`teacher`(
`id` int not null,
`name` varchar(50) null,
`age` int null,
`country` varchar(50),
primary key (`id`));