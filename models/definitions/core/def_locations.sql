WITH final AS (
    SELECT
        location_id,
        location_partner_id,
        location_collective_agreement_id,
        location_payroll_software_id,
        account_id,
        location_name,
        location_created_at,
        location_updated_at,
        location_address,
        location_zipcode,
        location_city,
        location_country,
        location_default_break_duration,
        location_public_holiday_overtime_rate,
        location_public_holiday_paid_by_default,
        location_type,
        location_minimum_shift_duration_for_automatic_breaks_in_hours,
        location_pref_default_meal_type,
        location_pref_productivity_objective,
        location_pref_wage_ratio_objective,
        location_pref_workable_days_in_week,
        location_pref_starting_month_for_annualisation,
        is_location_archived,
        is_location_public_holiday_configuration_enabled,
        is_location_public_holiday_paid_by_default,
        has_location_pref_negative_compensatory_counter,
        is_location_pref_annualisation_enabled,
        is_location_pref_annualisation_using_calendar_year,
        is_location_pref_modulation_enabled,
        is_location_pref_skip_percentage_for_compensatory_deposit,
        is_location_pref_using_timeclock
    FROM
        {{ ref('stg_seed_locations') }}
)

SELECT *
FROM final
