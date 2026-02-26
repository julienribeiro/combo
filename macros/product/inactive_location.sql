{% macro inactive_location(revenue, nb_employees) %}
    CASE
        WHEN {{ revenue }} > 0.0 AND {{ nb_employees }} = 0 THEN true
        ELSE false
    END
{% endmacro %}