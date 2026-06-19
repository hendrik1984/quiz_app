class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.text :text
      t.integer :points, default: 1
      t.integer :order_index

      t.timestamps
    end
  end
end
