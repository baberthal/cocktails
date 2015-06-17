json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id
  json.url ingredient_url(ingredient, format: :json)
end
#  vim: set ts=8 sw=2 tw=0 ft=ruby et :
