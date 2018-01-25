class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :car_name
      t.integer :year
      t.string :color
      t.string :transmission
      t.boolean :is_air
      t.string :engine_capacity
      t.boolean :is_electropackage
      t.string :car_class
      t.string :car_type
      t.integer :price_1
      t.integer :price_2
      t.integer :price_3
      t.integer :price_4
      t.string :price_main
      t.integer :deposit
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
