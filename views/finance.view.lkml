view: finance {
  sql_table_name: `bq-general-364600.demo.finance` ;;
  view_label: "Finance"

  ########## Dimensions ##########

  dimension_group: target_month {
    label: "Target Month"
    type: time
    timeframes: [raw, date, month, quarter, year]
    convert_tz: false
    datatype: date
    sql: ${TABLE}.Target_Month ;;
  }

  dimension: region {
    label: "Region"
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: country {
    label: "Country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: facility_type {
    label: "Facility Type"
    type: string
    sql: ${TABLE}.Facility_Type ;;
  }

  dimension: facility_name {
    label: "Facility Name"
    type: string
    sql: ${TABLE}.Facility_Name ;;
  }

  dimension: business_unit {
    label: "Business Unit"
    type: string
    sql: ${TABLE}.Business_Unit ;;
  }

  dimension: application_market {
    label: "Application Market"
    type: string
    sql: ${TABLE}.Application_Market ;;
  }

  dimension: actual_revenue {
    label: "Actual Revenue"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Actual_Revenue ;;
  }

  dimension: budget_revenue {
    label: "Budget Revenue"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Budget_Revenue ;;
  }

  dimension: actual_cost {
    label: "Actual Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Actual_Cost ;;
  }

  dimension: budget_cost {
    label: "Budget Cost"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Budget_Cost ;;
  }

  dimension: actual_profit {
    label: "Actual Profit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Actual_Profit ;;
  }

  dimension: budget_profit {
    label: "Budget Profit"
    type: number
    value_format_name: usd
    sql: ${TABLE}.Budget_Profit ;;
  }

  ########## Basic Measures ##########

  measure: count {
    label: "Count"
    type: count
    drill_fields: [detail*]
  }

  measure: total_actual_revenue {
    label: "Total Actual Revenue"
    type: sum
    value_format_name: usd
    sql: ${actual_revenue} ;;
  }

  measure: total_budget_revenue {
    label: "Total Budget Revenue"
    type: sum
    value_format_name: usd
    sql: ${budget_revenue} ;;
  }

  measure: total_actual_cost {
    label: "Total Actual Cost"
    type: sum
    value_format_name: usd
    sql: ${actual_cost} ;;
  }

  measure: total_budget_cost {
    label: "Total Budget Cost"
    type: sum
    value_format_name: usd
    sql: ${budget_cost} ;;
  }

  measure: total_actual_profit {
    label: "Total Actual Profit"
    type: sum
    value_format_name: usd
    sql: ${actual_profit} ;;
  }

  measure: total_budget_profit {
    label: "Total Budget Profit"
    type: sum
    value_format_name: usd
    sql: ${budget_profit} ;;
  }

  set: detail {
    fields: [
      target_month_date,
      region,
      country,
      facility_name,
      business_unit,
      application_market
    ]
  }
}
