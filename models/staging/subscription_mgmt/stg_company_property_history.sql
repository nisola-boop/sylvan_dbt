with source as (

    select *
    from {{ source('subscription_mgmt', 'COMPANY_PROPERTY_HISTORY') }}

),

renamed as (

    select
        company_id,
        name as property_name,
        timestamp as property_timestamp,
        value as property_value,
        source_id,
        source,
        _fivetran_synced as fivetran_synced,
        _fivetran_start as fivetran_start,
        _fivetran_end as fivetran_end,
        _fivetran_active as fivetran_active

    from source
)

select *
from renamed
