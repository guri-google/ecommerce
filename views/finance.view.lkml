view: finance {
  sql_table_name: `bq-general-364600.demo.finance` ;;
  view_label: "Finance"

  ########## Attribute Dimensions ##########

  dimension_group: target_month {
    label: "対象年月 (Target Month)"
    description: "損益および予算実績を評価する対象年月。"
    type: time
    timeframes: [raw, date, month, quarter, year]
    convert_tz: false
    datatype: date
    sql: ${TABLE}.Target_Month ;;
  }

  dimension: region {
    label: "地域区分 (Region)"
    description: "事業部・拠点が所属する地域セグメント。"
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: country {
    label: "国名 (Country)"
    description: "事業を展開する対象国名。"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: facility_type {
    label: "拠点種別 (Facility Type)"
    description: "工場、倉庫、営業所などの拠点分類。"
    type: string
    sql: ${TABLE}.Facility_Type ;;
  }

  dimension: facility_name {
    label: "拠点名称 (Facility Name)"
    description: "具体的な事業拠点または工場の名称。"
    type: string
    sql: ${TABLE}.Facility_Name ;;
  }

  dimension: business_unit {
    label: "事業部 (Business Unit)"
    description: "担当するビジネスユニット・事業部門。"
    type: string
    sql: ${TABLE}.Business_Unit ;;
  }

  dimension: application_market {
    label: "適用市場 (Application Market)"
    description: "製品・サービスが提供されるターゲット市場。"
    type: string
    sql: ${TABLE}.Application_Market ;;
  }

  ########## Base Financial Measures ##########

  measure: count {
    label: "レコード件数 (Count)"
    description: "財務データの登録レコード総件数。"
    type: count
    drill_fields: [detail*]
  }

  measure: total_actual_revenue {
    label: "実績売上高 (Total Actual Revenue)"
    description: "SAP等で実際に計上された売上の合計額。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Revenue ;;
    drill_fields: [detail*]
  }

  measure: total_budget_revenue {
    label: "予算売上高 (Total Budget Revenue)"
    description: "当期計画・予算として設定された目標売上高。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Revenue ;;
    drill_fields: [detail*]
  }

  measure: total_actual_cost {
    label: "実績売上原価 (Total Actual Cost)"
    description: "製造にかかる原材料費や工場人件費などの売上原価の実績合計。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Cost ;;
    drill_fields: [detail*]
  }

  measure: total_budget_cost {
    label: "予算売上原価 (Total Budget Cost)"
    description: "計画・予算として設定された売上原価の目標額。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Cost ;;
    drill_fields: [detail*]
  }

  measure: total_actual_profit {
    label: "実績営業利益 (Total Actual Profit)"
    description: "売上高から売上原価等を差し引いた営業利益の実績額。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Actual_Profit ;;
    drill_fields: [detail*]
  }

  measure: total_budget_profit {
    label: "予算営業利益 (Total Budget Profit)"
    description: "計画・予算として設定された営業利益の目標額。"
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Budget_Profit ;;
    drill_fields: [detail*]
  }

  ########## Derived Financial Metrics (Dictionary Derived) ##########

  measure: revenue_variance {
    label: "売上予実差分 (Revenue Variance)"
    description: "実績売上高から予算売上高を差し引いた予実差額 (実績 - 予算)。"
    type: number
    value_format_name: usd
    sql: ${total_actual_revenue} - ${total_budget_revenue} ;;
    drill_fields: [detail*]
  }

  measure: revenue_budget_achievement_rate {
    label: "売上予算達成率 (Revenue Achievement Rate)"
    description: "予算売上高に対する実績売上高の達成割合 (実績 / 予算)。"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_revenue} / NULLIF(${total_budget_revenue}, 0) ;;
  }

  measure: cost_variance {
    label: "コスト予実差分 (Cost Variance)"
    description: "実績コストから予算コストを差し引いた予実差額 (実績 - 予算)。"
    type: number
    value_format_name: usd
    sql: ${total_actual_cost} - ${total_budget_cost} ;;
  }

  measure: profit_variance {
    label: "利益予実差分 (Profit Variance)"
    description: "実績営業利益から予算営業利益を差し引いた予実差額 (実績 - 予算)。"
    type: number
    value_format_name: usd
    sql: ${total_actual_profit} - ${total_budget_profit} ;;
    drill_fields: [detail*]
  }

  measure: profit_budget_achievement_rate {
    label: "利益予算達成率 (Profit Achievement Rate)"
    description: "予算営業利益に対する実績営業利益の達成割合 (実績 / 予算)。"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_profit} / NULLIF(${total_budget_profit}, 0) ;;
  }

  measure: actual_cost_rate {
    label: "実績原価率 (Actual Cost Rate)"
    description: "実績売上高に対する実績売上原価の比率 (実績原価 / 実績売上)。"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${total_actual_cost} / NULLIF(${total_actual_revenue}, 0) ;;
  }

  measure: actual_profit_rate {
    label: "実績利益率 (Actual Profit Margin Rate)"
    description: "実績売上高に対する実績営業利益の比率 (実績利益 / 実績売上)。"
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
