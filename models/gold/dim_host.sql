select
  host_id,
  host_name,
  is_superhost,
  response_rate,
  dbt_valid_from,
  dbt_valid_to
from {{ ref('hosts_snapshot') }}