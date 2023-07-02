SELECT 
    time AS time,
    date,
    CORE_BODY_TEMP_IN_C,
    LAG(time) OVER (PARTITION BY date ORDER BY time) AS previous_time
  FROM {{ ref('temp_intervals') }}
