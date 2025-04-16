select 
    payment_type,
    count(order_id) as total_orders
from {{ ref('dim_payments') }}
group by payment_type
order by total_orders desc