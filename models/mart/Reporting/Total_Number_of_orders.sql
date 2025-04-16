select count(*) as total_orders
from {{ ref('fact_orders') }}