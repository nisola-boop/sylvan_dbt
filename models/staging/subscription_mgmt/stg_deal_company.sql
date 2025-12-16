with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_COMPANY') }}

),

renamed as (

    select
        deal_id,
        category,
        company_id,
        type_id,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
