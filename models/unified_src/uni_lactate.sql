SELECT *, '1' as Workout FROM {{ref("DP_JF_LACTATE_WORKOUT1")}}
UNION ALL
SELECT *, '2' as Workout FROM {{ref("DP_JF_LACTATE_WORKOUT2")}}
UNION ALL
SELECT *, '3' as Workout FROM {{ref("DP_JF_LACTATE_WORKOUT3")}}