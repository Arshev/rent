class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :text
      t.string :name
      t.string :email
      t.boolean :active
      t.integer :star, default: 1

      t.timestamps
    end
  end
end
