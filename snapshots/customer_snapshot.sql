{% snapshot customer_snapshot %}
{{ config(
    target_schema='snapshots',
    unique_key='customer_unique_id',
    strategy='check',
    check_cols=['customer_city', 'customer_state']
) }}

select
    customer_unique_id,
    customer_city,
    customer_state,
    current_timestamp() as snapshot_at
from {{ ref('dim_customers') }}

{% endsnapshot %}