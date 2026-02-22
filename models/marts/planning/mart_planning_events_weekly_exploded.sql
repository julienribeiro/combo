WITH planning_events AS (
    SELECT
        event_id,
        user_contract_id,
        location_id,
        account_id,
        event_start_at,
        event_end_at,
        event_type
    FROM
        {{ ref('mart_planning_events') }}
),

final AS (
    SELECT
        planning_events.event_id,
        planning_events.user_contract_id,
        planning_events.location_id,
        planning_events.account_id,
        planning_events.event_type,
        week_start
    FROM 
        planning_events
    CROSS JOIN UNNEST(
        GENERATE_DATE_ARRAY(
            DATE_TRUNC(DATE(planning_events.event_start_at), WEEK(MONDAY)),
            DATE_TRUNC(DATE(planning_events.event_end_at), WEEK(MONDAY)),
            INTERVAL 7 DAY
        )
    ) AS week_start
)

SELECT
    *
FROM
    final