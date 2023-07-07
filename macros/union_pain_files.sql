{% macro union_pain_files(from_table_1, from_table_2,from_table_3) %}
SELECT *, '1' as Workout from {{ref(from_table_1)}} 
UNION ALL
SELECT *, '2' as Workout FROM {{ref(from_table_2)}}
UNION ALL
SELECT *, '3' as Workout FROM {{ref(from_table_3)}}
{% endmacro %}




