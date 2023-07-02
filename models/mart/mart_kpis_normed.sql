select
    (LACTATE_IN_MMOLL_L - min_lactate) / (max_lactate - min_lactate) * 100 AS normalized_lactate,
    (PERCEIVED_PAIN - min_pain) / (max_pain - min_pain) * 100 AS normalized_pain,
    (GLUCOSE_LEVEL - min_glucose) / (max_glucose - min_glucose) * 100 AS normalized_glucose,
    (CORE_BODY_TEMP_IN_C - min_temp) / (max_temp - min_temp) * 100 AS normalized_temp,
    (HEARTRATE_IN_BPM - min_heartrate) / (max_heartrate - min_heartrate) * 100 AS normalized_heartrate,
    (POWER_IN_WATT - min_power) / (max_power - min_power) * 100 AS normalized_power,
    (CADENCE_IN_RPM - min_cadence) / (max_cadence - min_cadence) * 100 AS normalized_cadence,
    (TOTAL_HEMOGLOBIN_CONCENTRATION_IN_GDL - min_hemoglobin) / (max_hemoglobin - min_hemoglobin) * 100 AS normalized_hemoglobin,
    pct_of_max_hr,
    saturated_hemoglobin_in_perc,
    workout_time_in_min,
    workout,
    date,
    time_min,
    tstamp,
    lap_id,
    lap_desc,
    lap_type,
    interval_start_time
from {{ ref("mart_min_avgs") }}
cross join {{ ref('min_max_kpis') }}
