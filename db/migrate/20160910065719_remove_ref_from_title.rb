class RemoveRefFromTitle < ActiveRecord::Migration
  def change
  	remove_reference(:titles, :question, index: true)
  end
end
