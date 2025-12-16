with source as (

    select *
    from {{ source('subscription_mgmt', 'CONTACT') }}

),

renamed as (

    select
        -- Core identifiers
        id,
        is_deleted,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced,

        -- Basic contact profile
        property_email as email,
        property_firstname as first_name,
        property_lastname as last_name,
        property_phone as phone,
        property_mobilephone as mobile_phone,
        property_city as city,
        property_state as state,
        property_country as country,
        property_zip as zip,
        property_address as address,

        -- Company link
        property_associatedcompanyid as associated_company_id,

        -- Owner / assignment
        property_hubspot_owner_id as owner_id,
        property_hubspot_owner_assigneddate as owner_assigned_date,

        -- Lifecycle + role
        property_lifecyclestage as lifecycle_stage,
        property_contact_type as contact_type,
        property_contact_status as contact_status,
        property_hs_role as role,
        property_hs_sub_role as sub_role,
        property_hs_seniority as seniority,

        -- Timestamps
        property_createdate as created_at,
        property_lastmodifieddate as last_modified_date,

        -- Engagement summary
        property_notes_last_updated as notes_last_updated,
        property_notes_last_contacted as notes_last_contacted,
        property_num_notes as notes_count,
        property_num_contacted_notes as contacted_notes_count,
        property_hs_latest_meeting_activity as latest_meeting_activity,
        property_hs_sales_email_last_replied as sales_email_last_replied,

        -- Analytics summary
        property_hs_analytics_first_timestamp as analytics_first_timestamp,
        property_hs_analytics_num_visits as analytics_visits,
        property_hs_analytics_num_page_views as analytics_page_views,
        property_hs_analytics_source as analytics_source,

        -- Enrichment + source metadata
        property_hs_object_source as object_source,
        property_hs_object_source_label as object_source_label,
        property_hs_object_source_id as object_source_id,
        property_hs_object_source_detail_1 as object_source_detail_1,
        property_hs_object_source_user_id as object_source_user_id,
        property_hs_is_enriched as is_enriched,

        -- Lead / opportunity lifecycle
        property_hs_v_2_date_entered_lead as v2_date_entered_lead,
        property_hs_v_2_date_exited_lead as v2_date_exited_lead,
        property_hs_v_2_latest_time_in_lead as v2_latest_time_in_lead,
        property_hs_v_2_cumulative_time_in_lead as v2_cumulative_time_in_lead,
        property_hs_v_2_date_entered_opportunity as v2_date_entered_opportunity,
        property_hs_v_2_date_entered_customer as v2_date_entered_customer,

        -- Deal relevance
        property_first_deal_created_date as first_deal_created_date,
        property_closedate as close_date,
        property_total_revenue as total_revenue,
        property_days_to_close as days_to_close

    from source
)

select * from renamed
