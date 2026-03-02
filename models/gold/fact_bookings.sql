select
  b.booking_id,
  b.booking_date as date_id,
  b.listing_id,
  l.host_id,
  b.total_revenue,
  b.nights_booked,
  h.is_superhost
from {{ ref('silver_bookings') }} b
join {{ ref('silver_listings') }} l
  on b.listing_id = l.listing_id
join {{ ref('silver_hosts') }} h
  on l.host_id = h.host_id