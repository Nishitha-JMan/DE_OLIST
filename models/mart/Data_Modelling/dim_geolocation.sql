with geolocation as (
    select * from {{ ref('stg_geolocation') }}
)

select
    zip_code_prefix,
    latitude,
    longitude,
    city,
    state
from geolocation
group by
    zip_code_prefix,
    latitude,
    longitude,
    city,
    state