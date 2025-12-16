with source as (

    select *
    from {{ source('subscription_mgmt', 'LINE_ITEM_DEAL') }}

),

renamed as (

    select
        line_item_id,
        deal_id,
        category,
        type_id,
        _fivetran_synced as fivetran_synced

    from source
)

select * from renamed
