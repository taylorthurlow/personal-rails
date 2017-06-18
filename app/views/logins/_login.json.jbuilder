json.extract! login, :id, :username, :password_digest, :created_at, :updated_at
json.url login_url(login, format: :json)
