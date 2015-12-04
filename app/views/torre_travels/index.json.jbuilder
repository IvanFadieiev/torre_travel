json.array!(@torre_travels) do |torre_travel|
  json.extract! torre_travel, :id, :housing, :price, :distance, :description, :lang
  json.url torre_travel_url(torre_travel, format: :json)
end
