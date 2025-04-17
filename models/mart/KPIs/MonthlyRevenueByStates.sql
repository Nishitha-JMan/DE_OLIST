with order_items as (
    select order_id, seller_id from {{ ref('stg_order_items') }}
),
orders as (
    select order_id, order_purchase_ts, total_order_value, order_status
    from {{ ref('fact_orders') }}
    where order_status = 'delivered'
),
sellers as (
    select seller_id, city as seller_city from {{ ref('dim_sellers') }}
),
order_seller as (
    select
        o.order_id,
        o.order_purchase_ts,
        oi.seller_id,
        o.total_order_value
    from orders o
    join order_items oi on o.order_id = oi.order_id
),
monthly_revenue_by_city as (
    select
        to_char(order_purchase_ts, 'YYYY-MM') as month,
        s.seller_city,
        sum(coalesce(os.total_order_value, 0)) as total_revenue
    from order_seller os
    join sellers s on os.seller_id = s.seller_id
    group by to_char(order_purchase_ts, 'YYYY-MM'), s.seller_city
)
select
    month,
    seller_city,
    total_revenue
from monthly_revenue_by_city
order by month, total_revenue desc