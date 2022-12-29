
with source as (

   select * from {{ source('stripe', 'payment') }}
),

staged as (

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

    from source
)

select * from staged

