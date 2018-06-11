class AddNextFieldsToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :prices_text, :text, default: "empty"
    add_column :texts, :prices_bottom_text, :text, default: "empty"
    add_column :texts, :contacts_text, :text, default: "empty"
    add_column :texts, :bookings_bottom_text, :text, default: "empty"
    add_column :texts, :reviews_text, :text, default: "empty"
    add_column :texts, :terms_text, :text, default: "empty"
    add_column :texts, :faqs_text, :text, default: "empty"
    add_column :texts, :about_text, :text, default: "empty"
  end
end
