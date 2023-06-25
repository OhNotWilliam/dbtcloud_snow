{% macro transform_intervals(from_table, join_table) %}
select
    src.*,
    laps.interval_id as lap_id,
    laps.interval_description as lap_desc,
    interval_type as lap_type,
    LEFT(src.time, 5) as tmin
from {{ ref(from_table) }} as src
inner join
    {{ ref(join_table) }} as laps
    on laps.timestamp_end >= src.timestamp
    and laps.timestamp_start <= src.timestamp
{% endmacro %}
