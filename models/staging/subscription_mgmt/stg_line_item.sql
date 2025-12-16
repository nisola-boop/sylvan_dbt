with source as (

    select *
    from {{ source('subscription_mgmt', 'LINE_ITEM') }}

),

renamed as (

    select
        -- Core identifiers
        id,
        product_id,
        _fivetran_deleted as fivetran_deleted,
        _fivetran_synced as fivetran_synced,

        -- Pricing amounts
        property_amount as amount,
        property_price as price,
        property_quantity as quantity,
        property_hs_pre_discount_amount as pre_discount_amount,
        property_hs_total_discount as total_discount,
        property_hs_discount_percentage as discount_percentage,
        property_hs_post_tax_amount as post_tax_amount,

        -- Revenue metrics
        property_hs_arr as arr,
        property_hs_mrr as mrr,
        property_hs_acv as acv,
        property_hs_tcv as tcv,
        property_hs_margin as margin,
        property_hs_margin_arr as margin_arr,
        property_hs_margin_mrr as margin_mrr,
        property_hs_margin_acv as margin_acv,
        property_hs_margin_tcv as margin_tcv,

        -- Billing cadence & terms
        property_hs_recurring_billing_start_date as recurring_billing_start_date,
        property_hs_recurring_billing_end_date as recurring_billing_end_date,
        property_hs_recurring_billing_number_of_payments as recurring_billing_payments,
        property_hs_recurring_billing_terms as recurring_billing_terms,
        property_hs_term_in_months as term_months,
        property_recurringbillingfrequency as recurring_billing_frequency,
        property_hs_recurring_billing_period as recurring_billing_period,
        property_hs_billing_start_delay_type as billing_start_delay_type,

        -- Pricing logic
        property_hs_pricing_model as pricing_model,
        property_hs_product_type as product_type,
        property_hs_effective_unit_price as effective_unit_price,

        -- Proration flags
        property_hs_has_prorating_leading as has_prorating_leading,
        property_hs_has_prorating_trailing as has_prorating_trailing,

        -- Product + description
        property_name as name,
        property_description as description,

        -- Recipients + workflows
        property_recipients as recipients,
        property_workflows as workflows,

        -- Timestamps
        property_createdate as created_at,
        property_hs_lastmodifieddate as last_modified_date,

        -- HubSpot object metadata
        property_hs_object_id as object_id,
        property_hs_object_source as object_source,
        property_hs_object_source_id as object_source_id,
        property_hs_object_source_label as object_source_label,
        property_hs_object_source_user_id as object_source_user_id,
        property_hs_line_item_currency_code as currency_code

    from source
)

select * from renamed
