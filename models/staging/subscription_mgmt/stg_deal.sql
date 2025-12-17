with source as (

    select *
    from {{ source('subscription_mgmt', 'DEAL') }}

    -- 🔴 THIS IS THE FIX
    -- Exclude HubSpot deals that were deleted and flagged by Fivetran
    where coalesce(_fivetran_deleted, false) = false

),

renamed as (

    select
        -- Core identifiers
        deal_id,
        portal_id,
        is_deleted,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced,

        -- Deal pipeline + stage
        deal_pipeline_id as pipeline_id,
        deal_pipeline_stage_id as stage_id,
        property_dealname as deal_name,

        -- Deal amount fields
        property_amount as amount,
        property_amount_in_home_currency as amount_home_currency,
        property_hs_projected_amount as projected_amount,
        property_hs_projected_amount_in_home_currency as projected_amount_home_currency,
        property_hs_open_amount_in_home_currency as open_amount_home_currency,
        property_hs_closed_amount as closed_amount,
        property_hs_closed_amount_in_home_currency as closed_amount_home_currency,
        property_hs_tcv as tcv,
        property_hs_mrr as mrr,
        property_hs_arr as arr,
        property_hs_acv as acv,

        -- Contract + billing details
        property_contract_term_months_ as contract_term_months,
        property_contract_start_date as contract_start_date,
        property_contract_end_date as contract_end_date,
        property_payment_terms as payment_terms,
        property_billing_frequency as billing_frequency,
        property_booking_date as booking_date,

        -- Usage data
        property_usage_data as usage_data,

        -- Renewal details
        property_renewal_date as renewal_date,

        -- Key timestamps
        property_hs_createdate as created_at,
        property_hs_lastmodifieddate as last_modified_date,
        property_closedate as close_date,
        property_closed_won_date as closed_won_date,
        property_hs_closed_won_date as hs_closed_won_date,

        -- Notes + communication
        property_notes_last_updated as notes_last_updated,
        property_notes_last_contacted as notes_last_contacted,
        property_notes_next_activity_date as notes_next_activity_date,
        property_hs_notes_next_activity_type as notes_next_activity_type,
        property_hs_next_meeting_start_time as next_meeting_start_time,
        property_hs_next_meeting_name as next_meeting_name,
        property_hs_next_meeting_id as next_meeting_id,
        property_hs_latest_meeting_activity as latest_meeting_activity,

        -- Order form and subscription metadata
        property_order_form_url as order_form_url,
        property_order_form_signed_ as order_form_signed,
        property_free_trial_ as free_trial_flag,
        property_free_trial_duration as free_trial_duration,
        property_free_trial_placement as free_trial_placement,

        -- Loss reasons
        property_main_reason_for_loss as loss_reason_primary,
        property_closed_lost_reason as loss_reason_detailed,
        property_closed_lost_date as closed_lost_date,
        property_loss_stage as loss_stage,
        property_date_if_future_contact as date_if_future_contact,

        -- HubSpot metadata
        property_hs_primary_associated_company as primary_associated_company,
        property_num_notes as notes_count,
        property_num_associated_contacts as associated_contacts_count,
        property_hs_num_associated_active_deal_registrations as associated_active_registrations,
        property_hs_num_of_associated_line_items as associated_line_items_count,
        property_hs_num_associated_deal_splits as associated_splits_count,
        property_hs_is_deal_split as is_deal_split

    from source
)

select *
from renamed
