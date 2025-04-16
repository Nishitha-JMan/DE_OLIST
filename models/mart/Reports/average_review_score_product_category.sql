with reviews as (
    select order_id, average_review_score from {{ ref('fact_reviews') }}
),
order_items as (
    select order_id, product_id from {{ ref('stg_order_items') }}
),
products as (
    select product_id, product_category from {{ ref('dim_products') }}
)
select
    p.product_category,
    avg(r.average_review_score) as avg_review_score
from reviews r
join order_items oi on r.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by p.product_category
order by avg_review_score desc