with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_DEAL') }}

),

renamed as (

    select
        from_deal_id,
        category,
        to_deal_id,
        type_id,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
