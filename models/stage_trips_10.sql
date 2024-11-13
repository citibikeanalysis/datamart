{{ config(schema='stage') }}


with stage_trips_10 as (
    select *,
        YEAR(STARTTIME) as yearvalue,
        MONTH(STARTTIME) as monthvalue,
        DAY(STARTTIME) as dayvalue,
        HOUR(STARTTIME) as hourvalue,
        haversine(START_LAT, START_LON, END_LAT, END_LON) as distance_travelled
    from {{ ref('stage_trips') }}

)

select * from stage_trips_10

