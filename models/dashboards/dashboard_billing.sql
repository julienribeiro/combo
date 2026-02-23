-- models/dashboards/dashboard_billing.sql

WITH monthly_billing AS (
    SELECT
        month_start_date,
        account_id,
        location_id,
        avg_billable_employees,
        avg_active_contracts,
        location_size,
        legacy_monthly_revenue,
        consumption_monthly_revenue,
        revenue_variation
    FROM
        {{ ref('bi_monthly_billing') }}
),

accounts AS (
    SELECT
        account_id,
        account_name,
        account_country,
        account_city
    FROM
        {{ ref('mart_accounts') }}
),

locations AS (
    SELECT
        location_id,
        location_name,
        location_city,
        location_zipcode,
        location_country
    FROM
        {{ ref('mart_locations') }}
),

final AS (
    SELECT
        monthly_billing.month_start_date,
        monthly_billing.account_id,
        accounts.account_name,
        accounts.account_country,
        accounts.account_city,
        monthly_billing.location_id,
        locations.location_name,
        locations.location_city,
        locations.location_zipcode,
        locations.location_country,
        monthly_billing.avg_billable_employees,
        monthly_billing.avg_active_contracts,
        monthly_billing.location_size,
        monthly_billing.legacy_monthly_revenue,
        monthly_billing.consumption_monthly_revenue,
        monthly_billing.revenue_variation,
        CASE
            WHEN monthly_billing.month_start_date < '2023-01-01'
                THEN monthly_billing.legacy_monthly_revenue
            ELSE monthly_billing.consumption_monthly_revenue
        END AS actual_monthly_revenue,
        CASE
            WHEN monthly_billing.month_start_date < '2023-01-01'
                THEN 'legacy'
            ELSE 'consumption'
        END AS pricing_model
    FROM
        monthly_billing
    LEFT JOIN
        accounts
        ON 
            monthly_billing.account_id = accounts.account_id
    LEFT JOIN
        locations
        ON 
            monthly_billing.location_id = locations.location_id
)

SELECT *
FROM final