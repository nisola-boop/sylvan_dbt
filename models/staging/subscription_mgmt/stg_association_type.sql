with source as (

    select *
    from {{ source('subscription_mgmt', 'ASSOCIATION_TYPE') }}

),

renamed as (

    select
        -- Core identifiers
        id,
        category,
        name,
        label,

        -- Object type relationships
        from_object_type,
        to_object_type,

        -- Fivetran metadata
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced  as fivetran_synced

    from source
)

select * from renamed
