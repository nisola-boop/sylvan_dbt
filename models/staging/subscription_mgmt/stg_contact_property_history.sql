with source as (

    select *
    from {{ source('subscription_mgmt', 'CONTACT_PROPERTY_HISTORY') }}

),

renamed as (

    select
        -- Core identifiers
        contact_id,
        
        -- Property metadata
        name as property_name,
        timestamp,
        value

    from source
)

select * from renamed
