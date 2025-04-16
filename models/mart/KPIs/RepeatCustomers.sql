select 
    customer_id,
    count(order_id) as total_orders,
    case 
        when count(order_id) > 1 then 'Repeat Customer'
        else 'One-time Customer'
    end as customer_type
from {{ ref('fact_orders') }}
group by customer_id order by total_orders desc