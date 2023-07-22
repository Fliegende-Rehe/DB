create table Students (
  studentID integer,
  name varchar(30),
  nativeLanguage varchar(30),
  primary key (studentID)
);

create table Courses (
  courseName varchar(30),
  credits integer,
  primary key (credits),
  foreign key (courseName) references Students (studentID)
);

create table Specializations (
  specializationName varchar(30),
  primary key (specializationName),
  foreign key (specializationName) references Students (studentID)
);