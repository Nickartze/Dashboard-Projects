# UK Train Rides Study - [https://mavenanalytics.io/data-playground/uk-train-rides](File)

## Exploration

### Table Preview

SELECT *
FROM nick.railway
LIMIT 5;

### Total Tickets Sold

SELECT COUNT(*)
FROM nick.railway;

### Total Rides

SELECT COUNT(*)
FROM(
SELECT DISTINCT date_of_journey , departure_time -- , reason_for_delay
FROM nick.railway
)c
;

### Total Days in Operation

SELECT COUNT(DISTINCT date_of_journey)
FROM nick.railway;

### Daily Ride Offerings

SELECT COUNT(DISTINCT departure_time)
FROM nick.railway;

### Operating Period

SELECT
MIN(date_of_journey) first_date, MAX(date_of_journey) last_date,
MIN(departure_time) first_ride_of_day, MAX(departure_time) last_ride_of_day
FROM nick.railway;

### Revenue by Ticket Type and Class

SELECT ticket_class, ticket_type, COUNT(*) total_bought, SUM(price) total_revenue
FROM nick.railway
GROUP BY 1,2
ORDER BY 1;

### Revenue by Route

SELECT CONCAT_WS(' - ',departure_station, arrival_destination) routes, COUNT(*) total_bought, SUM(price) total_revenue
FROM nick.railway
GROUP BY 1
ORDER BY 2 DESC, 3 DESC;

### Payment Methods

SELECT payment_method, railcard, count(*) total, SUM(price) total_revenue
FROM nick.railway
GROUP BY 1,2
ORDER BY 1;

### Tickets Status (%)

SELECT *, ROUND((total_tickets/(SELECT COUNT(*) FROM nick.railway)) * 100,1) AS percent_breakdown
FROM
(
SELECT journey_status, COUNT(*) total_tickets
FROM nick.railway
GROUP BY 1
ORDER BY 1
) c
-- where reason_for_delay is not null
ORDER BY 3 DESC;

### Delayed Tickets Breakdown (%)

SELECT *, ROUND((total_tickets/(SELECT COUNT(*) FROM nick.railway WHERE journey_status != 'on time')) * 100,1) AS percent_breakdown
FROM(
SELECT journey_status, refund_request, COUNT(*) total_tickets
FROM nick.railway
WHERE journey_status != 'on time'
GROUP BY 1,2
ORDER BY 1
) c
ORDER BY 1 DESC;
