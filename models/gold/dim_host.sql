select
  host_id,
  host_name,
  is_superhost,
  response_rate
from {{ ref('silver_hosts') }}