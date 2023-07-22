UPDATE address
SET longitude = 0,
    latitude  = 0
WHERE longitude IS NULL
   OR latitude IS NULL;
