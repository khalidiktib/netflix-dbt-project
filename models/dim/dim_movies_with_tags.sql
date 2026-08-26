with movies as (
    select * from {{ ref('dim_movies') }}
),

tags as (
    select
        movie_id,
        array_agg(distinct tag) as tags
    from {{ ref('src_tags') }}
    group by movie_id
)

select
    movies.movie_id,
    movies.title,
    movies.genres,
    movies.imdb_id,
    movies.tmdb_id,
    tags.tags
from movies
left join tags
    on movies.movie_id = tags.movie_id