
with payments as (

    select * from raw.stripe.payment
)

select 

    -- ids
      id as payment_id
    , orderid as order_id
    
    -- context
    , paymentmethod as payment_method
    , status

    -- amount stored in cents, convert it to dollars
    , amount / 100 as amount

    -- dates
    , created as created_date
    , _batched_at

from payments

