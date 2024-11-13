{{ config(schema='stage') }}

with prepared_table as (
    select
    WEATHERVALUES[0]:main as WEATHER,
    YEAR(DATETIMEVALUE) as yearvalue,
    MONTH(DATETIMEVALUE) as monthvalue,
    DAY(DATETIMEVALUE) as dayvalue,
    HOUR(DATETIMEVALUE) as hourvalue
    from {{ ref('stage_weather') }}
),

part_table as (
   SELECT *,
         ROW_NUMBER() OVER (PARTITION BY yearvalue, monthvalue, dayvalue, hourvalue ORDER BY WEATHER) AS rn
   FROM prepared_table
)

SELECT *
FROM part_table
WHERE rn = 1

