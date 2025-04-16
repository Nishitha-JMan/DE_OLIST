select 
    s.seller_id,
    round(cast(sum(oi.total_order_item_value) as float),2) as total_sales
from {{ ref('dim_sellers') }} as s
join {{ ref('trans_order_items') }} as oi
    on s.seller_id = oi.seller_id
group by s.seller_id
order by total_sales desc