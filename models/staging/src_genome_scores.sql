with source as (
    select * from {{ source('raw', 'raw_genome_scores') }}
)

select
    movieId as movie_id,
    tagId as tag_id,
    relevance
from source