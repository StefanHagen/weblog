class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.text :lead
      t.text :body
      t.integer :administrator_id
      t.boolean :published
      
      t.timestamps
    end
  end
end
