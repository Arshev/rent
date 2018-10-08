class AddFieldsToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :main_h1_text, :text, default: "empty"
    add_column :texts, :main_quick_booking_text, :text, default: "empty"
    add_column :texts, :main_substances_text, :text, default: "empty"
    add_column :texts, :main_car_list_text, :text, default: "empty"
    add_column :texts, :main_services_text, :text, default: "empty"
    add_column :texts, :main_mission_text, :text, default: "empty"
    add_column :texts, :main_edge_text, :text, default: "empty"
    add_column :texts, :footer_text, :text, default: "empty"
  end
end
