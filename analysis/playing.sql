-- total revenue by city

SELECT
    l.city,
    sum(f.total_revenue) as revenue
    FROM fact_bookings f
    JOIN dim_listing l ON f.listing_id = l.listing_id
    GROUP BY l.city;