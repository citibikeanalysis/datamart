{{ config(schema='stage') }}

with stage_trips as (
    select 
        STARTTIME,
        BIKEID,
        TRIPDURATION, 
        START_STATION_LATITUDE as START_LAT, 
        START_STATION_LONGITUDE as START_LON,
        END_STATION_LATITUDE as END_LAT,
        END_STATION_LONGITUDE as END_LON
    from {{ source('citibike_project', 'citibike_csv_trips') }}
)

select * from stage_trips

