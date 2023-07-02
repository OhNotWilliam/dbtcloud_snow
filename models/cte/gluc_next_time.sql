  SELECT 
    time AS time,
    date,
    glucose_level,
    LAG(time) OVER (PARTITION BY date ORDER BY time) AS previous_time
  FROM {{ ref('glucose_intervals') }}
