{{
    config(
        materialized='incremental'
    )
}}

SELECT 
    customer_id, 
    current_timestamp AS date_time 
FROM 
    raw.postgressource.payment

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    WHERE customer_id > (select min(customer_id) from {{this}})
{% endif %}