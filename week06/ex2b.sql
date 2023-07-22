select orderId, sum(itemPrice)
from (select orderId, price * quantity as itemPrice
      from OrderItemdb
               join Itemdb on OrderItemdb.itemId = Itemdb.itemId) as S
group by orderId;

select customername, sumItems
from (select sumItems, customername
      from (select Orderdb.orderId, SumOrderingTable.sumItems, Orderdb.customerId
            from (select orderId, sum(itemPrice) as sumItems
                  from (select orderId, price * quantity as itemPrice
                        from OrderItemdb
                                 join Itemdb on OrderItemdb.itemId = Itemdb.itemId) as S
                  group by orderId) as SumOrderingTable
                     join Orderdb on Orderdb.orderId = SumOrderingTable.orderId) as SumWithCustomer
               join Customerdb on Customerdb.customerId = SumWithCustomer.customerId) as Resut
order by sumItems desc
LIMIT 1


select school, loandate, teacher
from (select school, loandate, teacher
      from (select BookTb_2.book, BookTb_2.publisher, BookTb_2.loandate, SchoolBook.school, SchoolBook.teacher
            from BookTb_2
                     join
                 (select TeacherTb.school, CourseTb.book, CourseTb.teacher
                  from TeacherTb
                           join CourseTb on TeacherTb.teacher = CourseTb.teacher) as SchoolBook
                 on BookTb_2.book = SchoolBook.book) as WorkModel
      where school = 'Horizon Education Institute'
      order by loandate
      LIMIt 1) AS WorkM

UNION

select school, loandate, teacher
from (select school, loandate, teacher
      from (select BookTb_2.book, BookTb_2.publisher, BookTb_2.loandate, SchoolBook.school, SchoolBook.teacher
            from BookTb_2
                     join
                 (select TeacherTb.school, CourseTb.book, CourseTb.teacher
                  from TeacherTb
                           join CourseTb on TeacherTb.teacher = CourseTb.teacher) as SchoolBook
                 on BookTb_2.book = SchoolBook.book) as WorkModel
      where school = 'Bright Institution'
      order by loandate
      LIMIt 1) AS WorkM



