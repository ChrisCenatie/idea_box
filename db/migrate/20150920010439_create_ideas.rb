class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea
      add_foreign_key :ideas, :categories
      add_foreign_key :ideas, :users

      t.timestamps null: false
    end
  end
end
