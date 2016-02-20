json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :HyTML, :description
  json.url catalog_url(catalog, format: :json)
end
