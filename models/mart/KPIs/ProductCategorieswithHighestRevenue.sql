select 
    p.product_category,
    sum(oi.total_order_item_value) as total_revenue
from {{ ref('dim_products') }} as p
join {{ ref('trans_order_items') }} as oi
    on p.product_id = oi.product_id
group by p.product_category
order by total_revenue desc