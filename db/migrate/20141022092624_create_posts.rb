class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :lead
      t.text :body
      t.integer :administrator_id

      t.timestamps
    end
  end
end
