select
  listing_id,
  host_id,
  property_type,
  room_type,
  city,
  country,
  accommodates,
  price_per_night
from {{ ref('silver_listings') }}