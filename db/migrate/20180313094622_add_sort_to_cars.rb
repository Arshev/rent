class AddSortToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :sort, :integer, default: 0
    add_column :cars, :show_on_main, :boolean, default: false
  end
end
