# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MealCategory.create(name: 'Massa')
MealCategory.create(name: 'Salada')
Meal.create(name: 'Macarrão', price:'12,90', description: 'sugoi')
Meal.create(name: 'Pão', price:'12,90', description: 'sugoi',meal_categories_id: 1)