with sellers as (
    select * from {{ ref('trans_sellers') }}
),
dim_sellers as (
    select
        seller_id,
        zip_code_prefix,
        city,
        state,
        latitude as seller_lattitude,
        longitude as seller_longitude
    from sellers
)
select * from dim_sellers