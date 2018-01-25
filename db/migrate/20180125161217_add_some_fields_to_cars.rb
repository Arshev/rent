class AddSomeFieldsToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :fuel, :string
    add_column :cars, :number_doors, :integer
  end
end
