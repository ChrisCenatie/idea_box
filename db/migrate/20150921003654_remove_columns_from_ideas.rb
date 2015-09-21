class RemoveColumnsFromIdeas < ActiveRecord::Migration
  def change
    drop_table :ideas
  end
end
