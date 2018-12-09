# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MealCategory.create(name: 'Massas')
MealCategory.create(name: 'Saladas')
MealCategory.create(name: 'Sucos')
Meal.create(name: 'Arroz', price: 14.90, description: 'É muito bom',meal_categories_id: 1)
Meal.create(name: 'Feijão', price: 15.90, description: 'Maravilhoso',meal_categories_id: 1)
Meal.create(name: 'Batata', price: 10.90, description: 'Compre, ta barato',meal_categories_id: 2)
Meal.create(name: 'Torta', price: 10.90, description: 'Compre, ta barato',meal_categories_id: 2)
Meal.create(name: 'Suco de Abacaxi', price: 3.90, description: 'feito com polpa de fruta',meal_categories_id: 3)
Meal.create(name: 'Suco de Laranja', price: 4.90, description: 'vindo direto das arvores para sua mesa',meal_categories_id: 3)
