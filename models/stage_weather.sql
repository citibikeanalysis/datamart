{{ config(schema='stage') }}


with stage_weather as (
    select TO_TIMESTAMP("time"), "weather"
    from SOURCE_DB.RAW.WEATHER
)

select * from stage_weather