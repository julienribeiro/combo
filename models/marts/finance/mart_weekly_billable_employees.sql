WITH planning_events_enriched AS (
    SELECT
        user_contract_id,
        location_id,
        account_id,
        week_start
    FROM
        {{ ref('mart_planning_events_weekly_exploded') }}
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
        week_start,
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