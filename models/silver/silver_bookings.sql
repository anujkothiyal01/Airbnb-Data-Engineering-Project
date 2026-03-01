{{ config(
    materialized='incremental',
    unique_key='booking_id'
) }}

select
    b.booking_id,
    b.listing_id,
    b.booking_date,
    b.nights_booked,
    {{ calculate_total_revenue(
        'b.booking_amount',
        'b.cleaning_fee',
        'b.service_fee'
    ) }} as total_revenue,
    m.normalized_status as booking_status,
    b.created_at
from {{ source('bronze', 'bookings') }} b
left join {{ ref('booking_status_map') }} m
    on b.booking_status = m.raw_status

{% if is_incremental() %}
where b.created_at > (select max(created_at) from {{ this }})
{% endif %}