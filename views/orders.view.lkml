view: orders {
  sql_table_name: `thelook_ecommerce.orders` ;;
  drill_fields: [order_id]

  dimension: order_id {
    label: 注文ID (Order ID)
    description: 注文識別ID
    primary_key: yes
    type: number
    sql: ${
    label: 注文ID (Order ID)
    description: 注文識別IDTABLE}.order_id ;;
  }
  dimension_group: created {
    label: 注文作成日時
    description: 注文が作成された日時
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${
    label: 注文作成日時
    description: 注文が作成された日時TABLE}.created_at ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: status {
    label: 注文ステータス (Status)
    description: 処理・配送ステータス
    type: string
    sql: ${
    label: 注文ステータス (Status)
    description: 処理・配送ステータスTABLE}.status ;;
  }
  dimension: user_id {
    label: ユーザーID (User ID)
    description: 注文したユーザーのID
    type: number
    # hidden: yes
    sql: ${
    label: ユーザーID (User ID)
    description: 注文したユーザーのIDTABLE}.user_id ;;
  }
  measure: count {
    label: 注文数 (Order Count)
    description: 総注文数
    type: count
    drill_fields: [order_id, users.last_name, users.id, users.first_name, order_items.count]
  }
}
