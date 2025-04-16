-- Test for invalid order statuses
select distinct order_status
from {{ ref('fact_orders') }}
where order_status not in ('delivered', 'shipped', 'canceled', 'processing', 'created')