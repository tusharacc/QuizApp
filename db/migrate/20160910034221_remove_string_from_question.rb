class RemoveStringFromQuestion < ActiveRecord::Migration
  def change
  	remove_column :questions, :string
  end
end
