class AddMetatagsToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :home_title, :text, default: "empty"
    add_column :texts, :home_description, :text, default: "empty"
    add_column :texts, :cars_title, :text, default: "empty"
    add_column :texts, :cars_description, :text, default: "empty"
    add_column :texts, :prices_title, :text, default: "empty"
    add_column :texts, :prices_description, :text, default: "empty"
    add_column :texts, :contacts_title, :text, default: "empty"
    add_column :texts, :contacts_description, :text, default: "empty"
    add_column :texts, :bookings_title, :text, default: "empty"
    add_column :texts, :bookings_description, :text, default: "empty"
    add_column :texts, :reviews_title, :text, default: "empty"
    add_column :texts, :reviews_description, :text, default: "empty"
    add_column :texts, :terms_title, :text, default: "empty"
    add_column :texts, :terms_description, :text, default: "empty"
    add_column :texts, :faqs_title, :text, default: "empty"
    add_column :texts, :faqs_description, :text, default: "empty"
    add_column :texts, :abouts_title, :text, default: "empty"
    add_column :texts, :abouts_description, :text, default: "empty"
  end
end
