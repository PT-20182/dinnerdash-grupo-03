json.extract! meal, :id, :name, :description, :price, :available, :meal_category_id_id, :created_at, :updated_at
json.url meal_url(meal, format: :json)
