WITH members AS (
    SELECT
        member_id,
        member_user_id,
        account_id,
        member_created_at,
        member_updated_at,
        member_role,
        member_sort_index,
        member_lastname,
        member_firstname,
        member_address,
        member_pref_member_page_order_by,
        is_member_active,
        is_member_onboarded,
        can_member_manage_published_planning,
        can_member_invalidate_shift,
        can_member_remove_employee,
        can_member_set_custom_rest_value,
        has_member_enhanced_medical_examination,
        is_member_pref_admin_restrict_access_to_timeoff,
        is_member_pref_calendar_sync_enabled,
        can_member_pref_write_paid_leave_ledger,
        is_member_pref_display_shifts_from_other_teams,
        is_member_pref_email_notification_enabled,
        has_member_pref_access_to_all_locations,
        is_member_pref_include_owner_in_schedules,
        can_member_pref_manager_edit_employees,
        is_member_pref_mobile_notification_enabled,
        is_member_pref_planning_hide_alerts_by_default,
        is_member_pref_should_receive_mail_when_users_info_updated,
        is_member_pref_should_receive_planning_publication_reminder,
        is_member_pref_sms_notification_enabled
    FROM
        {{ ref('def_memberships') }}
)

SELECT *
FROM final