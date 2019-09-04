json.extract! coin, :id, :description, :aconym, :url_image, :created_at, :updated_at
json.url coin_url(coin, format: :json)
