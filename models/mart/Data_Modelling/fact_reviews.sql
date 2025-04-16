{{ config(
    materialized='table',
    post_hook="
        update {{ this }}
        set average_review_score = (
            select avg(r.avg_review_score)
            from {{ ref('trans_review') }} r
            where {{ this }}.order_id = r.order_id
        )
        where exists (
            select 1
            from {{ ref('trans_review') }} r
            where {{ this }}.order_id = r.order_id
            and {{ this }}.latest_review_answered_ts <> r.latest_review_answered_ts
        )
    "
) }}

with reviews as (
    select * from {{ ref('trans_review') }}
),
fact_reviews as (
    select
        r.order_id,
        r.review_id,
        r.review_score,
        r.review_created_date, 
        max(r.latest_review_answered_ts) as latest_review_answered_ts, 
        avg(r.avg_review_score) as average_review_score
    from reviews r
    group by r.order_id, r.review_created_date,r.review_id,review_score
)
select * from fact_reviews