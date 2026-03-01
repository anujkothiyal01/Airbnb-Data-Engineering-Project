select *
from {{ ref('silver_hosts') }}
where response_rate < 0
   or response_rate > 100