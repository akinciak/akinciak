select 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
o.ordercostprice,
o.ordersellingprice,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customer = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid