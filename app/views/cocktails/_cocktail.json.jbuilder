json.(cocktail, :id, :name, :instructions, :description)
json.createdAt(cocktail.created_at.strftime("%A %B %d, %Y"))
