-- no orders should be in the future. 
-- all orders should be either on current date or in the past
select *
from {{ ref('fct_orders') }}
where current_date() - order_date < 0