{% macro timezone(country) %}
    CASE
        WHEN {{ country }} = 'FR' THEN 'Europe/Paris'
        WHEN {{ country }} = 'ES' THEN 'Europe/Madrid'
        WHEN {{ country }} = 'BE' THEN 'Europe/Brussels'
        WHEN {{ country }} = 'NC' THEN 'Pacific/Noumea'
    END
{% endmacro %}