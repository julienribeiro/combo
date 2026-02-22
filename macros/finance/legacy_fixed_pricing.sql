{% macro legacy_fixed_pricing(nb_employees) %}
    CASE
        WHEN {{ nb_employees }} BETWEEN 1 AND 5 THEN 49
        WHEN {{ nb_employees }} BETWEEN 6 AND 10 THEN 99
        WHEN {{ nb_employees }} BETWEEN 11 AND 30 THEN 199
        WHEN {{ nb_employees }} >= 31 THEN 299
        ELSE 0
    END
{% endmacro %}