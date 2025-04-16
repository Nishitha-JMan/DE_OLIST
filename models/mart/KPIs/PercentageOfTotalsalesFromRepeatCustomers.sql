select 
    customer_type,
    sum(total_order_value) as total_revenue,
    (sum(total_order_value) * 100.0 / (select sum(total_order_value) from {{ ref('fact_orders') }})) as percentage_of_revenue
from (
    select 
        customer_id,
        count(order_id) as total_orders,
        sum(total_order_value) as total_order_value,
        case 
            when count(order_id) > 1 then 'Repeat Customer'
            else 'One-time Customer'
        end as customer_type
    from {{ ref('fact_orders') }}
    group by customer_id
) as customer_data
group by customer_type