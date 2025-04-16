{% snapshot seller_snapshot %}
{{ config(
    target_schema='snapshots',
    unique_key='seller_id',
    strategy='check',
    check_cols=['city', 'state']
) }}

select
    seller_id,
    city,
    state,
    seller_lattitude,
    seller_longitude,
    current_timestamp() as snapshot_at
from {{ ref('dim_sellers') }}

{% endsnapshot %}