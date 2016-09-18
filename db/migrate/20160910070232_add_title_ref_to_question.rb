class AddTitleRefToQuestion < ActiveRecord::Migration
  def change
  	add_reference :questions, :title, index: true
  end
end
