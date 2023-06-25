    SELECT
        a1.date,
        a1.lap_id,
        a1.time,
        a1.CORE_BODY_TEMP_IN_C,
        MIN(a2.time) AS next_bigger_time
    FROM
        {{ ref('temp_intervals') }} a1
        LEFT JOIN {{ ref('temp_intervals') }} a2 ON a2.time > a1.time
    GROUP BY
        a1.date,
        a1.lap_id,
        a1.time,
        a1.CORE_BODY_TEMP_IN_C