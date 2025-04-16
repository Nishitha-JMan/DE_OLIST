{% snapshot product_snapshot %}
{{ config(
    target_schema='snapshots',
    unique_key='product_id',
    strategy='check',
    check_cols=[ 'weight', 'length', 'height', 'width']
) }}

select
    product_id,
    product_category,
    weight,
    length,
    height,
    width,
    current_timestamp() as snapshot_at
from {{ ref('dim_products') }}

{% endsnapshot %}