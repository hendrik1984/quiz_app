class CreateQuizzes < ActiveRecord::Migration[8.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.string :category
      t.boolean :is_published, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
