with ratings as (
    select distinct user_id from {{ ref('src_ratings') }}
),

tags as (
    select distinct user_id from {{ ref('src_tags') }}
)

select user_id from ratings
union
select user_id from tags