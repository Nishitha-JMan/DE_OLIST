with orders as (
    select
        date_trunc('month', order_purchase_ts) as order_month,
        total_order_value
    from {{ ref('fact_orders') }}
)
select
    order_month,
    count(*) as total_orders,
    sum(total_order_value) as total_revenue
from orders
group by order_month
order by order_month