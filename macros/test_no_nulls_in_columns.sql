{% test no_nulls_in_columns(model, columns) %}

select *
from {{ model }}
where
{% for column in columns %}
    {{ column }} is null
    {% if not loop.last %} or {% endif %}
{% endfor %}

{% endtest %}