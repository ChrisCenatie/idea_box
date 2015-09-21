class AddUsersToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :user_id, :integer
    add_column :ideas, :category_id, :integer
  end
end
