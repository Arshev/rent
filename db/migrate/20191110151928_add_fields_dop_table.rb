class AddFieldsDopTable < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :dop_table_worktime, :text, default: "empty"
    add_column :texts, :dop_table_endtime, :text, default: "empty"
    add_column :texts, :dop_table_city_price_worktime, :text, default: "empty"
    add_column :texts, :dop_table_city_price_endtime, :text, default: "empty"
    add_column :texts, :dop_table_aero_price_worktime, :text, default: "empty"
    add_column :texts, :dop_table_aero_price_endtime, :text, default: "empty"
    add_column :texts, :dop_table_svetlogorsk_price_worktime, :text, default: "empty"
    add_column :texts, :dop_table_svetlogorsk_price_endtime, :text, default: "empty"
    add_column :texts, :dop_table_zelenogradsk_price_worktime, :text, default: "empty"
    add_column :texts, :dop_table_zelenogradsk_price_endtime, :text, default: "empty"
    add_column :texts, :dop_table_kosa_price_worktime, :text, default: "empty"
    add_column :texts, :dop_table_kosa_price_endtime, :text, default: "empty"
    add_column :texts, :dop_table_kreslo_dayprice, :text, default: "empty"
    add_column :texts, :dop_table_kreslo_allprice, :text, default: "empty"
    add_column :texts, :dop_table_navigator_dayprice, :text, default: "empty"
    add_column :texts, :dop_table_downtext, :text, default: "empty"
  end
end
