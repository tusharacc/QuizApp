class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :string
      t.string :option3
      t.string :option4
      t.string :answer

      t.timestamps null: false
    end
  end
end
