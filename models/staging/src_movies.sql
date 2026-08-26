with source as (
    select * from {{ source('raw', 'raw_movies') }}
)

select
    movieId as movie_id,
    title,
    genres
from source