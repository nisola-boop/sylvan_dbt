with source as (

    select *
    from {{ source('subscription_mgmt', 'CONTACT_COMPANY') }}

),

renamed as (

    select
        contact_id,
        company_id,
        category,
        type_id,
        _fivetran_synced as fivetran_synced

    from source
)

select * from renamed
