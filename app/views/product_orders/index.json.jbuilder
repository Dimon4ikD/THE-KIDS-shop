json.array!(@product_orders) do |product_order|
  json.extract! product_order, :id, :User_id, :Product_id, :LineItem_id
  json.url product_order_url(product_order, format: :json)
end
