-- filepath: c:\Users\NishithaSGandhi\DE_Final\DE_Final_Project\olist_project\models\transform\deduplicated_geolocation.sql
{{ config(materialized='table') }}

select
    zip_code_prefix,
    latitude,
    longitude
from (
    select *,
        row_number() over (partition by zip_code_prefix order by latitude, longitude) as row_num
    from {{ ref('stg_geolocation') }}
)
where row_num = 1