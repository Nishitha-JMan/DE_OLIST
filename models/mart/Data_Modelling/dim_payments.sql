with payments as (
    select * from {{ ref('trans_payments') }}
),
fact_payments as (
    select
        p.order_id,
        p.payment_type,
        sum(p.total_payment_value) as total_payment_value,
        p.installments
    from payments p
    group by p.order_id, p.payment_type,p.installments
)
select * from fact_payments