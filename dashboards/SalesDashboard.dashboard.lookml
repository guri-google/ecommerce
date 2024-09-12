- dashboard: Sales_Dashboard
  title: 前年実績レポート_LookML
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VWqlktuzc98TrhLpwCWH2y
  elements:
  - title: 月別売上
    name: 月別売上
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters: {}
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: 売上}], showLabels: true, showValues: true,
        valueFormat: '$0, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      注文日: order_items.created_year
    row: 9
    col: 0
    width: 12
    height: 8
  - title: 売上サマリ
    name: 売上サマリ
    model: thelook
    explore: order_items
    type: explore_assitant::query_insights
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters: {}
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      注文日: order_items.created_year
    row: 4
    col: 0
    width: 12
    height: 5
  - title: 月別粗利
    name: 月別粗利
    model: thelook
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.total_gross_margin]
    fill_fields: [order_items.created_month]
    filters: {}
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_gross_margin,
            id: order_items.total_gross_margin, name: 粗利}], showLabels: true, showValues: true,
        valueFormat: '$0, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 9
    col: 12
    width: 12
    height: 8
  - title: 粗利サマリ
    name: 粗利サマリ
    model: thelook
    explore: order_items
    type: explore_assitant::query_insights
    fields: [order_items.created_month, order_items.total_gross_margin]
    fill_fields: [order_items.created_month]
    filters: {}
    sorts: [order_items.created_month desc]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 4
    col: 12
    width: 12
    height: 5
  - title: 売上
    name: 売上
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: $0.00,, "M"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: 売上}], showLabels: true, showValues: true,
        valueFormat: '$0, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      注文日: order_items.created_year
    row: 0
    col: 0
    width: 8
    height: 4
  - title: 粗利
    name: 粗利
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_margin]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: $0.00,, "M"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: 売上}], showLabels: true, showValues: true,
        valueFormat: '$0, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 0
    col: 8
    width: 8
    height: 4
  - title: 粗利率
    name: 粗利率
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_margin_percentage]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.0%
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: 売上}], showLabels: true, showValues: true,
        valueFormat: '$0, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 0
    col: 16
    width: 8
    height: 4
  - title: ブランド別売上
    name: ブランド別売上
    model: thelook
    explore: order_items
    type: looker_bar
    fields: [order_items.total_sale_price, products.brand]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 20
    column_limit: 100
    total: true
    query_timezone: Asia/Tokyo
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $0, "K"
    series_labels: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 22
    col: 0
    width: 12
    height: 13
  - title: 新しいタイル
    name: 新しいタイル
    model: thelook
    explore: order_items
    type: explore_assitant::query_insights
    fields: [order_items.total_sale_price, products.brand]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 20
    column_limit: 100
    total: true
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    legend_position: center
    label_value_format: $0, "K"
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 17
    col: 0
    width: 12
    height: 5
  - title: 国別売上
    name: 国別売上
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.country]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 20
    column_limit: 100
    total: true
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 22
    col: 12
    width: 12
    height: 13
  - title: 新しいタイル
    name: 新しいタイル (2)
    model: thelook
    explore: order_items
    type: explore_assitant::query_insights
    fields: [order_items.total_sale_price, users.country]
    filters: {}
    sorts: [order_items.total_sale_price desc]
    limit: 20
    column_limit: 100
    total: true
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $0, "K"
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hidden_pivots: {}
    listen:
      注文日: order_items.created_year
    row: 17
    col: 12
    width: 12
    height: 5
  filters:
  - name: 注文日
    title: 注文日
    type: field_filter
    default_value: last year
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.created_year
