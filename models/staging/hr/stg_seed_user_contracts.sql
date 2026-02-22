WITH final AS (
    SELECT
        id AS user_contract_id,
        created_at AS user_contract_created_at,
        updated_at AS user_contract_updated_at,
        location_id AS user_contract_location_id,
        contract_start AS user_contract_start_at,
        contract_end AS user_contract_end_at,
        contract_end_trial AS user_contract_trial_end_at,
        contract_time AS user_contract_time,
        contract_type AS user_contract_type,
        lastname AS user_contract_lastname,
        firstname AS user_contract_firstname,
        street_address AS user_contract_street_address,
        do_not_show_in_register AS is_user_contract_hidden_in_register,
        contract_end_reason AS user_contract_end_reason,
        team_id AS user_contract_team_id,
        invitation_sent_at AS user_contract_invitation_sent_at,
        invitation_accepted_at AS user_contract_invitation_accepted_at,
        membership_id AS member_id,
        daily_worker AS is_user_contract_daily_worker,
        working_days_in_week AS user_contract_working_days_per_week,
        partner_id AS user_contract_partner_id,
        birth_department_code AS user_contract_birth_department_code,
        start_time AS user_contract_start_time,
        account_id AS user_contract_account_id,
        original_contract_id AS user_contract_original_contract_id,
        type AS user_contract_type_detail,
        virtual AS is_user_contract_virtual
    FROM {{ ref('user_contracts') }}
)

SELECT *
FROM final