select orderId, sum(itemPrice)
from (select orderId, price * quantity as itemPrice
      from OrderItemdb
               join Itemdb on OrderItemdb.itemId = Itemdb.itemId) as S
group by orderId;

select customername, sumItems  from (select sumItems, customername from
    (select Orderdb.orderId, SumOrderingTable.sumItems, Orderdb.customerId from
        (select orderId, sum(itemPrice) as sumItems
         from (select orderId, price * quantity as itemPrice
               from OrderItemdb
                        join Itemdb on OrderItemdb.itemId = Itemdb.itemId) as S
         group by orderId) as SumOrderingTable
            join Orderdb on Orderdb.orderId = SumOrderingTable.orderId) as SumWithCustomer
        join Customerdb on Customerdb.customerId = SumWithCustomer.customerId) as Resut
order by sumItems desc
LIMIT 1