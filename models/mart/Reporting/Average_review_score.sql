select avg(average_review_score) as avg_review_score
from {{ ref('fact_reviews') }}