with products as (
    select * from {{ ref('trans_products') }}
),

dim_products as (
    select
        p.product_id,
        p.product_category,
        p.weight_g as weight,
        p.length_cm as length,
        p.height_cm as height,
        p.width_cm as width,
        p.product_volume_cm3 as volume
    from products as p
)

select * from dim_products