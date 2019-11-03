SELECT 
    COUNT(*) AS qty,
    current_timestamp AS date_time
FROM
    {{ref('test_table')}}