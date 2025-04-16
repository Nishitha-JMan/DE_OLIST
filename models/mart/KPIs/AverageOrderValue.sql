select 
    round(cast(avg(total_order_value) as float),2) as average_order_value
from {{ ref('fact_orders') }}