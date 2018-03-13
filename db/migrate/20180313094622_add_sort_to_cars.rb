class AddSortToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :sort, :integer, default: 0
  end
end
