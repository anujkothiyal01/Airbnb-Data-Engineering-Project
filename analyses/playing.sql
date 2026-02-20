SELECT * FROM {{ source('staging', 'bookings') }}

SELECT * FROM {{ ref("bronze_bookings") }}
WHERE NIGHTS_BOOKED > 1

-- --------------------------------------
{% set flag = 1 %}

SELECT * FROM {{ ref("bronze_bookings") }}
{% if flag == 1 %}
    WHERE NIGHTS_BOOKED > 1
{% else %}
    WHERE NIGHTS_BOOKED = 1
{% endif %}

-- --------------------------------------

{% set cols = ['NIGHTS_BOOKED', 'BOOKING_ID', 'BOOKING_AMOUNT'] %}

SELECT
{% for col in cols %}
    {{ col }}
    {% if not loop.last %}, {% endif %}
{% endfor %}
FROM {{ ref('bronze_bookings') }}

