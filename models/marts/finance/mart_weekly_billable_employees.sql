WITH planning_events_enriched AS (
    SELECT
        user_contract_id,
        location_id,
        account_id,
        event_start_at
    FROM
        {{ ref('mart_planning_events') }}
),

locations AS (
    SELECT
        location_id,
        is_location_archived
    FROM
        {{ ref('def_locations') }}
),

final AS (
    SELECT DISTINCT
        DATE_TRUNC(DATE(planning_events_enriched.event_start_at), WEEK(MONDAY)) AS week_start,
        planning_events_enriched.account_id,
        planning_events_enriched.location_id,
        planning_events_enriched.user_contract_id
    FROM
        planning_events_enriched
    INNER JOIN
        locations
        ON planning_events_enriched.location_id = locations.location_id
    WHERE
        NOT locations.is_location_archived
)

SELECT
    *
FROM
    final