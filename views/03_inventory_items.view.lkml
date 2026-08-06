view: inventory_items {
  sql_table_name: `thelook_ecommerce.inventory_items` ;;
  view_label: "Inventory Items"
  ## DIMENSIONS ##

  dimension: id {
    label: 在庫ID (Inventory ID)
    description: 個別の在庫アイテムID
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    label: 仕入原価 (Cost)
    description: 商品の仕入原価金額
    type: number
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    label: "Created"
    type: time
    timeframes: [time, date, week, month, raw]
    #sql: cast(CASE WHEN ${TABLE}.created_at = "\\N" THEN NULL ELSE ${TABLE}.created_at END as timestamp) ;;
    sql: CAST(${TABLE}.created_at AS TIMESTAMP) ;;
  }

  dimension: product_id {
    label: "Product ID"
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    label: "Sold"
    type: time
    timeframes: [time, date, week, month, raw]
#    sql: cast(CASE WHEN ${TABLE}.sold_at = "\\N" THEN NULL ELSE ${TABLE}.sold_at END as timestamp) ;;
    sql: ${TABLE}.sold_at ;;
  }

  dimension: is_sold {
    label: 販売済フラグ (Is Sold)
    description: 売約・販売済みかどうか
    type: yesno
    sql: ${sold_raw} is not null ;;
  }

  dimension: days_in_inventory {
    label: "Days in Inventory"
    description: "days between created and sold date"
    type: number
    sql: TIMESTAMP_DIFF(coalesce(${sold_raw}, CURRENT_TIMESTAMP()), ${created_raw}, DAY) ;;
  }

  dimension: days_in_inventory_tier {
    label: "Days In Inventory Tier"
    type: tier
    sql: ${days_in_inventory} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
  }

  dimension: days_since_arrival {
    label: "Days Since Arrival"
    description: "days since created - useful when filtering on sold yesno for items still in inventory"
    type: number
    sql: TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), ${created_raw}, DAY) ;;
  }

  dimension: days_since_arrival_tier {
    label: "Days Since Arrival Tier"
    type: tier
    sql: ${days_since_arrival} ;;
    style: integer
    tiers: [0, 5, 10, 20, 40, 80, 160, 360]
  }

  dimension: product_distribution_center_id {
    label: "Product Distribution Center ID"
    hidden: yes
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  ## MEASURES ##

  measure: sold_count {
    label: "Sold Count"
    type: count
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "Yes"
    }
  }

  measure: sold_percent {
    label: "Sold Percent"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${sold_count}/(CASE WHEN ${count} = 0 THEN NULL ELSE ${count} END) ;;
  }

  measure: total_cost {
    label: 総仕入原価 (Total Cost)
    description: 全在庫アイテムの原価合計
    type: sum
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: average_cost {
    label: "Average Cost"
    type: average
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: count {
    label: 在庫数量 (Inventory Count)
    description: 在庫アイテムの総数
    type: count
    drill_fields: [detail*]
  }

  measure: number_on_hand {
    label: "Number On Hand"
    type: count
    drill_fields: [detail*]

    filters: {
      field: is_sold
      value: "No"
    }
  }

  measure: stock_coverage_ratio {
    label: "Stock Coverage Ratio"
    type:  number
    description: "Stock on Hand vs Trailing 28d Sales Ratio"
    sql:  1.0 * ${number_on_hand} / nullif(${order_items.count_last_28d}*20.0,0) ;;
    value_format_name: decimal_2
    html: <p style="color: black; background-color: rgba({{ value | times: -100.0 | round | plus: 250 }},{{value | times: 100.0 | round | plus: 100}},100,80); font-size:100%; text-align:center">{{ rendered_value }}</p> ;;
  }

  set: detail {
    fields: [id, products.item_name, products.category, products.brand, products.department, cost, created_time, sold_time]
  }
}
