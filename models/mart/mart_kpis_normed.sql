select
    lactate_in_mmoll_l
    / (select max(lactate_in_mmoll_l) from saphackathon.dev.mart_kpis)
    * 100 as lactate_in_mmoll_l_pct_of_max,
    perceived_pain
    / (select max(perceived_pain) from saphackathon.dev.mart_kpis)
    * 100 as perceived_pain_pct_of_max,
    glucose_level
    / (select max(glucose_level) from saphackathon.dev.mart_kpis)
    * 100 as glucose_level_pct_of_max,
    core_body_temp_in_c
    / (select max(core_body_temp_in_c) from saphackathon.dev.mart_kpis)
    * 100 as core_body_temp_in_c_pct_of_max,
    heartrate_in_bpm
    / (select max(heartrate_in_bpm) from saphackathon.dev.mart_kpis)
    * 100 as heartrate_in_bpm_pct_of_max,
    power_in_watt
    / (select max(power_in_watt) from saphackathon.dev.mart_kpis)
    * 100 as power_in_watt_pct_of_max,
    cadence_in_rpm
    / (select max(cadence_in_rpm) from saphackathon.dev.mart_kpis)
    * 100 as cadence_in_rpm_pct_of_max,
    total_hemoglobin_concentration_in_gdl / (
        select max(total_hemoglobin_concentration_in_gdl)
        from saphackathon.dev.mart_kpis
    )
    * 100 as total_hemoglobin_concentration_in_gdl_pct_of_max,
    pct_of_max_hr,
    saturated_hemoglobin_in_perc,
    workout_time_in_min,
    workout,
    date,
    time,
    tstamp,
    lap_id,
    lap_desc,
    lap_type,
    interval_start_time
from {{ ref("mart_kpis") }}
