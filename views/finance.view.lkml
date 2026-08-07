view: finance {
  sql_table_name: `bq-general-364600.demo.finance` ;;
  view_label: "Finance"

  ########## Attribute Dimensions ##########

  dimension_group: target_month {
    label: "対象年月"
    description: "損益および予算実績を評価する対象年月。"
    type: time
    timeframes: [raw, date, month, quarter, year]
    convert_tz: false
    datatype: date
    sql: ${TABLE}.Target_Month ;;
  }

  dimension: region {
    label: "地域区分"
    description: "事業部・拠点が所属する地域セグメント。"
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: country {
    label: "国名"
    description: "事業を展開する対象国名。"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: facility_type {
    label: "拠点種別"
    description: "工場、倉庫、営業所などの拠点分類。"
    type: string
    sql: ${TABLE}.Facility_Type ;;
  }

  dimension: facility_name {
    label: "拠点名称"
    description: "具体的な事業拠点または工場の名称。"
    type: string
    sql: ${TABLE}.Facility_Name ;;
  }

  dimension: business_unit {
    label: "事業部"
    description: "担当するビジネスユニット・事業部門。"
    type: string
    sql: ${TABLE}.Business_Unit ;;
  }

  dimension: application_market {
    label: "適用市場"
    description: "製品・サービスが提供されるターゲット市場。"
    type: string
    sql: ${TABLE}.Application_Market ;;
  }

  ########## Base & Calculated Measures (O列: 今後の正式名称に準拠) ##########

  measure: count {
    label: "レコード件数"
    description: "財務データの登録レコード総件数。"
    type: count
    drill_fields: [detail*]
  }

  measure: total_actual_revenue {
    label: "総売上高 (実績)"
    description: "控除を行っていない売上の合計額（実績）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Revenue ;;
    drill_fields: [detail*]
  }

  measure: total_budget_revenue {
    label: "総売上高 (予算)"
    description: "控除を行っていない売上の合計額（予算）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Revenue ;;
    drill_fields: [detail*]
  }

  measure: total_actual_cost {
    label: "売上原価 (実績)"
    description: "原材料費や工場人件費などの売上原価（実績）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Cost ;;
    drill_fields: [detail*]
  }

  measure: total_budget_cost {
    label: "売上原価 (予算)"
    description: "原材料費や工場人件費などの売上原価（予算）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Cost ;;
    drill_fields: [detail*]
  }

  measure: total_actual_profit {
    label: "営業利益 (実績)"
    description: "売上高から売上原価等を差し引いた営業利益（実績）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Profit ;;
    drill_fields: [detail*]
  }

  measure: total_budget_profit {
    label: "営業利益 (予算)"
    description: "売上高から売上原価等を差し引いた営業利益（予算）。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Profit ;;
    drill_fields: [detail*]
  }

  measure: revenue_variance {
    label: "売上差額 (予算差)"
    description: "実績売上高 − 予算売上高"
    type: number
    value_format_name: usd
    sql: ${total_actual_revenue} - ${total_budget_revenue} ;;
    drill_fields: [detail*]
  }

  measure: revenue_budget_achievement_rate {
    label: "売上予算比 (予算比)"
    description: "実績売上高 ÷ 予算売上高 × 100"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_revenue} / NULLIF(${total_budget_revenue}, 0) ;;
  }

  measure: cost_variance {
    label: "売上原価差額 (予算差)"
    description: "実績売上原価 − 予算売上原価"
    type: number
    value_format_name: usd
    sql: ${total_actual_cost} - ${total_budget_cost} ;;
  }

  measure: profit_variance {
    label: "営業利益差額 (予算差)"
    description: "実績営業利益 − 予算営業利益"
    type: number
    value_format_name: usd
    sql: ${total_actual_profit} - ${total_budget_profit} ;;
    drill_fields: [detail*]
  }

  measure: profit_budget_achievement_rate {
    label: "営業利益予算比 (予算比)"
    description: "実績営業利益 ÷ 予算営業利益 × 100"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_profit} / NULLIF(${total_budget_profit}, 0) ;;
  }

  measure: actual_cost_rate {
    label: "売上原価率"
    description: "売上原価 ÷ 総売上高 × 100"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_cost} / NULLIF(${total_actual_revenue}, 0) ;;
  }

  measure: actual_profit_rate {
    label: "営業利益率"
    description: "営業利益 ÷ 総売上高 × 100"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_profit} / NULLIF(${total_actual_revenue}, 0) ;;
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
      total_actual_profit,
      profit_budget_achievement_rate
    ]
  }
}
