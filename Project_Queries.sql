/* Query 1 - 1st Insight; Which media type is used the most by artists? */

SELECT
s1.media_type,
COUNT(*) artists_using_mediatype
FROM (SELECT DISTINCT
  ar.name artist,
  m.name media_type
FROM Album al
JOIN Track t
  ON t.albumid = al.albumid
JOIN Artist ar
  ON ar.artistid = al.artistid
JOIN MediaType m
  ON t.mediatypeid = m.mediatypeid
ORDER BY 1) s1
GROUP BY 1

/* Query 2 - 2nd Insight; How many times have customers needed assistance by a Sales Support Agent? Which Sales Support Agent has the most assistances? */

SELECT
  s1.rep_last agent_name,
  COUNT(*) assistance_events
FROM (SELECT
  c.customerid customerid,
  i.total amt_spent,
  e.lastname rep_last
FROM customer c
JOIN invoice i
  ON c.customerid = i.customerid
JOIN employee e
  ON e.employeeid = c.supportrepid) s1
GROUP BY 1

/* Query 3 - 3rd Insight; What is the average revenue earned per TV Show? */

SELECT
  g.name genre,
  AVG(i.total) avg_revenue
FROM track t
JOIN genre g
  ON g.genreid = t.genreid
JOIN InvoiceLine il
  ON t.trackid = il.trackid
JOIN invoice i
  ON il.invoiceid = i.invoiceid
WHERE genre = 'TV Shows'

/* 3rd Insight Continued; This Query provides the data set for the 3rd visualization. It provides the individual TV Show revenues as opposed to only the average. */

SELECT
  g.name genre,
  i.total revenue
FROM track t
JOIN genre g
  ON g.genreid = t.genreid
JOIN InvoiceLine il
  ON t.trackid = il.trackid
JOIN invoice i
  ON il.invoiceid = i.invoiceid
WHERE genre = 'TV Shows'

/* Query 4 - 4th Insight; What is the total revenue and the total number of transactions for each country? From this, what is the average spending per transaction for each country? What can we pull from this information? */

SELECT
  c.country,
  SUM(i.total) total_revenue,
  COUNT(i.total) num_transactions,
  AVG(i.total) avg_revenue_per_trans
FROM invoice i
JOIN customer c
ON i.customerid = c.customerid
GROUP BY 1
ORDER BY 3 DESC
