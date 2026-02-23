WITH planning_events AS (
    SELECT
        shift_id AS event_id,
        user_contract_id,
        shift_start_at AS event_start_at,
        shift_end_at AS event_end_at,
        event_type
    FROM 
        {{ ref('mart_shifts') }}

    UNION ALL

    SELECT
        rest_id AS event_id,
        user_contract_id,
        rest_start_at AS event_start_at,
        rest_end_at AS event_end_at,
        event_type
    FROM 
        {{ ref('mart_rests') }}
),

user_contracts AS (
    SELECT 
        user_contract_id,
        location_id,
        account_id
    FROM
        {{ ref('mart_user_contracts') }}
),

final AS (
    SELECT 
        planning_events.event_id,
        user_contracts.user_contract_id,
        user_contracts.location_id,
        user_contracts.account_id,
        planning_events.event_start_at,
        planning_events.event_end_at,
        planning_events.event_type
    FROM
        planning_events
    LEFT JOIN 
        user_contracts
        ON 
            planning_events.user_contract_id = user_contracts.user_contract_id
)

SELECT 
    *
FROM 
    final 