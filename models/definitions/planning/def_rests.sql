WITH final AS (
    SELECT
        rest_id,
        user_contract_id,
        rest_timeoff_id,
        rest_original_shift_id,
        account_id,
        partner_id,
        'rest' AS event_type,
        rest_created_at,
        rest_updated_at,
        rest_start_at,
        rest_end_at,
        rest_type
    FROM
        {{ ref('stg_seed_rests') }}
)

SELECT *
FROM final