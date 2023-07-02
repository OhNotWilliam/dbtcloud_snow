SELECT
lap_desc, interval_start_time, workout, MIN(workout_time_in_min) as elapsed_time
FROM 
{{ ref('mart_kpis') }}
group by all