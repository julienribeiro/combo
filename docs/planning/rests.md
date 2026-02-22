{% docs rest_id %}
Unique identifier of the planned rest period.
{% enddocs %}

{% docs rest_type %}
Type of rest period (weekly_rest, compensatory_rest, formation, etc.).
{% enddocs %}

{% docs rest_timeoff_id %}
Foreign key to the timeoff request if this rest is associated with a time-off request.
{% enddocs %}

{% docs rest_original_shift_id %}
Foreign key to the original shift if this rest replaces a previously planned shift.
{% enddocs %}