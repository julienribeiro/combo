WITH weekly_employees AS (
    SELECT
        week_start_date,
        account_id,
        location_id,
        COUNT(DISTINCT user_contract_id) AS nb_billable_employees
    FROM
        {{ ref('mart_weekly_billable_employees') }}
    GROUP BY 1, 2, 3
),

user_contracts AS (
    SELECT
        user_contract_id,
        location_id,
        user_contract_start_date,
        user_contract_end_date
    FROM
        {{ ref('mart_user_contracts') }}
),

week_location_spine AS (
    SELECT 
        week_start_date,
        account_id,
        location_id
    FROM
        {{ ref('def_week_location_spine') }}
),

weekly_active_contracts AS (
    SELECT
        week_location_spine.week_start_date,
        week_location_spine.location_id,
        COUNT(DISTINCT user_contracts.user_contract_id) AS nb_active_contracts
    FROM
        week_location_spine
    INNER JOIN
        user_contracts
        ON 
            week_location_spine.location_id = user_contracts.location_id
    WHERE
        DATE(user_contracts.user_contract_start_date) <= DATE_ADD(week_location_spine.week_start_date, INTERVAL 6 DAY)
        AND (user_contracts.user_contract_end_date IS NULL OR DATE(user_contracts.user_contract_end_date) >= week_location_spine.week_start_date)
    GROUP BY 1, 2
),

final AS (
    SELECT
        week_location_spine.week_start_date,
        week_location_spine.account_id,
        week_location_spine.location_id,
        COALESCE(weekly_employees.nb_billable_employees, 0) AS nb_billable_employees,
        COALESCE(weekly_active_contracts.nb_active_contracts, 0) AS nb_active_contracts
    FROM 
        week_location_spine
    LEFT JOIN 
        weekly_employees
        ON 
            week_location_spine.week_start_date = weekly_employees.week_start_date
            AND week_location_spine.account_id = weekly_employees.account_id
            AND week_location_spine.location_id = weekly_employees.location_id
    LEFT JOIN
        weekly_active_contracts
        ON
            week_location_spine.week_start_date = weekly_active_contracts.week_start_date
            AND week_location_spine.location_id = weekly_active_contracts.location_id
)

SELECT *
FROM final
