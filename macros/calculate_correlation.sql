{% macro calculate_correlation(measure_1, measure_2, src) %}
    SELECT
        '{{ measure_1 }}' AS measure_1,
        '{{ measure_2 }}' AS measure_2,
        CORR({{ measure_1 }}, {{ measure_2 }}) AS correlation_value
    FROM {{ ref(src) }}
{% endmacro %}
