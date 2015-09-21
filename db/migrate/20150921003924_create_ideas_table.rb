class CreateIdeasTable < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text       :idea
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
