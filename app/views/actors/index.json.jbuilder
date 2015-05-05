json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :gender, :identity, :email, :facebook_profile, :biography
  json.url actor_url(actor, format: :json)
end
