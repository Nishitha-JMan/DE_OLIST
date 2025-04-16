select avg(delivery_time_days) as average_delivery_days
from {{ ref('fact_orders') }}
where delivery_time_days is not null