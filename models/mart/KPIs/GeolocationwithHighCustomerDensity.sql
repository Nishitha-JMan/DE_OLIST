select 
    g.city,
    g.state,
    count(c.customer_id) as customer_count
from {{ ref('dim_geolocation') }} as g
join {{ ref('dim_customers') }} as c
    on g.zip_code_prefix = c.zip_code_prefix
group by g.city, g.state
order by customer_count desc