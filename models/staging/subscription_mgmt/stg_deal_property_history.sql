with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_PROPERTY_HISTORY') }}

),

renamed as (

    select
        deal_id,
        name,
        timestamp,
        value,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
