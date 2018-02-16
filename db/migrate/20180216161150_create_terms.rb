class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.text :text

      t.timestamps
    end
  end
end
