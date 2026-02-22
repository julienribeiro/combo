{% macro normalize_booleen(column) %}
    CASE LOWER(TRIM({{ column }}))
        WHEN 'true' THEN true
        WHEN '1' THEN true
        WHEN 'yes' THEN true
        WHEN 'false' THEN false
        WHEN '0' THEN false
        WHEN 'no' THEN false
        ELSE false
    END
{% endmacro %}