SELECT 
    order_id,
    customer_id, 
    store_id,
    product_id,
    employee_id,
    total_amount,
    unit_price,
    quantity,
    line_amount
FROM {{ ref('obt_b') }}
