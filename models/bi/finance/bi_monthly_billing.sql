WITH weekly_metrics AS (
    SELECT
        week_start,
        account_id,
        location_id,
        nb_billable_employees,
        nb_active_contracts
    FROM
        {{ ref('bi_weekly_billing_metrics') }}
),

monthly_avg AS (
    SELECT
        DATE_TRUNC(week_start, MONTH) AS month_start,
        account_id,
        location_id,
        CAST(FLOOR(AVG(nb_billable_employees)) AS INT64) AS avg_billable_employees,
        CAST(FLOOR(AVG(nb_active_contracts)) AS INT64) AS avg_active_contracts
    FROM
        weekly_metrics
    GROUP BY 1, 2, 3
),

final AS (
    SELECT
        month_start,
        account_id,
        location_id,
        avg_billable_employees,
        avg_active_contracts,
        {{ location_size('avg_billable_employees') }} AS location_size,
        {{ legacy_fixed_pricing('avg_active_contracts') }} AS legacy_monthly_revenue,
        {{ consumption_pricing('avg_billable_employees') }} AS consumption_monthly_revenue
    FROM
        monthly_avg
)

SELECT
    *,
    ROUND(consumption_monthly_revenue - legacy_monthly_revenue, 2) AS revenue_variation
FROM
    final