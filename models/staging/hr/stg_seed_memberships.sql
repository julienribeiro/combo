WITH final AS (
    SELECT
        id AS member_id,
        user_id AS member_user_id,
        account_id,
        created_at AS member_created_at,
        updated_at AS member_updated_at,
        role AS member_role,
        sort_index AS member_sort_index,
        lastname AS member_lastname,
        firstname AS member_firstname,
        street_address AS member_address,
        JSON_VALUE(preferences, '$.member_page_order_by') AS member_pref_member_page_order_by,
        {{ normalize_booleen('active') }} AS is_member_active,
        COALESCE(CAST(onboarded AS BOOL), FALSE) AS is_member_onboarded,
        COALESCE(CAST(can_manage_published_planning AS BOOL), FALSE) AS can_member_manage_published_planning,
        COALESCE(CAST(can_invalidate_shift AS BOOL), FALSE) AS can_member_invalidate_shift,
        COALESCE(CAST(can_remove_employee AS BOOL), FALSE) AS can_member_remove_employee,
        COALESCE(CAST(can_set_custom_rest_value AS BOOL), FALSE) AS can_member_set_custom_rest_value,
        COALESCE(CAST(enhanced_medical_examination AS BOOL), FALSE) AS has_member_enhanced_medical_examination,
        COALESCE(CAST(JSON_VALUE(preferences, '$.admin_restrict_access_to_timeoff') AS BOOL), FALSE) AS is_member_pref_admin_restrict_access_to_timeoff,
        COALESCE(CAST(JSON_VALUE(preferences, '$.calendar_sync_enabled') AS BOOL), FALSE) AS is_member_pref_calendar_sync_enabled,
        COALESCE(CAST(JSON_VALUE(preferences, '$.can_write_paid_leave_ledger') AS BOOL), FALSE) AS can_member_pref_write_paid_leave_ledger,
        COALESCE(CAST(JSON_VALUE(preferences, '$.display_shifts_from_other_teams') AS BOOL), FALSE) AS is_member_pref_display_shifts_from_other_teams,
        COALESCE(CAST(JSON_VALUE(preferences, '$.email_notification_enabled') AS BOOL), FALSE) AS is_member_pref_email_notification_enabled,
        COALESCE(CAST(JSON_VALUE(preferences, '$.has_access_to_all_locations') AS BOOL), FALSE) AS has_member_pref_access_to_all_locations,
        COALESCE(CAST(JSON_VALUE(preferences, '$.include_owner_in_schedules') AS BOOL), FALSE) AS is_member_pref_include_owner_in_schedules,
        COALESCE(CAST(JSON_VALUE(preferences, '$.manager_can_edit_employees') AS BOOL), FALSE) AS can_member_pref_manager_edit_employees,
        COALESCE(CAST(JSON_VALUE(preferences, '$.mobile_notification_enabled') AS BOOL), FALSE) AS is_member_pref_mobile_notification_enabled,
        COALESCE(CAST(JSON_VALUE(preferences, '$.planning_hide_alerts_by_default') AS BOOL), FALSE) AS is_member_pref_planning_hide_alerts_by_default,
        COALESCE(CAST(JSON_VALUE(preferences, '$.should_receive_mail_when_users_info_updated') AS BOOL), FALSE) AS is_member_pref_should_receive_mail_when_users_info_updated,
        COALESCE(CAST(JSON_VALUE(preferences, '$.should_receive_planning_publication_reminder') AS BOOL), FALSE) AS is_member_pref_should_receive_planning_publication_reminder,
        COALESCE(CAST(JSON_VALUE(preferences, '$.sms_notification_enabled') AS BOOL), FALSE) AS is_member_pref_sms_notification_enabled
    FROM
        {{ ref('memberships') }}
)

SELECT *
FROM final