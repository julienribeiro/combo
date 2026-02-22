WITH rests AS (
    SELECT
        rest_id,
        user_contract_id,
        rest_timeoff_id,
        rest_original_shift_id,
        account_id,
        partner_id,
        event_type,
        rest_created_at,
        rest_updated_at,
        rest_start_at,
        rest_end_at,
        rest_type
    FROM
        {{ ref('def_rests') }}
),

user_contracts AS (
    SELECT 
        user_contract_id,
        account_id
    FROM
        {{ ref('def_user_contracts') }}
),

final AS (
    SELECT 
        rests.rest_id,
        rests.user_contract_id,
        rests.rest_timeoff_id,
        rests.rest_original_shift_id,
        COALESCE(rests.account_id, user_contracts.account_id) AS account_id,
        rests.partner_id,
        rests.event_type,
        rests.rest_created_at,
        rests.rest_updated_at,
        rests.rest_start_at,
        rests.rest_end_at,
        rests.rest_type
    FROM
        rests
    LEFT JOIN 
        user_contracts
        ON
            rests.user_contract_id = user_contracts.user_contract_id
)

SELECT *
FROM final