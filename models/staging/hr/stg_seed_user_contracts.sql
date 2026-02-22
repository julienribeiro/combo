WITH final AS (
    SELECT
        id AS user_contract_id,
        membership_id AS user_contract_member_id,
        location_id,
        account_id,
        team_id AS user_contract_team_id,
        partner_id AS user_contract_partner_id,
        original_contract_id AS user_contract_original_contract_id,
        created_at AS user_contract_created_at,
        updated_at AS user_contract_updated_at,
        {{ normalize_date('contract_start') }} AS user_contract_start_date,
        {{ normalize_date('contract_end') }} AS user_contract_end_date,
        {{ normalize_date('contract_end_trial') }} AS user_contract_end_trial_date,
        invitation_sent_at AS user_contract_invitation_sent_at,
        invitation_accepted_at AS user_contract_invitation_accepted_at,
        start_time AS user_contract_start_at,
        contract_type AS user_contract_type,
        contract_time AS user_contract_time,
        contract_end_reason AS user_contract_end_reason,
        lastname AS user_contract_lastname,
        firstname AS user_contract_firstname,
        street_address AS user_contract_address,
        birth_department_code AS user_contract_birth_department_code,
        type AS user_contract_object_type,
        CAST(working_days_in_week AS INT64) AS user_contract_working_days_in_week,
        {{ normalize_booleen('daily_worker') }} AS is_user_contract_daily_worker,
        COALESCE(CAST(do_not_show_in_register AS BOOL), FALSE) AS is_user_contract_hidden_in_register,
        {{ normalize_booleen('virtual') }} AS is_user_contract_virtual
    FROM
        {{ ref('user_contracts') }}
)

SELECT *
FROM final