class AddPricesToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :old_price_1, :integer
    add_column :cars, :old_price_2, :integer
    add_column :cars, :old_price_3, :integer
    add_column :cars, :old_price_4, :integer
    add_column :cars, :old_price_5, :integer
    add_column :cars, :price_5, :integer
    add_column :cars, :price_hour, :integer
  end
end
