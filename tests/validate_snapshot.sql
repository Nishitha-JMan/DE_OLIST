-- Test for consistency in customer_snapshot
select *
from {{ ref('customer_snapshot') }} snap
left join {{ ref('dim_customers') }} src
on snap.customer_unique_id = src.customer_unique_id
where snap.customer_city != src.customer_city
   or snap.customer_state != src.customer_state