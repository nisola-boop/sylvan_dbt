with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL_PIPELINE_STAGE') }}

),

renamed as (

    select
        stage_id,
        label,
        display_order,
        created_at,
        updated_at,
        write_permissions,
        pipeline_id,
        is_closed,
        probability,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced
    from source

)

select * from renamed
