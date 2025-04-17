with orders as (
    select * from {{ ref('fact_orders') }}
),
customers as (
    select * from {{ ref('dim_customers') }}
)
select
    c.customer_state,
    sum(o.total_order_value) as total_revenue
from orders o
join customers c on o.customer_id = c.customer_id
group by c.customer_state
order by total_revenue desc