class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
