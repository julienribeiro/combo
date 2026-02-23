WITH user_contracts AS (
    SELECT
        user_contract_id,
        member_id,
        location_id,
        account_id,
        user_contract_team_id,
        partner_id,
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
        {{ ref('def_user_contracts') }}
),

members AS (
    SELECT 
        member_id, 
        member_role
    FROM 
        {{ ref('def_memberships') }}
),

final AS (
    SELECT 
        user_contracts.user_contract_id,
        user_contracts.member_id,
        user_contracts.location_id,
        user_contracts.account_id,
        user_contracts.user_contract_team_id,
        user_contracts.partner_id,
        user_contracts.user_contract_original_contract_id,
        user_contracts.user_contract_created_at,
        user_contracts.user_contract_updated_at,
        user_contracts.user_contract_start_date,
        user_contracts.user_contract_end_date,
        user_contracts.user_contract_end_trial_date,
        user_contracts.user_contract_invitation_sent_at,
        user_contracts.user_contract_invitation_accepted_at,
        user_contracts.user_contract_start_at,
        members.member_role,
        CASE    
            WHEN members.member_role IN ('employee', 'manager') THEN true
            WHEN members.member_role IN ('owner', 'director', 'main_owner') THEN false
        END AS is_billable_user_contract,
        user_contracts.user_contract_type,
        user_contracts.user_contract_time,
        user_contracts.user_contract_end_reason,
        user_contracts.user_contract_lastname,
        user_contracts.user_contract_firstname,
        user_contracts.user_contract_address,
        user_contracts.user_contract_birth_department_code,
        user_contracts.user_contract_object_type,
        user_contracts.user_contract_working_days_in_week,
        user_contracts.is_user_contract_daily_worker,
        user_contracts.is_user_contract_hidden_in_register,
        user_contracts.is_user_contract_virtual
    FROM 
        user_contracts
    LEFT JOIN 
        members
        ON 
            user_contracts.member_id = members.member_id
)

SELECT *
FROM final