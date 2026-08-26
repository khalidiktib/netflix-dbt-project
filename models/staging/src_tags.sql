with source as (
    select * from {{ source('raw', 'raw_tags') }}
)

select
    userId as user_id,
    movieId as movie_id,
    tag,
    timestamp as tagged_at
from source