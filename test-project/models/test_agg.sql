{{
    config(
        materialized='incremental'
    )
}}

SELECT 
    COUNT(*) AS qty,
    current_timestamp AS date_time
FROM
    {{ref('test_table')}}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    WHERE current_timestamp > (select max(date_time) from {{this}})
{% endif %}