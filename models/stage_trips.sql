{{ config(schema='stage') }}

with stage_trips as (
    select 
        TRIPDURATION, 
        START_STATION_LATITUDE as START_LAT, 
        START_STATION_LONGITUDE as START_LON,
        END_STATION_LATITUDE as END_LAT,
        END_STATION_LONGITUDE as END_LON
    from SOURCE_DB.RAW.CITIBIKE_CSV_TRIPS
)

select * from stage_trips

