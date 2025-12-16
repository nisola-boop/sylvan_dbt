with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_PIPELINE') }}

),

renamed as (

    select
        pipeline_id,
        label,
        display_order,
        created_at,
        updated_at,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
