json.array!(@users) do |user|
  json.extract! user, :name, :address, :city, :state, :country, :zipcode, :useremail, :password, :aboutme, :interests
  json.url user_url(user, format: :json)
end