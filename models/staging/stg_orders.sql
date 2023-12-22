

select o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice-o.ordercostprice as orderprofit,
--customer data
cus.customername,
cus.segment,
cus.country,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as cus on o.customerid=cus.CUSTOMERID
Left join {{ ref('raw_product') }} as p on o.productid = p.productid
