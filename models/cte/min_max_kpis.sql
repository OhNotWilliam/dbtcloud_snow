SELECT 
  MIN(LACTATE_IN_MMOLL_L) AS min_lactate,
  MAX(LACTATE_IN_MMOLL_L) AS max_lactate,
  MIN(PERCEIVED_PAIN) AS min_pain,
  MAX(PERCEIVED_PAIN) AS max_pain,
  MIN(GLUCOSE_LEVEL) AS min_glucose,
  MAX(GLUCOSE_LEVEL) AS max_glucose,
  MIN(CORE_BODY_TEMP_IN_C) AS min_temp,
  MAX(CORE_BODY_TEMP_IN_C) AS max_temp,
  MIN(HEARTRATE_IN_BPM) AS min_heartrate,
  MAX(HEARTRATE_IN_BPM) AS max_heartrate,
  MIN(POWER_IN_WATT) AS min_power,
  MAX(POWER_IN_WATT) AS max_power,
  MIN(CADENCE_IN_RPM) AS min_cadence,
  MAX(CADENCE_IN_RPM) AS max_cadence,
  MIN(TOTAL_HEMOGLOBIN_CONCENTRATION_IN_GDL) AS min_hemoglobin,
  MAX(TOTAL_HEMOGLOBIN_CONCENTRATION_IN_GDL) AS max_hemoglobin
FROM {{ ref('mart_kpis') }}