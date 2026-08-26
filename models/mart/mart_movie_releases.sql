with movies as (
    select * from {{ ref('dim_movies') }}
),

ratings as (
    select
        movie_id,
        count(*) as num_ratings,
        avg(rating) as avg_rating
    from {{ ref('fct_ratings') }}
    group by movie_id
),

tags as (
    select
        movie_id,
        count(distinct tag_id) as num_relevant_tags
    from {{ ref('fct_genome_scores') }}
    where relevance > 0.5
    group by movie_id
)

select
    movies.movie_id,
    movies.title,
    regexp_substr(movies.title, '\\((\\d{4})\\)', 1, 1, 'e', 1) as release_year,
    movies.genres,
    coalesce(ratings.num_ratings, 0) as num_ratings,
    ratings.avg_rating,
    coalesce(tags.num_relevant_tags, 0) as num_relevant_tags
from movies
left join ratings on movies.movie_id = ratings.movie_id
left join tags on movies.movie_id = tags.movie_id