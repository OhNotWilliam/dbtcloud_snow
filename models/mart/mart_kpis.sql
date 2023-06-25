SELECT
    pl.lactate_in_mmoll_l,
    pl.perceived_pain,
    gluc.glucose_level,
    temp.core_body_temp_in_c,
    fit.heartrate_in_bpm,
    fit.power_in_watt,
    fit.cadence_in_rpm,
    fit.total_hemoglobin_concentration_in_gdl,
    fit.saturated_hemoglobin_in_perc,
    fit.workout_time_in_min,
    fit.workout,
    fit.date,
    fit.time,
    fit.timestamp,
    fit.lap_id,
    fit.lap_desc,
    fit.lap_type
FROM
    {{ ref('fit_records_intervals') }} as fit
    LEFT JOIN {{ ref('pain_lactate_intervals') }} as pl ON pl.interval_id = RIGHT(fit.lap_id,1) and pl.date = fit.date
    left JOIN {{ ref('gluc_next_time') }} as gluc on gluc.date = fit.date -- left because workout 3 is missing
    and gluc.time <= fit.time
    and (
        gluc.next_bigger_time > fit.time
        or gluc.next_bigger_time is null
    )
    and gluc.lap_id = fit.lap_id 
    inner JOIN {{ ref('temp_next_time') }} as temp on temp.date = fit.date
    and temp.time <= fit.time
    and (
        temp.next_bigger_time > fit.time
        or temp.next_bigger_time is null
    )
    and temp.lap_id = fit.lap_id 

