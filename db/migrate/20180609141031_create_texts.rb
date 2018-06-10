class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.text :main_up_text, default: 'Дорогой друг, добро пожаловать в автопрокат </span><span style="font-size:22px;">Амиго!</span>'

      t.timestamps
    end
  end
end
