class CreateOrdelMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :ordel_meals do |t|
      t.float :quantity
      t.references :meal, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
