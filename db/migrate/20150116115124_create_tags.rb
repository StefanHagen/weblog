class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
    add_attachment :tags, :icon
  end
end
