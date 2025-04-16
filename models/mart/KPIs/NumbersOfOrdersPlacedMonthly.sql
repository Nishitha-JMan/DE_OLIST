select 
    date_trunc('month', order_purchase_ts) as order_month,
    count(order_id) as total_orders
from {{ ref('fact_orders') }}
group by order_month
order by order_month