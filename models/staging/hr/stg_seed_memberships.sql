WITH final AS (
    SELECT
        id AS member_id,
        user_id,
        account_id,
        created_at AS member_created_at,
        updated_at AS member_updated_at,
        lastname AS member_lastname,
        firstname AS member_firstnamen
        active AS is_member_active,
        role AS member_role_type,
        sort_index,
        preferences,
        onboarded AS is_member_onboarded,
        can_manage_published_planning AS can_member_manage_published_planning,
        can_invalidate_shift AS can_member_invalidate_shift,
        can_remove_employee AS can_member_remove_employee,
        can_set_custom_rest_value AS can_member_set_custom_rest_value,
        street_address AS member_street_address,
        enhanced_medical_examination AS member_enhanced_medical_examination
    FROM
        {{ ref('memberships') }}
)

SELECT *
FROM final