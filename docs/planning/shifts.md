{% docs shift_id %}
Unique identifier of the planned work shift.
{% enddocs %}

{% docs planification_type %}
Type of shift planification.
{% enddocs %}

{% docs shift_weekly_schedule_id %}
Foreign key to the weekly schedule this shift belongs to.
{% enddocs %}

{% docs shift_label_id %}
Foreign key to the label/category assigned to this shift (e.g., service type, department).
{% enddocs %}

{% docs shift_validator_id %}
Foreign key to the user who validated this shift.
{% enddocs %}

{% docs shift_planned_hours_last_edited_by_id %}
Foreign key to the user who last edited the planned hours for this shift.
{% enddocs %}

{% docs shift_validated_at %}
Timestamp when the shift was validated.
{% enddocs %}

{% docs shift_planned_hours_last_edited_at %}
Timestamp when the planned hours were last edited.
{% enddocs %}

{% docs shift_locked_at %}
Timestamp when the shift was locked (preventing further modifications).
{% enddocs %}

{% docs shift_break_duration %}
Planned break duration in minutes for this shift.
{% enddocs %}

{% docs shift_real_break_duration %}
Actual break duration in minutes taken during this shift.
{% enddocs %}

{% docs is_shift_did_not_show %}
Whether the employee did not show up for this shift (no-show).
{% enddocs %}