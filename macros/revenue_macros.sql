{% macro calculate_total_revenue(amount, cleaning, service) %}
    coalesce({{ amount }},0)
  + coalesce({{ cleaning }},0)
  + coalesce({{ service }},0)
{% endmacro %}