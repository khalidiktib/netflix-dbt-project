select
    movie_id,
    tag_id,
    relevance
from {{ ref('src_genome_scores') }}