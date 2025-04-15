{% if include.recipient_type == 'business' %}
  {% capture recipient_name %}"name": "Company name"{% endcapture %}
{% elsif include.recipient_type == 'individual' %}
  {% capture recipient_name %}"first_name": "First",
  "middle_name": "Middle", // optional
  "last_name": "Last"{% endcapture %}
{% elsif include.recipient_type == 'individual_without_middle_name' %}
{% capture recipient_name %}"first_name": "First",
  "last_name": "Last"{% endcapture %}
{% endif %}
