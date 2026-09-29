{{
  config(
    materialized = 'incremental',
    unique_key = 'customer_id'
    )
}}


SELECT * ,
current_timestamp() as processed_at
FROM {{ source('Catu_Walmart_Project', 'customers') }}

{% if is_incremental() %}
   WHERE  updated_timestamp > (SELECT coalesce(MAX(updated_timestamp), '1900-01-01') FROM {{ this }})
{% endif %}