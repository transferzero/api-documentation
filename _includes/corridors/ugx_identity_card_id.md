{% if include.recipient_type == 'business' %}
  {% capture ugx_identity_card_id %}"registration_number": "3081900101123411"{% endcapture %}
{% elsif include.recipient_type == 'individual' %}
  {% capture ugx_identity_card_id %}"identity_card_id": "3081900101123411"{% endcapture %}
{% endif %}
