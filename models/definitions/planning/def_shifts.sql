WITH final AS (
    SELECT
        shift_id,
        user_contract_id,
        shift_weekly_schedule_id,
        shift_label_id,
        account_id,
        partner_id,
        shift_validator_id,
        shift_planned_hours_last_edited_by_id,
        shift_created_at,
        shift_updated_at,
        shift_start_at,
        shift_end_at,
        shift_validated_at,
        shift_planned_hours_last_edited_at,
        shift_locked_at,
        shift_planification_type,
        shift_break_duration,
        shift_real_break_duration,
        is_shift_did_not_show
    FROM
        {{ ref('stg_seed_shifts') }}
)

SELECT *
FROM final