WITH final AS (
    SELECT
        id AS location_id,
        partner_id,
        collective_agreement_id AS location_collective_agreement_id,
        payroll_software_identifier AS location_payroll_software_id,
        account_id,
        name AS location_name,
        created_at AS location_created_at,
        updated_at AS location_updated_at,
        address AS location_address,
        zipcode AS location_zipcode,
        city AS location_city,
        country AS location_country,
        default_break_duration AS location_default_break_duration,
        public_holiday_overtime_rate AS location_public_holiday_overtime_rate,
        public_holiday_paid_by_default AS location_public_holiday_paid_by_default,
        location_type,
        minimum_shift_duration_for_automatic_breaks_in_hours AS location_minimum_shift_duration_for_automatic_breaks_in_hours,
        JSON_VALUE(preferences, '$.default_meal_type') AS location_pref_default_meal_type,
        CAST(JSON_VALUE(preferences, '$.productivity_objective') AS FLOAT64) AS location_pref_productivity_objective,
        CAST(JSON_VALUE(preferences, '$.wage_ratio_objective') AS INT64) AS location_pref_wage_ratio_objective,
        CAST(JSON_VALUE(preferences, '$.workable_days_in_week') AS INT64) AS location_pref_workable_days_in_week,
        CAST(JSON_VALUE(preferences, '$.starting_month_for_annualisation') AS INT64) AS location_pref_starting_month_for_annualisation,
        {{ normalize_booleen('archived') }} AS is_location_archived,
        COALESCE(CAST(enable_public_holiday_configuration AS BOOL), FALSE) AS is_location_public_holiday_configuration_enabled,
        COALESCE(CAST(public_holiday_paid_by_default AS BOOL), FALSE) AS is_location_public_holiday_paid_by_default,
        COALESCE(CAST(JSON_VALUE(preferences, '$.allow_negative_compensatory_counter') AS BOOL), FALSE) AS has_location_pref_negative_compensatory_counter,
        COALESCE(CAST(JSON_VALUE(preferences, '$.annualisation_enabled') AS BOOL), FALSE) AS is_location_pref_annualisation_enabled,
        COALESCE(CAST(JSON_VALUE(preferences, '$.annualisation_use_calendar_year') AS BOOL),FALSE) AS is_location_pref_annualisation_using_calendar_year,
        COALESCE(CAST(JSON_VALUE(preferences, '$.modulation_enabled') AS BOOL), FALSE) AS is_location_pref_modulation_enabled,
        COALESCE(CAST(JSON_VALUE(preferences, '$.skip_percentage_for_compensatory_deposit') AS BOOL), FALSE) AS is_location_pref_skip_percentage_for_compensatory_deposit,
        COALESCE(CAST(JSON_VALUE(preferences, '$.uses_timeclock') AS BOOL), FALSE) AS is_location_pref_using_timeclock
    FROM
        {{ ref('locations') }}
)

SELECT *
FROM final
