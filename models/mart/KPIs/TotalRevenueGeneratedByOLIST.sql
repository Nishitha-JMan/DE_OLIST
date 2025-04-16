select 
    sum(total_order_value) as total_revenue
from {{ ref('fact_orders') }}