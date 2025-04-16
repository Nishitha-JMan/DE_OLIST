with payments as (
    select
        p.payment_type,
        date_trunc('month', o.order_purchase_ts) as month,
        p.total_payment_value
    from {{ ref('dim_payments') }} p
    join {{ ref('fact_orders') }} o on p.order_id = o.order_id
)
select
    month,
    payment_type,
    count(*) as payment_count,
    sum(total_payment_value) as total_revenue,
    100.0 * count(*) / sum(count(*)) over (partition by month) as percent_of_total
from payments
group by month, payment_type
order by month, total_revenue desc