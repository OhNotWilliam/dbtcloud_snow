{% macro transform_intervals(from_table, join_table) %}
{{ config(
    materialized='view',
    unique_key='interval_id',
    alias = from_table ~ '_intervals'
) }}

select
    gluc.*,
    laps.interval_id as lap_id,
    laps.interval_description as lap_desc,
    interval_type as lap_type,
    LEFT(TIME, 5) as tmin
from {{ ref(from_table) }} as gluc
inner join
    {{ ref(join_table) }} as laps
    on laps.timestamp_end >= gluc.timestamp
    and laps.timestamp_start <= gluc.timestamp
{% endmacro %}
