SELECT
    AVG(lactate_in_mmoll_l) as lactate_in_mmoll_l,
    AVG(perceived_pain) as perceived_pain,
    AVG(glucose_level) as glucose_level,
    AVG(core_body_temp_in_c) as core_body_temp_in_c,
    AVG(heartrate_in_bpm) as heartrate_in_bpm,
    AVG(pct_of_max_hr) as pct_of_max_hr,
    AVG(power_in_watt) as power_in_watt,
    AVG(cadence_in_rpm) as cadence_in_rpm,
    AVG(total_hemoglobin_concentration_in_gdl) as total_hemoglobin_concentration_in_gdl,
    AVG(saturated_hemoglobin_in_perc) as saturated_hemoglobin_in_perc,
    workout_time_in_min,
    workout,
    date,
    LEFT(time,5) as time_min,
    DATE_TRUNC('minute', tstamp) as tstamp,
    lap_id,
    lap_desc,
    lap_type,
    interval_start_time

from {{ref("mart_kpis")}}

GROUP BY ALL