select *
from {{ ref('fact_bookings') }}
where total_revenue < 0