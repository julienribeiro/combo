{% macro normalize_date(column) %}
    DATE(
        CASE
            WHEN CAST({{ column }} AS STRING) LIKE '%/%' THEN
                PARSE_DATE('%d/%m/%Y', CAST({{ column }} AS STRING))
            WHEN CAST({{ column }} AS STRING) LIKE '%-%' THEN
                PARSE_DATE('%Y-%m-%d', CAST({{ column }} AS STRING))
            ELSE 
                SAFE_CAST({{ column }} AS DATE)
        END
    )
{% endmacro %}