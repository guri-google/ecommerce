- dashboard: last_week_report
  title: 先週実績レポート
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 先週の主要な売上、注文数、顧客動向、売れ筋カテゴリおよびブランドを一覧化するダッシュボードです。

  filters:
  - name: 注文日
    title: 注文日
    type: field_filter
    default_value: last week
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    field: order_items.created_date

  - name: 商品カテゴリ
    title: 商品カテゴリ
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    field: products.category

  - name: 流入元
    title: 流入元
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    field: users.traffic_source

  elements:
  - title: 総売上
    name: total_sales_single
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 0
    col: 0
    width: 6
    height: 4

  - title: 総注文数
    name: total_orders_single
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.order_count]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 0
    col: 6
    width: 6
    height: 4

  - title: 購入ユーザー数
    name: total_users_single
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 0
    col: 12
    width: 6
    height: 4

  - title: 平均注文金額 (AOV)
    name: avg_order_value_single
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0.00"
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 0
    col: 18
    width: 6
    height: 4

  - title: 日別売上・注文数推移
    name: daily_sales_trend
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_date, order_items.total_sale_price, order_items.order_count]
    sorts: [order_items.created_date asc]
    limit: 500
    query_timezone: Asia/Tokyo
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    y_axes:
    - label: 売上 ($)
      orientation: left
      series:
      - id: order_items.total_sale_price
        name: 総売上
        axisId: order_items.total_sale_price
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label: 注文数
      orientation: right
      series:
      - id: order_items.order_count
        name: 注文数
        axisId: order_items.order_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    series_types:
      order_items.order_count: line
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 4
    col: 0
    width: 16
    height: 8

  - title: 流入元（チャネル）別構成比
    name: sales_by_traffic_source
    model: thelook
    explore: order_items
    type: looker_pie
    fields: [users.traffic_source, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 4
    col: 16
    width: 8
    height: 8

  - title: カテゴリ別売上ランキング TOP 10
    name: top_categories
    model: thelook
    explore: order_items
    type: looker_grid
    fields: [products.category, order_items.total_sale_price, order_items.order_count, order_items.average_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: readable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 12
    col: 0
    width: 12
    height: 8

  - title: ブランド別売上 TOP 10
    name: top_brands
    model: thelook
    explore: order_items
    type: looker_bar
    fields: [products.brand, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_value_labels: true
    listen:
      注文日: order_items.created_date
      商品カテゴリ: products.category
      流入元: users.traffic_source
    row: 12
    col: 12
    width: 12
    height: 8
