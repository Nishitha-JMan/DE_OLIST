with order_items as (
    select product_id from {{ ref('stg_order_items') }}
),
products as (
    select * from {{ ref('dim_products') }}
)
select
    p.product_category,
    oi.product_id,
    count(*) as total_sold
from order_items oi
join products p on oi.product_id = p.product_id
group by p.product_category, oi.product_id
order by total_sold desc