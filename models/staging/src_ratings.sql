with source as (
    select * from {{ source('raw', 'raw_ratings') }}
)

select 
    userId as user_id,
    movieId as movie_id,
    rating,
    timestamp as rated_at
from source 
