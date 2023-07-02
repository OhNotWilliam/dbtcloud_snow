with zone_associations AS (
  SELECT
    time,
    pct_of_max_hr,
    workout,
    CASE
      WHEN pct_of_max_hr BETWEEN 50 AND 60 THEN 1
      WHEN pct_of_max_hr BETWEEN 61 AND 70 THEN 2
      WHEN pct_of_max_hr BETWEEN 71 AND 80 THEN 3
      WHEN pct_of_max_hr BETWEEN 81 AND 90 THEN 4
      WHEN pct_of_max_hr BETWEEN 91 AND 100 THEN 5
      ELSE 0
    END AS zone
  FROM {{ ref('mart_kpis') }}
),
-- calculate the time spent in each zone
zone_times AS (
  SELECT
    zone,
    workout,
    COUNT(*) AS seconds_in_zone
  FROM zone_associations
  GROUP BY zone, workout
)
-- combine the zones, their names, and the time spent in each zone
SELECT
  zone,
  workout,
  CASE
    WHEN zone = 1 THEN 'Very light'
    WHEN zone = 2 THEN 'Light'
    WHEN zone = 3 THEN 'Moderate'
    WHEN zone = 4 THEN 'Hard'
    WHEN zone = 5 THEN 'Maximum'
    ELSE 'Below Very Light'
  END AS zone_name,
  seconds_in_zone,
    TO_CHAR(
      DATEADD('SECOND', seconds_in_zone, TO_TIMESTAMP('1970-01-01 00:00:00')), 
      'HH24:MI:SS'
  ) AS time_in_zone
FROM zone_times