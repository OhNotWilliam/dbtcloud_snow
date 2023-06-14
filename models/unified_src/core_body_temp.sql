SELECT *, '1' as Workout FROM {{ref("DP_JF_CORE_BODY_TEMP_WORKOUT1")}}
UNION ALL
SELECT *, '2' as Workout FROM {{ref("DP_JF_CORE_BODY_TEMP_WORKOUT2")}}
/*
file for workout 3 was not available in the workzone as of 14th of June
*/