select
    tag_id,
    tag
from {{ ref('src_genome_tags') }}