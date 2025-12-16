with source as (

    select *
    from {{ source('subscription_mgmt', 'LINE_ITEM_PROPERTY_HISTORY') }}

),

renamed as (

    select
        line_item_id,
        name,
        timestamp,
        value,
        source_id,
        source,
        _fivetran_synced as fivetran_synced,
        _fivetran_start  as fivetran_start,
        _fivetran_end    as fivetran_end,
        _fivetran_active as fivetran_active

    from source
)

select * from renamed
