# UK Train Rides Study

[UK Train Rides Dataset – Maven Analytics](https://mavenanalytics.io/data-playground/uk-train-rides)

---

## Exploration

### Table Preview

```sql
SELECT *
FROM nick.railway
LIMIT 5;
```

---

### Total Tickets Sold

```sql
SELECT COUNT(*)
FROM nick.railway;
```

---

### Total Rides

```sql
SELECT COUNT(*)
FROM (
    SELECT DISTINCT date_of_journey, departure_time
    FROM nick.railway
) c;
```

---

### Total Days in Operation

```sql
SELECT COUNT(DISTINCT date_of_journey)
FROM nick.railway;
```

---

### Daily Ride Offerings

```sql
SELECT COUNT(DISTINCT departure_time)
FROM nick.railway;
```

---

### Operating Period

```sql
SELECT
    MIN(date_of_journey) AS first_date,
    MAX(date_of_journey) AS last_date,
    MIN(departure_time) AS first_ride_of_day,
    MAX(departure_time) AS last_ride_of_day
FROM nick.railway;
```

---

### Revenue by Ticket Type and Class

```sql
SELECT
    ticket_class,
    ticket_type,
    COUNT(*) AS total_bought,
    SUM(price) AS total_revenue
FROM nick.railway
GROUP BY 1, 2
ORDER BY 1;
```

---

### Revenue by Route

```sql
SELECT
    CONCAT_WS(' - ', departure_station, arrival_destination) AS route,
    COUNT(*) AS total_bought,
    SUM(price) AS total_revenue
FROM nick.railway
GROUP BY 1
ORDER BY 2 DESC, 3 DESC;
```

---

### Payment Methods

```sql
SELECT
    payment_method,
    railcard,
    COUNT(*) AS total,
    SUM(price) AS total_revenue
FROM nick.railway
GROUP BY 1, 2
ORDER BY 1;
```

---

### Ticket Status Breakdown (%)

```sql
SELECT *,
       ROUND(
           (total_tickets / (SELECT COUNT(*) FROM nick.railway)) * 100,
           1
       ) AS percent_breakdown
FROM (
    SELECT
        journey_status,
        COUNT(*) AS total_tickets
    FROM nick.railway
    GROUP BY 1
) c
ORDER BY percent_breakdown DESC;
```

---

### Delayed Tickets Breakdown (%)

```sql
SELECT *,
       ROUND(
           (total_tickets / (
               SELECT COUNT(*)
               FROM nick.railway
               WHERE journey_status != 'on time'
           )) * 100,
           1
       ) AS percent_breakdown
FROM (
    SELECT
        journey_status,
        refund_request,
        COUNT(*) AS total_tickets
    FROM nick.railway
    WHERE journey_status != 'on time'
    GROUP BY 1, 2
) c
ORDER BY percent_breakdown DESC;
```
