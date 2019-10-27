{{
    config(
        materialized='incremental'
    )
}}

SELECT 
    customer_id, 
    1 AS new_column,
    current_timestamp AS date_time 
FROM 
    dev_rwalsh.customer_orders

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    WHERE customer_id > (select min(customer_id) from {{this}})
{% endif %}