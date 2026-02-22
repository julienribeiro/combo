{% macro consumption_pricing(nb_employees) %}
    CASE
        WHEN {{ nb_employees }} <= 5 THEN 60
        WHEN {{ nb_employees }} <= 39 THEN 80
        ELSE 216
    END
    +
    CASE
        WHEN {{ nb_employees }} <= 6 THEN 0
        WHEN {{ nb_employees }} <= 39 THEN ({{ nb_employees }} - 6) * 4
        ELSE (33 * 4) + ({{ nb_employees }} - 39) * 2.4
    END
{% endmacro %}