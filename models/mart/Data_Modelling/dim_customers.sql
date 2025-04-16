with customers as (
    select * from {{ ref('trans_customers') }}
),

dim_customers as (
    select
        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city as customer_city,
        states as customer_state,
        latitude as customer_latitude,
        longitude as customer_longitude
    from customers
)

select * from dim_customers