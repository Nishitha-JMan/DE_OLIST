{% macro create_indexes(table_name, indexes) %}
    {% for index in indexes %}
        CREATE INDEX idx_{{ table_name }}_{{ loop.index }} 
        ON {{ table_name }} ({{ index | join(', ') }});
    {% endfor %}
{% endmacro %}