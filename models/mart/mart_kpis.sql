SELECT
    pl.lactate_in_mmoll_l,
    pl.perceived_pain,
    fit.heartrate_in_bpm,
    fit.power_in_watt,
    fit.cadence_in_rpm,
    fit.total_hemoglobin_concentration_in_gdl,
    fit.saturated_hemoglobin_in_perc,
    gluc.glucose_level,
    temp.core_body_temp_in_c,
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
    left JOIN {{ ref('pain_lactate_intervals') }} as pl ON pl.interval_id = RIGHT(fit.lap_id,1) and pl.date = fit.date
    left JOIN {{ ref('glucose_intervals') }} as gluc on gluc.date= fit.date and gluc.tmin = fit.tmin and gluc.lap_id = fit.lap_id
    left JOIN {{ ref('temp_intervals') }} as temp on temp.date= fit.date and temp.tmin = fit.tmin and temp.lap_id = fit.lap_id

    --using left joins here, as missing SAP data might mess things up