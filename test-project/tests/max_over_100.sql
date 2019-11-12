SELECT
    *
FROM
    {{ref('test_table')}}
WHERE
    amount >= 10