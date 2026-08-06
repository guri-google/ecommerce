view: distribution_centers {
  view_label: "Distribution Centers"
  sql_table_name: `thelook_ecommerce.distribution_centers` ;;
  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: latitude {
    label: 緯度 (Latitude)
    description: 拠点の緯度
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: longitude {
    label: 経度 (Longitude)
    description: 拠点の経度
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }

  dimension: id {
    label: 配送拠点ID (DC ID)
    description: 物流拠点のID
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: 配送拠点名 (DC Name)
    description: 物流ディストリビューションセンターの名称
    sql: ${TABLE}.name ;;
  }
}
