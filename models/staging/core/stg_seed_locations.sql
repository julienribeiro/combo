WITH final AS (
    SELECT
        id AS location_id,
        name AS location_name,
        account_id,
        created_at AS location_created_at,
        updated_at AS location_updated_at,
        address AS location_address,
        preferences AS location_preferences,
        city AS location_city,
        zipcode AS location_zipcode,
        collective_agreement_id AS location_collective_agreement_id,
        country AS location_country,
        partner_id AS location_partner_id,
        archived AS is_location_archived,
        default_break_duration AS location_default_break_duration,
        payroll_software_identifier AS location_payroll_software_id,
        enable_public_holiday_configuration AS location_enable_public_holiday_configuration,
        public_holiday_overtime_rate AS location_public_holiday_overtime_rate,
        public_holiday_paid_by_default AS location_public_holiday_paid_by_default,
        location_type,
        minimum_shift_duration_for_automatic_breaks_in_hours AS location_minimum_shift_duration_for_automatic_breaks_in_hours
    FROM
        {{ ref('locations') }}
)

SELECT *
FROM final
