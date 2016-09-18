class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :question_attempted
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
