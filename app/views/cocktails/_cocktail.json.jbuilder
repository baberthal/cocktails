json.key_format! camelize: :lower
json.(cocktail, :id, :name, :instructions, :description)
json.createdAt(cocktail.created_at.strftime("%A %B %d, %Y"))

if cocktail.user
  json.user cocktail.user.username
  json.userId cocktail.user.id
end

json.ingredients cocktail.ingredients, :name, :ingredient_type

#  vim: set ts=8 sw=2 tw=0 ft=ruby et :
