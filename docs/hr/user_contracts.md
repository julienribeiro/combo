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