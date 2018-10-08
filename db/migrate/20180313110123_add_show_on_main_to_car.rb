class AddShowOnMainToCar < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :show_on_main, :boolean, default: false
  end
end
