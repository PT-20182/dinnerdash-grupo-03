# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MealCategory.create(name: 'Massa')
MealCategory.create(name: 'Salada')
Meal.create(name: 'Pão', price:'13,90', description: 'sugoi',meal_categories_id: 1)
Meal.create(name: 'Arroz', price:'14,90', description: 'É muito bom',meal_categories_id: 1)
Meal.create(name: 'Feijão', price:'15,90', description: 'Maravilhoso',meal_categories_id: 1)
Meal.create(name: 'Batat', price:'10,90', description: 'Compre, ta barato',meal_categories_id: 1)
Meal.create(name: 'Azul', price:'10,90', description: 'Compre, ta barato',meal_categories_id: 2)