select count(*), school, publisher
from (select BookTb_2.book, BookTb_2.publisher, BookTb_2.loandate, SchoolBook.school, SchoolBook.teacher
      from BookTb_2
               join
           (select TeacherTb.school, CourseTb.book, CourseTb.teacher
            from TeacherTb
                     join CourseTb on TeacherTb.teacher = CourseTb.teacher) as SchoolBook
           on BookTb_2.book = SchoolBook.book) as WorkModel
group by (school, publisher);