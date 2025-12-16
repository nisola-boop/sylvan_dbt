with source as (

    select *
    from {{ source('subscription_mgmt', 'COMPANY') }}

),

renamed as (

    select
        -- Core identifiers
        id,
        portal_id,
        is_deleted,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced,

        -- Counts
        property_num_associated_contacts as associated_contacts_count,
        property_num_associated_deals as associated_deals_count,

        -- Company profile
        property_name as name,
        property_description as description,
        property_website as website,
        property_industry as industry,
        property_hs_industry_group as industry_group,
        property_city as city,
        property_state as state,
        property_country as country,
        property_zip as zip,
        property_address as address,
        property_domain as domain,
        property_founded_year as founded_year,
        property_is_public as is_public,
        property_numberofemployees as employee_count,
        property_hs_employee_range as employee_range,
        property_hs_revenue_range as revenue_range,
        property_total_money_raised as total_money_raised,
        property_phone as phone,

        -- Technology metadata
        property_web_technologies as web_technologies,
        property_communication_tools as communication_tools,
        property_operational_tools as operational_tools,
        property_bi_tools as bi_tools,
        property_data_warehouse as data_warehouse,

        -- Social
        property_hs_logo_url as logo_url,
        property_hs_linkedin_handle as linkedin_handle,
        property_linkedin_company_page as linkedin_company_page,
        property_facebook_company_page as facebook_company_page,
        property_twitterhandle as twitter_handle,

        -- Lifecycle stage
        property_lifecyclestage as lifecycle_stage,

        -- Geography codes
        property_hs_country_code as country_code,
        property_hs_state_code as state_code,

        -- Timestamps
        property_createdate as created_at,
        property_hs_lastmodifieddate as last_modified_date,
        property_first_contact_createdate as first_contact_created_date,
        property_first_deal_created_date as first_deal_created_date

    from source
)

select * from renamed
