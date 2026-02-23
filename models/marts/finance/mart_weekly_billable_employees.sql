WITH planning_events_enriched AS (
    SELECT
        user_contract_id,
        location_id,
        account_id,
        week_start_date
    FROM
        {{ ref('mart_planning_events_weekly_exploded') }}
),

billable_user_contracts AS (
    SELECT 
        user_contract_id
    FROM
        {{ ref('mart_user_contracts') }}
    WHERE 
        is_billable_user_contract
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
        week_start_date,
        planning_events_enriched.account_id,
        planning_events_enriched.location_id,
        planning_events_enriched.user_contract_id
    FROM
        planning_events_enriched
    INNER JOIN 
        billable_user_contracts
        ON 
            planning_events_enriched.user_contract_id = billable_user_contracts.user_contract_id
    INNER JOIN
        locations
        ON 
            planning_events_enriched.location_id = locations.location_id
    WHERE
        NOT locations.is_location_archived
)

SELECT
    *
FROM
    final