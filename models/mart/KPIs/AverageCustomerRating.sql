select 
    avg(review_score) as average_rating
from {{ ref('fact_reviews') }}