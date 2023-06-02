json.extract! child, :id, :name, :age, :grade, :user_id, :created_at, :updated_at
json.url child_url(child, format: :json)
