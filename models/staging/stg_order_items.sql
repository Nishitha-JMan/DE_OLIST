with source as (
    select * from {{ source('raw', 'olist_order_items') }}
),

renamed as (
    select
        cast(order_id as string) as order_id,
        cast(order_item_id as int) as order_item_number,
        cast(product_id as string) as product_id,
        cast(seller_id as string) as seller_id,
        cast(shipping_limit_date as date) as shipping_limit_ts,
        round(cast(price as float), 2) as item_price, 
        round(cast(freight_value as float), 2) as freight_value
    from source
)

select * from renamed