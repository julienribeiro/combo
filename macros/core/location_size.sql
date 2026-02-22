{% macro location_size(column) %}
    CASE
        WHEN {{ column }} <= 5 THEN 'micro'
        WHEN {{ column }} <= 39 THEN 'petit'
        ELSE 'grand'
    END
{% endmacro %}