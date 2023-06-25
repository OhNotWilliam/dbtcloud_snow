    SELECT
        a1.date,
        a1.lap_id,
        a1.time,
        a1.glucose_level,
        MIN(a2.time) AS next_bigger_time
    FROM
        {{ ref('glucose_intervals') }} a1
        LEFT JOIN {{ ref('glucose_intervals') }} a2 ON a2.time > a1.time
    GROUP BY
        a1.date,
        a1.lap_id,
        a1.time,
        a1.glucose_level