WITH weekly_location AS (
    SELECT
        week_start,
        account_id,
        location_id,
        COUNT(DISTINCT user_contract_id) AS nb_billable_employees
    FROM
        {{ ref('mart_weekly_billable_employees') }}
    GROUP BY 1, 2, 3
),

accounts AS (
    SELECT 
        account_id,
        account_name
    FROM
        {{ ref('mart_accounts') }}
),

locations AS (
    SELECT 
        location_id,
        location_name
    FROM
        {{ ref('mart_locations') }} 
),

weekly_location_revenue AS (
    SELECT
        weekly_location.week_start,
        weekly_location.account_id,
        accounts.account_name,
        weekly_location.location_id,
        locations.location_name,
        weekly_location.nb_billable_employees,
        CASE
            WHEN weekly_location.nb_billable_employees <= 5 THEN 'micro'
            WHEN weekly_location.nb_billable_employees <= 39 THEN 'petit'
            ELSE 'grand'
        END AS location_size,
        {{ legacy_fixed_pricing('weekly_location.nb_billable_employees') }} AS legacy_revenue,
        {{ consumption_pricing('weekly_location.nb_billable_employees') }} AS consumption_revenue,
    FROM 
        weekly_location
    INNER JOIN 
        accounts
        ON 
            weekly_location.account_id = accounts.account_id
    INNER JOIN 
        locations
        ON 
            weekly_location.location_id = locations.location_id
),

final AS (
    SELECT  
        week_start,
        account_id,
        account_name,
        location_id,
        location_name,
        nb_billable_employees,
        location_size,
        legacy_revenue,
        consumption_revenue,
        consumption_revenue - legacy_revenue AS revenue_lift
    FROM
        weekly_location_revenue
)

SELECT *
FROM final
