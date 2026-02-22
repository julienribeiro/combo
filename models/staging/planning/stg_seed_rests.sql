WITH final AS (
    SELECT
        id AS rest_id,
        user_contract_id,
        timeoff_id AS rest_timeoff_id,
        original_shift_id AS rest_original_shift_id,
        account_id,
        partner_id,
        created_at AS rest_created_at,
        updated_at AS rest_updated_at,
        starts_at AS rest_start_at,
        ends_at AS rest_end_at,
        rest_type
    FROM
        {{ ref('rests') }}
)

SELECT *
FROM final