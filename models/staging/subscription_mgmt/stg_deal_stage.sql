with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_STAGE') }}

),

renamed as (

    select
        deal_id,
        value,
        date_entered,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
