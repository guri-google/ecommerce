- dashboard: budget_vs_actual_report
  title: 財務予実分析レポート
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 事業部・地域・拠点ごとの売上・コスト・利益の予算、実績、予実差額、および予算達成率を一元管理するダッシュボードです。

  filters:
  - name: 対象年月
    title: 対象年月
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: finance
    field: finance.target_month_date

  - name: 地域区分
    title: 地域区分
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: finance
    field: finance.region

  - name: 事業部
    title: 事業部
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: finance
    field: finance.business_unit

  - name: 拠点種別
    title: 拠点種別
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: finance
    field: finance.facility_type

  elements:
  - title: 実績売上高
    name: total_actual_revenue_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.total_actual_revenue]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 0
    col: 0
    width: 6
    height: 4

  - title: 予算売上高
    name: total_budget_revenue_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.total_budget_revenue]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 0
    col: 6
    width: 6
    height: 4

  - title: 売上差額 (予算差)
    name: revenue_variance_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.revenue_variance]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 0
    col: 12
    width: 6
    height: 4

  - title: 売上予算比 (予算比)
    name: revenue_achievement_rate_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.revenue_budget_achievement_rate]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "0.0%"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 0
    col: 18
    width: 6
    height: 4

  - title: 実績営業利益
    name: total_actual_profit_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.total_actual_profit]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 4
    col: 0
    width: 6
    height: 4

  - title: 予算営業利益
    name: total_budget_profit_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.total_budget_profit]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 4
    col: 6
    width: 6
    height: 4

  - title: 営業利益差額 (予算差)
    name: profit_variance_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.profit_variance]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "$#,##0"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 4
    col: 12
    width: 6
    height: 4

  - title: 営業利益予算比 (予算比)
    name: profit_achievement_rate_single
    model: thelook
    explore: finance
    type: single_value
    fields: [finance.profit_budget_achievement_rate]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    value_format: "0.0%"
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 4
    col: 18
    width: 6
    height: 4

  - title: 月別売上予実推移および達成率
    name: monthly_sales_trend
    model: thelook
    explore: finance
    type: looker_column
    fields: [finance.target_month_month, finance.total_actual_revenue, finance.total_budget_revenue, finance.revenue_budget_achievement_rate]
    sorts: [finance.target_month_month asc]
    limit: 500
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
      - id: finance.total_actual_revenue
        name: 総売上高 (実績)
        axisId: finance.total_actual_revenue
      - id: finance.total_budget_revenue
        name: 総売上高 (予算)
        axisId: finance.total_budget_revenue
      showLabels: true
      showValues: true
      unpinAxis: false
      type: linear
    - label: 達成率
      orientation: right
      series:
      - id: finance.revenue_budget_achievement_rate
        name: 売上予算比 (予算比)
        axisId: finance.revenue_budget_achievement_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      type: linear
    series_types:
      finance.revenue_budget_achievement_rate: line
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 8
    col: 0
    width: 14
    height: 8

  - title: 事業部別売上・利益予実状況
    name: business_unit_performance
    model: thelook
    explore: finance
    type: looker_bar
    fields: [finance.business_unit, finance.total_actual_revenue, finance.total_budget_revenue, finance.total_actual_profit, finance.total_budget_profit]
    sorts: [finance.total_actual_revenue desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    show_value_labels: true
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 8
    col: 14
    width: 10
    height: 8

  - title: 拠点別詳細予実テーブル
    name: facility_performance_grid
    model: thelook
    explore: finance
    type: looker_grid
    fields: [finance.region, finance.country, finance.facility_name, finance.business_unit, finance.total_actual_revenue, finance.total_budget_revenue, finance.revenue_variance, finance.revenue_budget_achievement_rate, finance.total_actual_profit, finance.profit_variance, finance.actual_profit_rate]
    sorts: [finance.total_actual_revenue desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: readable
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    listen:
      対象年月: finance.target_month_date
      地域区分: finance.region
      事業部: finance.business_unit
      拠点種別: finance.facility_type
    row: 16
    col: 0
    width: 24
    height: 10
