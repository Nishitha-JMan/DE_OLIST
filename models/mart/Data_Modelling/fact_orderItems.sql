with order_items as (
    select * from {{ ref('trans_order_items') }}
)

select
    order_id,
    order_item_number,
    product_id,
    seller_id,
    total_order_item_value,
    total_freight_value
from order_items 