view: finance {
  sql_table_name: `bq-general-364600.demo.finance` ;;
  view_label: "Finance"

  ########## Primary Key / Identifiers ##########

  # 合成プライマリキー（日付・地域・拠点・事業部等の組み合わせ）
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${target_month_raw} AS STRING), '_', COALESCE(${country}, ''), '_', COALESCE(${facility_name}, ''), '_', COALESCE(${business_unit}, '')) ;;
  }

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

  ########## Financial Amounts (Base Dimensions) ##########

  dimension: actual_revenue {
    label: "実績売上高 (Actual Revenue)"
    description: "SAP等で計上された売上の実績金額。"
    type: number
    value_format_name: usd
    sql: .Actual_Revenue ;;
  }.Actual_Revenue ;;
  }

  dimension: budget_revenue {
    label: "予算売上高 (Budget Revenue)"
    description: "計画・予算として設定された売上目標金額。"
    type: number
    value_format_name: usd
    sql: .Budget_Revenue ;;
  }.Budget_Revenue ;;
  }

  dimension: actual_cost {
    label: "実績売上原価 (Actual Cost)"
    description: "製造にかかる原材料費や工場人件費などの実績コスト。"
    type: number
    value_format_name: usd
    sql: .Actual_Cost ;;
  }.Actual_Cost ;;
  }

  dimension: budget_cost {
    label: "予算売上原価 (Budget Cost)"
    description: "計画・予算として設定されたコスト目標金額。"
    type: number
    value_format_name: usd
    sql: .Budget_Cost ;;
  }.Budget_Cost ;;
  }

  dimension: actual_profit {
    label: "実績営業利益 (Actual Profit)"
    description: "純売上高から売上原価および販売費等を控除した実績利益。"
    type: number
    value_format_name: usd
    sql: .Actual_Profit ;;
  }.Actual_Profit ;;
  }

  dimension: budget_profit {
    label: "予算営業利益 (Budget Profit)"
    description: "計画・予算として設定された利益目標金額。"
    type: number
    value_format_name: usd
    sql: .Budget_Profit ;;
  }.Budget_Profit ;;
  }

  ########## Measures ##########

  measure: count {
    label: "Record Count"
    type: count
    drill_fields: [detail*]
  }

  # Revenue Measures
  measure: total_actual_revenue {
    label: "Total Actual Revenue"
    type: sum
    value_format_name: usd
    sql: ${actual_revenue} ;;
    drill_fields: [detail*]
  }

  measure: total_budget_revenue {
    label: "Total Budget Revenue"
    type: sum
    value_format_name: usd
    sql: ${budget_revenue} ;;
    drill_fields: [detail*]
  }

  measure: revenue_variance {
    label: "Revenue Variance (Actual - Budget)"
    description: "Actual Revenue minus Budget Revenue"
    type: number
    value_format_name: usd
    sql: ${total_actual_revenue} - ${total_budget_revenue} ;;
  }

  measure: revenue_budget_achievement_rate {
    label: "Revenue Budget Achievement Rate"
    description: "Actual Revenue divided by Budget Revenue"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_revenue} / NULLIF(${total_budget_revenue}, 0) ;;
  }

  # Cost Measures
  measure: total_actual_cost {
    label: "Total Actual Cost"
    type: sum
    value_format_name: usd
    sql: ${actual_cost} ;;
    drill_fields: [detail*]
  }

  measure: total_budget_cost {
    label: "Total Budget Cost"
    type: sum
    value_format_name: usd
    sql: ${budget_cost} ;;
    drill_fields: [detail*]
  }

  measure: cost_variance {
    label: "Cost Variance (Actual - Budget)"
    description: "Actual Cost minus Budget Cost"
    type: number
    value_format_name: usd
    sql: ${total_actual_cost} - ${total_budget_cost} ;;
  }

  # Profit Measures
  measure: total_actual_profit {
    label: "Total Actual Profit"
    type: sum
    value_format_name: usd
    sql: ${actual_profit} ;;
    drill_fields: [detail*]
  }

  measure: total_budget_profit {
    label: "Total Budget Profit"
    type: sum
    value_format_name: usd
    sql: ${budget_profit} ;;
    drill_fields: [detail*]
  }

  measure: profit_variance {
    label: "Profit Variance (Actual - Budget)"
    description: "Actual Profit minus Budget Profit"
    type: number
    value_format_name: usd
    sql: ${total_actual_profit} - ${total_budget_profit} ;;
  }

  measure: profit_budget_achievement_rate {
    label: "Profit Budget Achievement Rate"
    description: "Actual Profit divided by Budget Profit"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_profit} / NULLIF(${total_budget_profit}, 0) ;;
  }

  set: detail {
    fields: [
      target_month_date,
      region,
      country,
      facility_name,
      business_unit,
      application_market,
      total_actual_revenue,
      total_budget_revenue,
      total_actual_profit
    ]
  }
}
