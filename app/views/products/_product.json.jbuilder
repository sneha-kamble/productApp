json.extract! product, :id, :name, :model, :brand, :year, :ram, :external_storage, :created_at, :updated_at
json.url product_url(product, format: :json)
