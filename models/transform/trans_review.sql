with reviews as (
    select * from {{ ref('stg_order_reviews') }}
),
transformed_reviews as (
    select
        order_id,
        review_id,
        review_score,
        review_created_date,
        max(review_answered_ts) as latest_review_answered_ts,
        avg(review_score) as avg_review_score,
    from reviews
    group by order_id, review_created_date,review_id,review_score
)
select * from transformed_reviews