select
    pl.lactate_in_mmoll_l,
    pl.perceived_pain,
    gluc.glucose_level,
    temp.core_body_temp_in_c,
    fit.heartrate_in_bpm,
    fit.heartrate_in_bpm / 195 * 100 as pct_of_max_hr,
    fit.power_in_watt,
    fit.cadence_in_rpm,
    fit.total_hemoglobin_concentration_in_gdl,
    fit.saturated_hemoglobin_in_perc,
    fit.workout_time_in_min,
    fit.workout,
    fit.date,
    fit.time,
    to_timestamp(fit.timestamp) as tstamp,
    fit.lap_id,
    fit.lap_desc,
    fit.lap_type,
    first_value(tstamp) over (
        partition by lap_desc order by fit.timestamp
    ) as interval_start_time
from {{ ref("fit_records_intervals") }} as fit
left join
    {{ ref("pain_lactate_intervals") }} as pl
    on pl.interval_id = right(fit.lap_id, 1)
    and pl.date = fit.date
left join
    {{ ref("gluc_next_time") }} as gluc
    on fit.time <= gluc.time
    and (fit.time > gluc.previous_time or gluc.previous_time is null)
    and fit.date = gluc.date
left join
    {{ ref("temp_next_time") }} as temp
    on fit.time <= temp.time
    and (fit.time > temp.previous_time or temp.previous_time is null)
    and fit.date = temp.date
