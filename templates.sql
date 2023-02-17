-- time_bucket_gapfill:
SELECT
  time_bucket_gapfill('1 minute', time) as bucket,
  locf(avg(d009))
FROM llab_011
WHERE d009 IS NOT NULL
AND time > now() - INTERVAL '2 day' AND time < now()
GROUP BY bucket
ORDER BY bucket;

--
SELECT
  time_bucket_gapfill('1 day', time),
  locf(v001, treat_null_as_missing:=true)
FROM llab_004
WHERE time > now() - INTERVAL '15 day' AND time < now()
ORDER BY time
;

--
SELECT
	time,
	v001
FROM llab_004
WHERE v001 IS NOT NULL
AND time BETWEEN '2021-10-21 07:49:56.906873'::timestamp AND '2021-10-23 08:50:05.082003'::timestamp
ORDER BY time
;

SELECT
  time_bucket_gapfill('1 minute', time) as bucket,
  locf(avg(d009))
FROM llab_011
WHERE d009 IS NOT NULL
AND time > now() - INTERVAL '2 day' AND time < now()
SELECT
  time_bucket_gapfill('1 day', time) as bucket,
  locf(v001, treat_null_as_missing:=true)
FROM llab_004
INNER JOIN 
GROUP BY bucket
ORDER BY bucket;