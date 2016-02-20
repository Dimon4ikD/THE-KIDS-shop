json.array!(@products) do |product|
  json.extract! product, :id, :name, :amount, :cover, :price, :Catalog_id
  json.url product_url(product, format: :json)
end
