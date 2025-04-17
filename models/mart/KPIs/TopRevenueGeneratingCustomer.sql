with customer_revenue as (
    select
        c.customer_unique_id,
        sum(coalesce(o.total_order_value, 0)) as total_revenue
    from {{ ref('fact_orders') }} o
    join {{ ref('dim_customers') }} c on o.customer_id = c.customer_id
    group by c.customer_unique_id
)
select
    customer_unique_id,
    total_revenue
from customer_revenue
order by total_revenue desc