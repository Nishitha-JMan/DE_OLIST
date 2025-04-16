select 
    count(order_id) as total_cancellations,
    sum(total_order_value) as revenue_loss
from {{ ref('fact_orders') }}
where order_status = 'canceled'