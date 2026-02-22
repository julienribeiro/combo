WITH final AS (
    SELECT
        id AS shift_id,
        user_contract_id,
        weeklyschedule_id AS shift_weekly_schedule_id,
        label_id AS shift_label_id,
        account_id,
        partner_id,
        validator_id AS shift_validator_id,
        planned_hours_last_edited_by_id AS shift_planned_hours_last_edited_by_id,
        created_at AS shift_created_at,
        updated_at AS shift_updated_at,
        real_starts_at AS shift_start_at,
        real_ends_at AS shift_end_at,
        validated_at AS shift_validated_at,
        planned_hours_last_edited_at AS shift_planned_hours_last_edited_at,
        locked_at AS shift_locked_at,
        planification_type AS shift_planification_type,
        CAST(breakduration AS INT64) AS shift_break_duration,
        CAST(real_breakduration AS INT64) AS shift_real_break_duration,
        {{ normalize_booleen('did_not_show') }} AS is_shift_did_not_show
    FROM
        {{ ref('shifts') }}
)

SELECT *
FROM final