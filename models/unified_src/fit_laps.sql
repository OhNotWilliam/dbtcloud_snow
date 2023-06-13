SELECT *, '1' as Workout FROM {{ref("DP_JF_FIT_LAPS_WORKOUT1")}}
UNION ALL
SELECT *, '2' as Workout FROM {{ref("DP_JF_FIT_LAPS_WORKOUT2")}}