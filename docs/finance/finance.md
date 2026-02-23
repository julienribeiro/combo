{% docs nb_billable_employees %}
Number of distinct employees (user_contract_id) with at least one
shift or rest planned during the week on this location.
Used for consumption-based pricing calculation.
Returns 0 if no activity during the week.
{% enddocs %}

{% docs nb_active_contracts %}
Number of distinct active contracts on this location during the week,
regardless of whether any shift or rest was planned.
A contract is active if its start date is before the end of the week
and its end date is null (CDI) or after the start of the week.
Used for legacy fixed pricing calculation.
Returns 0 if no active contract during the week.
{% enddocs %}

{% docs avg_billable_employees %}
Monthly floor average of weekly billable employees.
Used for consumption-based pricing and location size classification.
{% enddocs %}

{% docs avg_active_contracts %}
Monthly floor average of weekly active contracts.
Used for legacy fixed pricing calculation.
{% enddocs %}

{% docs location_size %}
Location size category based on avg_billable_employees.
Values: micro (0-5), petit (6-39), grand (40+).
{% enddocs %}

{% docs legacy_monthly_revenue %}
Monthly revenue under the legacy fixed pricing model,
calculated from avg_active_contracts.
{% enddocs %}

{% docs consumption_monthly_revenue %}
Monthly revenue under the consumption-based pricing model,
calculated from avg_billable_employees (base price + extra employees cost).
{% enddocs %}

{% docs revenue_variation %}
Difference between consumption and legacy revenue
(consumption_monthly_revenue - legacy_monthly_revenue).
Positive means the new model generates more revenue (expansion),
negative means less (contraction).
{% enddocs %}

{% docs actual_monthly_revenue %}
Revenue based on the applicable pricing model for the period.
Legacy pricing before 2023, consumption-based pricing from 2023 onwards.
{% enddocs %}

{% docs consumption_weekly_revenue %}
Weekly revenue under the consumption-based pricing model,
calculated from avg_billable_employees (base price + extra employees cost).
{% enddocs %}

{% docs legacy_weekly_revenue %}
Weekly revenue under the legacy fixed pricing model,
calculated from avg_active_contracts.
{% enddocs %}