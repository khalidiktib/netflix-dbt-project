with source as (
    select * from {{ source('raw', 'raw_genome_tags') }}
)

select
    tagId as tag_id,
    tag
from source