class AddQuestionRefToTitle < ActiveRecord::Migration
  def change
    add_reference :titles, :question, index: true, foreign_key: true
  end
end
