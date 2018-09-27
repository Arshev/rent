class AddPriceDateToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :price_date, :string
  end
end
