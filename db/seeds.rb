Cocktail.destroy_all
Ingredient.destroy_all
User.destroy_all

User.create!(username: "Morgan", email: "morgan@jmorgan.org", password: "kbner7xL")
p "Created 1 user"

Cocktail.create!([
  {
    name: "Margarita",
    description: 'A classic margarita.',
    user: User.first
  },
  {
    name: "Manhattan",
    description: 'A classic manhattan.',
    user: User.first
  },
  {
    name: "Singapore Sling",
    description: 'A refreshing gin-based cocktail that is great on a hot day.',
    user: User.first
  },
  {
    name: "Moscow Mule",
    description: 'A ginger beer and vodka cocktial served in a copper mug.',
    user: User.first
  }
])

p "Created #{Cocktail.count} cocktail recipes"

Ingredient.create!([
  {name: 'Vodka', ingredient_type: 'Spirit'},
  {name: 'Whiskey', ingredient_type: 'Spirit'},
  {name: 'Sweet Vermouth', ingredient_type: 'Aperitif'},
  {name: 'Lime Juice', ingredient_type: 'Fruit Juice'},
  {name: 'Gin', ingredient_type: 'Spirit'},
  {name: 'Sour Mix', ingredient_type: 'Mixer'},
  {name: 'Lime', ingredient_type: 'Fruit'},
  {name: 'Ginger Beer', ingredient_type: 'Mixer'},
  {name: 'Triple Sec', ingredient_type: 'Liqueur'},
  {name: 'Cherry Brandy', ingredient_type: 'Liqueur'},
  {name: 'Cointreau', ingredient_type: 'Liqueur'},
  {name: 'Benedictine', ingredient_type: 'Liqueur'},
  {name: 'Grenadine', ingredient_type: 'Mixer'},
  {name: 'Pineapple Juice', ingredient_type: 'Fruit Juice'},
  {name: 'Angostura Bitters', ingredient_type: 'Bitters'},
  {name: 'Tequila', ingredient_type: 'Spirit'}
])

p "Created #{Ingredient.count} ingredients"

Cocktail.first.ingredients << [Ingredient.find_by(name: "Lime Juice"), Ingredient.last, Ingredient.find_by(name: "Cointreau")]
Cocktail.last.ingredients << [Ingredient.first, Ingredient.find_by(name: "Lime Juice"), Ingredient.find_by(name: "Ginger Beer")]

p "Added ingredients to #{Cocktail.first.name}, #{Cocktail.last.name}"


#  vim: set ts=8 sw=2 tw=0 ft=ruby et :
