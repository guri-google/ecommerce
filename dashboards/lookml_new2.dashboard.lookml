---
- dashboard: new_test
  title: New Test
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: PVQvVn2ihMsZumjMT8W5ik
  elements:
  - title: New Test
    name: New Test
    model: thelook
    explore: order_items
    type: looker_google_map
    fields: [users.country, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    query_timezone: Asia/Tokyo
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
