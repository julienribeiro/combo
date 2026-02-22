WITH final AS (
    SELECT
        user_contract_id,
        user_contract_member_id,
        location_id,
        account_id,
        user_contract_team_id,
        user_contract_partner_id,
        user_contract_original_contract_id,
        user_contract_created_at,
        user_contract_updated_at,
        user_contract_start_date,
        user_contract_end_date,
        user_contract_end_trial_date,
        user_contract_invitation_sent_at,
        user_contract_invitation_accepted_at,
        user_contract_start_at,
        user_contract_type,
        user_contract_time,
        user_contract_end_reason,
        user_contract_lastname,
        user_contract_firstname,
        user_contract_address,
        user_contract_birth_department_code,
        user_contract_object_type,
        user_contract_working_days_in_week,
        is_user_contract_daily_worker,
        is_user_contract_hidden_in_register,
        is_user_contract_virtual
    FROM
        {{ ref('stg_seed_user_contracts') }}
)

SELECT *
FROM final