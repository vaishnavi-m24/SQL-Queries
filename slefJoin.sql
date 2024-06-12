select p1.product_name, p2.product_name
from products as p1
join products as p2
on p1.product_id = p2.category_id

