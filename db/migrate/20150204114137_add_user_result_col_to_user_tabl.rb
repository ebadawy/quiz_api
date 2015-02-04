class AddUserResultColToUserTabl < ActiveRecord::Migration
  def change
  	add_column "users", "user_result", :integer
  end
end
