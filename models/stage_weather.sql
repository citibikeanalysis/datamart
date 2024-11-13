{{ config(schema='stage') }}


with stage_weather as (
    select TO_TIMESTAMP("time") as datetimevalue, 
    "weather" as weathervalues
    from {{ source('citibike_project', 'weather') }}
)

select * from stage_weather