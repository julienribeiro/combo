{% docs user_contract_id %}
Unique identifier of the employee contract.
{% enddocs %}

{% docs location_id_contract %}
Foreign key to the location where the employee is contractually assigned. This is the location used for billing purposes, regardless of where shifts actually take place.
{% enddocs %}

{% docs contract_start_date %}
Start date of the employee contract.
{% enddocs %}

{% docs contract_end_date %}
End date of the employee contract. Null if the contract is open-ended (e.g. CDI).
{% enddocs %}

{% docs contract_type %}
Type of employment contract (CDI, CDD, seasonal, etc.).
{% enddocs %}

{% docs contract_time %}
Expected weekly working hours as defined in the contract.
{% enddocs %}

{% docs team_id %}
Foreign key to the team the contract is associated with.
{% enddocs %}

{% docs user_contract_original_contract_id %}
Reference to the original contract if this contract is a renewal or modification of a previous one.
{% enddocs %}

{% docs user_contract_end_trial_date %}
End date of the trial period for this contract.
{% enddocs %}

{% docs user_contract_invitation_sent_at %}
Timestamp when the contract invitation was sent to the employee.
{% enddocs %}

{% docs user_contract_invitation_accepted_at %}
Timestamp when the employee accepted the contract invitation.
{% enddocs %}

{% docs user_contract_start_at %}
Specific start time for the contract (if applicable).
{% enddocs %}

{% docs user_contract_end_reason %}
Reason for contract termination (resignation, dismissal, end of CDD, etc.).
{% enddocs %}

{% docs user_contract_birth_department_code %}
Department code where the employee was born (French administrative code).
{% enddocs %}

{% docs user_contract_object_type %}
Type of object/entity in the system (for internal data structure purposes).
{% enddocs %}

{% docs user_contract_working_days_in_week %}
Number of working days per week defined in the contract.
{% enddocs %}

{% docs is_user_contract_daily_worker %}
Whether this contract is for a daily worker (travailleur journalier).
{% enddocs %}

{% docs is_user_contract_hidden_in_register %}
Whether this contract should be hidden in the employee register.
{% enddocs %}

{% docs is_user_contract_virtual %}
Whether this is a virtual contract (not a real employment contract, used for testing or special purposes).
{% enddocs %}