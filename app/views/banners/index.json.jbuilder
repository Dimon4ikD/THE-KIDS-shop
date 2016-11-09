json.array!(@banners) do |banner|
  json.extract! banner, :id, :catalog_id, :image, :frequency
  json.url banner_url(banner, format: :json)
end
