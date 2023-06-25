SELECT l.DATE, l.INTERVAL_ID, l.LACTATE_IN_MMOLL_L, p.PERCEIVED_PAIN FROM {{ref("uni_pain")}} p
INNER JOIN {{ref("uni_lactate")}} l
USING (INTERVAL_ID)