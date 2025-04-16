select 
    p.product_category,
    count(oi.product_id) as total_sales_count
from {{ ref('dim_products') }} as p
join {{ ref('trans_order_items') }} as oi
    on p.product_id = oi.product_id
group by p.product_category
order by total_sales_count desc