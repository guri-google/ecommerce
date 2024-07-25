test: historic_revenue_is_accurate {
explore_source: order_items {
  column: total_sale_price {
    field: order_items.total_sale_price
  }
  filters: [order_items.created_date: "2017"]
}
assert: revenue_is_expected_value {
  expression: ${order_items.total_sale_price} < 626000 ;;
}
}
