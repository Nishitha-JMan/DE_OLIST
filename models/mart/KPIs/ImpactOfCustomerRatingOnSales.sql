select 
    floor(r.review_score) as rating,
    count(o.order_id) as total_orders,
    sum(total_order_value) as total_revenue
from {{ ref('fact_reviews') }} as r
join {{ ref('fact_orders') }} as o
    on r.order_id = o.order_id
group by rating
order by rating desc