{{ config(schema='mart') }}

with prepared_table as (
    select STARTTIME,
        BIKEID,
        TRIPDURATION,
        START_LAT,
        START_LON,
        END_LAT,
        END_LON,
        trips.YEARVALUE,
        trips.MONTHVALUE,
        trips.DAYVALUE,
        trips.HOURVALUE,
        DISTANCE_TRAVELLED,
        WEATHER,   
        dayname(STARTTIME) as day_of_week
    from {{ ref('stage_trips_10') }} trips
    join {{ ref('stage_weather_10')}} weather

    on trips.yearvalue = weather.yearvalue 
        AND trips.monthvalue = weather.monthvalue
        AND trips.dayvalue = weather.dayvalue
        AND trips.hourvalue = weather.hourvalue
)

select * from prepared_table