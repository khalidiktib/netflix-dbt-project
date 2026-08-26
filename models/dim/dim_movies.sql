with 
movies as (
    select * from {{ ref('src_movies') }}
),

links as (
    select * from {{ ref('src_links') }}
)

select
    movies.movie_id,
    movies.title,
    movies.genres,
    links.imdb_id,
    links.tmdb_id
from movies
left join links on movies.movie_id = links.movie_id
