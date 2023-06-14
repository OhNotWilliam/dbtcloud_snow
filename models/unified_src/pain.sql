SELECT *, '1' as Workout FROM {{ref("DP_JF_PAIN_WORKOUT1")}}
UNION ALL
SELECT *, '2' as Workout FROM {{ref("DP_JF_PAIN_WORKOUT2")}}
UNION ALL
SELECT *, '3' as Workout FROM {{ref("DP_JF_PAIN_WORKOUT3")}}