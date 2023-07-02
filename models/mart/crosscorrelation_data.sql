with
    correlation_data as (
        {% set measures = [
            "lactate_in_mmoll_l",
            "perceived_pain",
            "glucose_level",
            "core_body_temp_in_c",
            "heartrate_in_bpm",
            "pct_of_max_hr",
            "power_in_watt",
            "cadence_in_rpm",
            "total_hemoglobin_concentration_in_gdl",
            "saturated_hemoglobin_in_perc",
        ] %}
        {% set sort_index = 0 %}
        {% for i in range(measures | length) %}
            {% for j in range(i + 1, measures | length) %}
                {% set sort_index = loop.index %}
                {{ calculate_correlation(measures[i], measures[j], sort_index, "mart_min_avgs") }}
                union all
            {% endfor %}
        {% endfor %}
        select *
        from
            (
                {{ calculate_correlation(measures[-1], measures[-1], 999, "mart_min_avgs") }}
                where 1 = 0
            )  -- Dummy query to ensure final UNION ALL
    )
select *
from correlation_data
