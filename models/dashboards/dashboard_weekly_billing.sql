WITH weekly_billing AS (
    SELECT
        week_start_date,
        account_id,
        location_id,
        nb_billable_employees,
        nb_active_contracts,
        consumption_weekly_revenue,
        legacy_weekly_revenue
    FROM
        {{ ref('bi_weekly_billing') }}
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
        weekly_billing.week_start_date,
        weekly_billing.account_id,
        accounts.account_name,
        accounts.account_country,
        accounts.account_city,
        weekly_billing.location_id,
        locations.location_name,
        locations.location_city,
        locations.location_zipcode,
        locations.location_country,
        weekly_billing.nb_billable_employees,
        weekly_billing.nb_active_contracts,
        {{ location_size('weekly_billing.nb_billable_employees') }} AS location_size,
        weekly_billing.legacy_weekly_revenue,
        weekly_billing.consumption_weekly_revenue,
        ROUND(
            weekly_billing.consumption_weekly_revenue - weekly_billing.legacy_weekly_revenue,
            2
        ) AS weekly_revenue_variation,
        CASE
            WHEN weekly_billing.week_start_date < '2023-01-01'
                THEN weekly_billing.legacy_weekly_revenue
            ELSE weekly_billing.consumption_weekly_revenue
        END AS actual_weekly_revenue,
        CASE
            WHEN weekly_billing.week_start_date < '2023-01-01'
                THEN 'legacy'
            ELSE 'consumption'
        END AS pricing_model,
        CASE
            WHEN ROUND(weekly_billing.consumption_weekly_revenue - weekly_billing.legacy_weekly_revenue, 2) > 0 THEN 'expansion'
            WHEN ROUND(weekly_billing.consumption_weekly_revenue - weekly_billing.legacy_weekly_revenue, 2) < 0 THEN 'contraction'
            ELSE 'neutral'
        END AS revenue_lift_segment
    FROM
        weekly_billing
    LEFT JOIN
        accounts
        ON
            weekly_billing.account_id = accounts.account_id
    LEFT JOIN
        locations
        ON
            weekly_billing.location_id = locations.location_id
)

SELECT *
FROM final