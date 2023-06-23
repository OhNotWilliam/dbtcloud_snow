select
    rec.*,
    laps.interval_id as lap_id,
    laps.interval_description as lap_desc,
    interval_type as lap_type
from {{ ref("uni_fit_records") }} as rec
inner join
    {{ ref("uni_fit_laps") }} as laps
    on laps.timestamp_end >= rec.timestamp
    and laps.timestamp_start <= rec.timestamp
