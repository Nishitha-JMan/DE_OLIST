with orders as (
    select * from {{ ref('trans_orders') }}
),

order_items as (
    select * from {{ ref('trans_order_items') }}
),

distances as (
    select * from {{ ref('trans_distance') }}
),


fact_orders as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_ts,
        o.order_approved_ts,
        o.delivered_to_carrier_ts,
        o.delivered_to_customer_ts,
        o.estimated_delivery_ts,
        oi.total_items,
        oi.total_order_value,
        d.distance_km,
        datediff(day, o.order_purchase_ts, o.delivered_to_customer_ts) as delivery_time_days,
        case
            when o.delivered_to_customer_ts > o.estimated_delivery_ts then 1
            else 0
        end as is_delayed
    from orders as o
    left join order_items as oi on o.order_id = oi.order_id
    left join distances as d on o.order_id = d.order_id
)

select * from fact_orders