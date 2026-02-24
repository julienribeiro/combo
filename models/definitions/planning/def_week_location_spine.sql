WITH dates AS (
    SELECT 
        DATE('2023-01-02') AS min_event_date,
        MAX(DATE_TRUNC(DATE(week_start_date), WEEK(MONDAY))) AS max_event_date
    FROM
        {{ ref('mart_planning_events_weekly_exploded') }}
),

weeks AS (
    SELECT week_start_date
    FROM dates
    CROSS JOIN UNNEST(
        GENERATE_DATE_ARRAY(
            dates.min_event_date,
            dates.max_event_date,
            INTERVAL 7 DAY
        )
    ) AS week_start_date
),

active_locations AS (
    SELECT 
        location_id,
        account_id
    FROM
        {{ ref('def_locations') }}
    WHERE 
        NOT is_location_archived
),

final AS (
    SELECT
        weeks.week_start_date,
        active_locations.account_id,
        active_locations.location_id
    FROM weeks
    CROSS JOIN active_locations
)

SELECT *
FROM final
